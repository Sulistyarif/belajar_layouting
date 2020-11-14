import 'package:belajar_layouting/src/parsingjsonhttp.dart';
import 'package:flutter/material.dart';
import 'package:belajar_layouting/src/parsingjson.dart';

void main() => runApp(ListViewAPI());

class TestView extends StatefulWidget {
  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            child: Text('Buat Ngetest View'),
          ),
        ),
      ),
    );
  }
}



