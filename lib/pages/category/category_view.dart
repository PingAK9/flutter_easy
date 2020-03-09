import 'package:flutter/material.dart';
import 'package:flutter_easy/core/config.dart';
import 'package:flutter_easy/core/menu.dart';

class CategoryView extends StatefulWidget {
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Category'),
      ),
      body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(15),
              sliver: _buildCategory(),
            ),
          ]),
    );
  }

  Widget _buildCategory() {
    final double width = MediaQuery.of(context).size.width - 30;
    final int column = (width / 100).floor();
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (_, index) {
          return _buildItem(myCategory[index]);
        },
        childCount: myCategory.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: column,
      ),
    );
  }

  Widget _buildItem(Category item) {
    return Container(
      height: 100,
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, item.router);
            },
            child: Container(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Icon(item.icon),
              ),
            ),
          ),
          Container(
            height: 10,
          ),
          Container(
            width: 80,
            child: Text(
              item.title ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
