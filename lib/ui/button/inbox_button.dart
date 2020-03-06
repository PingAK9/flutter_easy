import 'package:flutter/material.dart';

class InboxButton extends StatelessWidget {
  const InboxButton({this.color = Colors.white});

  final Color color;

  @override
  Widget build(BuildContext context) {
    const int count = 0;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/inbox-view');
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Icon(
              count == 0 ? Icons.notifications : Icons.notifications_active,
              color: color,
            ),
            if (count > 0)
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.topRight,
                child: Container(
                  width: count < 10 ? 14 : 18,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: Text(
                    count < 10 ? count.toString() : '9+',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
