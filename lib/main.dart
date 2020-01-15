import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Fluter"),
        centerTitle: true,
      ),
      drawer: Container(
        color: Colors.green,
      ),
      body: Container(
        color: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}