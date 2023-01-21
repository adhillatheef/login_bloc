import 'package:flutter/material.dart';
import 'package:login_bloc/src/bloc/bloc.dart';

class Provider extends InheritedWidget{
  Provider({super.key, required super.child});
  // Provider({required Key key, required Widget child}):super(key: key,child: child);
  final bloc = Bloc();
  @override
  bool updateShouldNotify(_) => true;
  static Bloc of(BuildContext context){
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider).bloc;
  }
}