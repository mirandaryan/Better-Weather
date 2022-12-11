import 'package:flutter/material.dart';

class AddWidget extends StatefulWidget {
  const AddWidget({Key key}) : super(key: key);
  //list of all possible locations, add to database onPressed

  @override
  State<AddWidget> createState() => _AddWidgetState();
}


class _AddWidgetState extends State<AddWidget> {
  final List<String> widgets = <String>['rainfall', 'windspeed', 'pressure'];
  final int listLength = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Widget"),
      ),
      body: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext ctx, index) {
          return ListTile(
              onTap: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Add Widget'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('Would you like to add the ${widgets.elementAt(index)} widget?'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Yes'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
                //add widget to userdata
                //return to home and reload
              },
              title: Text(widgets.elementAt(index))
          );
        },

      ),
    );
  }


}
//https://vermahitesh.medium.com/select-list-items-in-flutter-21f58765c19b
//https://api.flutter.dev/flutter/widgets/ListView-class.html