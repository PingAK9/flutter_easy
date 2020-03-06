import 'package:flutter/material.dart';

class PatternButton extends StatelessWidget {
  const PatternButton(
      {@required this.title,
      @required this.icon,
      this.color = Colors.white,
      this.callback});

  final String title;
  final Color color;
  final IconData icon;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
          image: const DecorationImage(
            image: AssetImage('assets/images/ui/pattern-small.png'),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withAlpha(50),
              offset: const Offset(1, 4),
              blurRadius: 5,
            ),
          ]),
      child: FlatButton(
        onPressed: callback,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: Icon(icon, color: color, size: 30,),
            )
          ],
        ),
      ),
    );
  }
}
