import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:firebase_app_check/firebase_app_check.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: 'recaptcha-v3-site-key',
    androidProvider: AndroidProvider.debug,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("my app")),
      body: api(),
    );
  }
}

class api extends StatelessWidget {
  String url = "https://pokeapi.co/api/v2/pokemon/ditto";

  Future<http.Response> fetchPost() {
    return http.get('https://pokeapi.co/api/v2/pokemon/ditto' as Uri);
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
