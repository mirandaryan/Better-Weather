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
      height: 200.0,
      padding: const EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color:Colors.white,
        boxShadow: [
      BoxShadow(
      color: Colors.grey.withOpacity(0.3),
      spreadRadius: 1,
      blurRadius: 2,
      offset: const Offset(0,1),
      ),
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          ListTile(
            leading: Icon(Icons.sunny_snowing, size: 100.0,),
            title: Center(
              child: Text(
                '37F',
                style: TextStyle(
                  fontSize: 80.0,
                ),
              ),
            ),
            subtitle: Center(
              child: Text('New York City - Rain', style: TextStyle(fontSize: 20.0),),
            ),
          ),
        ],

      ),
    );
  }
}
