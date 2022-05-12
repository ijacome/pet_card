import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pet_card/api/authentication.dart';
import 'package:pet_card/models/session.dart';
import 'package:pet_card/models/user.dart';

class AuthenticationClient {
  final FlutterSecureStorage _secureStorage;
  final Authentication _authenticationApi;

  AuthenticationClient(this._secureStorage, this._authenticationApi);

  Future<String?> get accessToken async {
    final data = await _secureStorage.read(key: 'SESSION');
    if (data != null) {
      final session = Session.fromJson(jsonDecode(data));
      final DateTime currentDate = DateTime.now();
      final DateTime createdAt = session.createdAt;
      final int expiredIn = session.expiresIn;
      final int diff = currentDate.difference(createdAt).inSeconds;
      if (expiredIn - diff >= 60) {
        return session.token;
      }
      final response = await _authenticationApi.refreshToken(session.token, session.user);
      if (response.data != null) {
        saveSession(response.data);
        return response.data!.token;
      }
    }

    return null;
  }

  Future<User?> get user async {
    final data = await _secureStorage.read(key: 'SESSION');
    if (data != null) {
      final session = Session.fromJson(jsonDecode(data));
      return session.user;
    }

    return null;
  }

  Future<void> saveSession(authenticationResponse) async {
    final Session session = Session(
      token: authenticationResponse.token,
      expiresIn: authenticationResponse.expiresIn,
      createdAt: DateTime.now(),
      user: User.fromJson(authenticationResponse.user)
    );

    final data = jsonEncode(session.toJson());
    await _secureStorage.write(key: 'SESSION', value: data);
  }

  Future<void> signOut() async {
    await _secureStorage.deleteAll();
  }
}