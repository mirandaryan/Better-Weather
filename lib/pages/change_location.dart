import 'package:better_weather/services/database.dart';
import 'package:flutter/material.dart';
import 'package:better_weather/models/WeatherData.dart';

class ChangeLocation extends StatefulWidget {
  const ChangeLocation({Key? key}) : super(key: key);
  //list of all possible locations, add to database onPressed

  @override
  State<ChangeLocation> createState() => _ChangeLocationState();
}


class _ChangeLocationState extends State<ChangeLocation> {
  //final List<String> locations = <String>['Chicago', 'New York', 'Los Angeles'];
  //final int listLength = 3;
  final _cityTextController = TextEditingController();
  final _databaseService = DatabaseService();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Change Location"),
//       ),
//       body: Center(
//           itemCount: locations.length,
//           itemBuilder: (BuildContext ctx, index) {
//             return ListTile(
//             onTap: () {
//               print("tapped");
//               showDialog<void>(
//                 context: context,
//                 barrierDismissible: false, // user must tap button!
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     title: const Text('Change Location'),
//                     content: SingleChildScrollView(
//                       child: ListBody(
//                         children: <Widget>[
//                           Text('Would you like to change you location to ${locations.elementAt(index)}?'),
//                         ],
//                       ),
//                     ),
//                     actions: <Widget>[
//                       TextButton(
//                         child: const Text('Yes'),
//                         onPressed: () {
//                           Navigator.popUntil(context, ModalRoute.withName('/'));
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               );
//            },
//
//             //add location to userdata
//               //return to home and reload
//             title: Text(locations.elementAt(index))
//             );
//             },
//
//     ),
//     );
//   }

 late DataResponse _response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Change Location"),
        ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_response != null)
                  Column(
                    children: [
                      Image.network(_response.iconUrl),
                      Text(
                        '${_response.weather.main}°',
                        style: TextStyle(fontSize: 40),
                      ),
                      Text(_response.weather.icon)
                    ],
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: SizedBox(
                    width: 150,
                    child: TextField(
                        controller: _cityTextController,
                        decoration: InputDecoration(labelText: 'City'),
                        textAlign: TextAlign.center),
                  ),
                ),
                ElevatedButton(onPressed: _search, child: Text('Search'))
              ],
            ),

          ),
        );
  }

  void _search() async
  {
    final response = await _databaseService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }

}
//https://api.flutter.dev/flutter/widgets/ListView-class.html
//https://api.flutter.dev/flutter/material/AlertDialog-class.html