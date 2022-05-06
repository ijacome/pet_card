class AuthenticationResponse {
  final String token;
  final int expiresIn;
  final Map<String, dynamic> user;

  AuthenticationResponse({
    required this.token,
    required this.expiresIn,
    required this.user,
  });

  static AuthenticationResponse fromJson(Map<String, dynamic> json) {
    return AuthenticationResponse(
      token: json['access_token'],
      expiresIn: json['expires_in'],
      user: json['user'],
    );
  }
}