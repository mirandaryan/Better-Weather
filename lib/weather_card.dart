import 'package:flutter/material.dart';


class WeatherCard extends StatefulWidget {
  const WeatherCard({Key key}) : super(key: key);

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.cloudy_snowing),
              title: Text('37F'),
              subtitle: Text('New York City - Rain'),
            ),
          ],
        ),

      ),
    );
  }
}
