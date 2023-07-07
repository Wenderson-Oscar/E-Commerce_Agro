import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:myapp/page/login.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce-Agro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto', // Define a fonte padrão do aplicativo
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 16), // Aumenta o tamanho da fonte para 16
        ),
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Login(),
        ),
      ),
    );
  }
}

