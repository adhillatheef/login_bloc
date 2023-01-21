import 'package:flutter/material.dart';
import 'package:login_bloc/src/provider.dart';
import 'package:login_bloc/src/screens/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Provider(
      child: const MaterialApp(
        title: 'Log me in',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
