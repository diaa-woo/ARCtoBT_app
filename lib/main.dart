import 'dart:convert';

import 'package:arctobt_app/page/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ARC to BT',
      home: Login(),
    );
  }
}



