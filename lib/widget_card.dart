import 'package:flutter/material.dart';

class WidgetCard extends StatefulWidget {
  const WidgetCard({Key key}) : super(key: key);


  @override
  State<WidgetCard> createState() => _WidgetCardState();
}

class _WidgetCardState extends State<WidgetCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      height: 100.0,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            ListTile(
              title: Text('80'),
              subtitle: Text('sunny'),
            ),
          ],
        ),

      ),
    );
  }
}
