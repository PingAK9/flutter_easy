import 'package:flutter/material.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Information'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[],
        ),
      ),
    );
  }
}
