import 'dart:convert';

//import 'package:better_weather/models/Widget.dart';
//import 'package:better_weather/models/User.dart';
import 'package:better_weather/models/WeatherData.dart';
import 'package:http/http.dart' as http;
//import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future<DataResponse> getWeather(String city) async
  {
    // weather calls
    // https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=cf043d4b558f03c1e5d58cc16eb82150
    // geocoding calls
    // http://api.openweathermap.org/geo/1.0/direct?q={city name},{state code},{country code}&limit={limit}&appid=cf043d4b558f03c1e5d58cc16eb82150

    //translating user input from city search bar into lat and lon coords
    final geocodingQueryParameters =
    {
      'q': city
    };
    final geocodingUri = Uri.https('api.openweathermap.org', '/data/2.5/weather', geocodingQueryParameters);
    final geocodingResponse = await http.get(geocodingUri);
    print(geocodingResponse.body);
    final geocodingJson = jsonDecode(geocodingResponse.body);

    //getting weather data from lat and lon coords
    final weatherQueryParameters =
    {
      'lat': geocodingJson.fromJson['lat'],
      'lon': geocodingJson.fromJson['lon'],
      'appid': 'cf043d4b558f03c1e5d58cc16eb82150',
      'units': 'imperial'
    };
    final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', weatherQueryParameters);
    final response = await http.get(uri);
    print(response.body);
    final json = jsonDecode(response.body);
    return DataResponse.fromJson(json);
  }


//
//   final String uid;
//   DatabaseService({ required this.uid });
//
//   // collection reference
//   final CollectionReference brewCollection = Firestore.instance.collection('brews');
// //name firebase and replace brewCollection with new name
//   Future<void> updateUserData(String location, List<Widget> widgets) async {
//     return await brewCollection.document(uid).setData({
//       'location': location,
//       'widgets': widgets,
//     });
//   }
//
// //add widget
//
// //add uid, location, starting widgets from set up
//
//   // get brews stream
//   Stream<List<Widget>> get widgets {
//     return brewCollection.snapshots()
//         .map(_brewListFromSnapshot);
//   }
//
//   // get user doc stream
//   Stream<UserData> get userData {
//     return brewCollection.document(uid).snapshots()
//         .map(_userDataFromSnapshot);
//   }
//
 }