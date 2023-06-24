import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/controller/utils.dart';
import 'package:myapp/page/login.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
	return MaterialApp(
		title: 'E-commerce-Agro',
		debugShowCheckedModeBanner: false,
		scrollBehavior: MyCustomScrollBehavior(),
		theme: ThemeData(
		primarySwatch: Colors.green,
		),
		home: Scaffold(
		body: SingleChildScrollView(
			child: Login(),
		),
		),
	);
	}
}
