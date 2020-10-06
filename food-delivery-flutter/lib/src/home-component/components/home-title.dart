import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  final titleStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('What would', style: titleStyle,),
              Text('you like to eat? ', style: titleStyle),
            ],
          ),
          Icon(Icons.notifications_none, size: 32,color: Theme.of(context).primaryColor,)
        ],
      ),
    );
  }
}
