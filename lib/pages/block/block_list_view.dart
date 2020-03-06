import 'package:flutter/material.dart';
import 'package:flutter_easy/pages/block/block_highlight.dart';
import 'package:flutter_easy/pages/block/block_shadow.dart';

class BlockListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Container'),),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: const <Widget>[
          BlockShadow(
            child: SizedBox(height: 100),
          ),
          SizedBox(height: 20),
          BlockHighlight(child: SizedBox(height: 100)),
        ],
      ),
    );
  }
}
