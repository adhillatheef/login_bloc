import 'package:flutter/material.dart';
import 'package:login_bloc/src/bloc/bloc.dart';

import '../provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(20),
      child: SafeArea(
        child: Column(
          children: [
            emailField(context),
            const SizedBox(
              height: 20,
            ),
            passwordField(context),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                child: submitButton(context))
          ],
        ),
      ),
    );
  }

  Widget emailField(BuildContext context) {
    final bloc = Provider.of(context);
    return  StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot){
        return  TextField(
          keyboardType: TextInputType.emailAddress,
          decoration:  InputDecoration(
              labelText: 'Email',
              hintText: 'you@email.com',
              errorText: snapshot.error?.toString(),
              border: OutlineInputBorder()
          ),
          onChanged: bloc.changeEmail,
        );
      }
    );
  }

  Widget passwordField(BuildContext context) {
    final bloc = Provider.of(context);
    return  StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot){
          return  TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Password',
                errorText: snapshot.error?.toString(),
                border: const OutlineInputBorder()
            ),
          );
        }
    );
  }

  Widget submitButton(BuildContext context){
    final bloc = Provider.of(context);
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, snapshot){
          return  ElevatedButton(onPressed:snapshot.error != null ? null: (){
            bloc.submit();
          },
              child:const Text('Log In'));
        }
    );
  }
}
