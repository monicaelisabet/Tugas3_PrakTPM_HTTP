import 'package:flutter/material.dart';
import 'apidata.dart';
import 'pagelist.dart';
import 'product_model.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prak_TPM_HTTP',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: PageList(),
    );
  }
}



