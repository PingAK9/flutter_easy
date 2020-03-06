import 'package:flutter/material.dart';

class ViewMoreTitle extends StatelessWidget {
  const ViewMoreTitle({@required this.title, this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    if (onPressed != null) {
      return InkWell(
        onTap: onPressed,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: _builtTitle(context),
              ),
              Container(
                width: 75,
                height: 22,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'View more',
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Icon(
                      Icons.navigate_next,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return _builtTitle(context);
    }
  }

  Widget _builtTitle(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black54),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
