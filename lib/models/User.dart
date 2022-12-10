import 'package:better_weather/models/Widget.dart';

class User {

  final String uid;


  User({ required this.uid });

}

class UserData {

  final String uid;
  final String location;
  final List<String> widgetList;

  UserData({ required this.uid, required this.location, required this.widgetList });

}