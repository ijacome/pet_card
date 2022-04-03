import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pet_card/data/environment.dart';
import 'package:pet_card/helpers/dependency_injection.dart';
import 'package:pet_card/helpers/http_response.dart';
import 'package:pet_card/repositories/auth.dart';
import 'package:pet_card/utils/dialogs.dart';
import 'package:logger/logger.dart';

Future<void> main() async {
  await dotenv.load(
    fileName: Environment.fileName,
  );
  DependencyInjection.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final Logger _logger = Logger();

  final Auth _authentication = Auth();

  Future<void> _incrementCounter() async {
    ProgressDialog.show(context);
    final HttpResponse response = await _authentication.register(email: "vin1g@mail.com", password: "Academia1");
    ProgressDialog.dismiss(context);
    if (response.data != null) {
      _logger.i(response.data);
    } else {
      Dialogs.alert(context, title: "Error", description: response.error!.message);
    }
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$_counter'),
            Text(Environment.apiUrl.toString())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
