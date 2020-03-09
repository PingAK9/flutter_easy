import 'package:flutter/material.dart';
import 'package:flutter_easy/demo/animation/pumping_icon/pumping_icon.dart';
import 'package:flutter_easy/pages/fancy_bottom_navigation/fancy_bottom_navigation_item.dart';

class FancyBottomNavigation extends StatefulWidget {
  final int currentIndex;
  final double iconSize;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;
  final List<FancyBottomNavigationItem> items;
  final ValueChanged<int> onItemSelected;

  FancyBottomNavigation(
      {this.currentIndex = 0,
      this.iconSize = 24,
      this.activeColor,
      this.inactiveColor,
      this.backgroundColor,
      @required this.items,
      @required this.onItemSelected}) {
    assert(items != null);
    assert(onItemSelected != null);
  }

  @override
  _FancyBottomNavigationState createState() => _FancyBottomNavigationState();
}

class _FancyBottomNavigationState extends State<FancyBottomNavigation> {
  int _selectIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectIndex = widget.currentIndex;
  }

  var _activeColor;
  var _backgroundColor;

  @override
  Widget build(BuildContext context) {
    _activeColor = widget.activeColor ?? Theme.of(context).accentColor;
    _backgroundColor =
        widget.backgroundColor ?? Theme.of(context).backgroundColor;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 56,
      padding: EdgeInsets.fromLTRB(8, 8, 6, 6),
      decoration: BoxDecoration(
          color: _backgroundColor,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: widget.items.map((item) {
          var index = widget.items.indexOf(item);

          return GestureDetector(
            onTap: () {
              widget.onItemSelected(index);
              setState(() {
                _selectIndex = index;
              });
            },
            child: _buildItem(item, _selectIndex == index),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildItem(FancyBottomNavigationItem item, bool isSelected) {
    return AnimatedContainer(
      width: isSelected ? 124 : 50,
      height: double.maxFinite,
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              color: _activeColor,
              borderRadius: const BorderRadius.all(Radius.circular(50)),
            ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: isSelected
                ? PumpingIcon(
                    item.icon,
                    size: widget.iconSize,
                    color: _backgroundColor,
                  )
                : Icon(
                    item.icon,
                    size: widget.iconSize,
                    color: widget.inactiveColor,
                  ),
          ),
          if (isSelected)
            Center(
              child: Text(
                item.title,
                style: TextStyle(color: _backgroundColor),
              ),
            ),
        ],
      ),
    );
  }
}
