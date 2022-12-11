//import 'package:better_weather/models/Widget.dart';

class User {

  final String uid;


  User({ this.uid });

}

class UserData {

  final String uid;
  final String location;
  final List<String> widgetList;

  UserData({  this.uid,  this.location,  this.widgetList });

}