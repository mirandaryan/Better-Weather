import 'package:better_weather/models/Widget.dart';
import 'package:better_weather/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ required this.uid });

  // collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('brews');
//name firebase and replace brewCollection with new name
  Future<void> updateUserData(String location, List<Widget> widgets) async {
    return await brewCollection.document(uid).setData({
      'location': location,
      'widgets': widgets,
    });
  }

//add widget

//add uid, location, starting widgets from set up

  // get brews stream
  Stream<List<Widget>> get widgets {
    return brewCollection.snapshots()
        .map(_brewListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

}