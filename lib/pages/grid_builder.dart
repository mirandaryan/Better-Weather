import 'package:flutter/material.dart';

class GridBuilder extends StatefulWidget {


  const GridBuilder({super.key});
  @override
  GridBuilderState createState() => GridBuilderState();
}

class GridBuilderState extends State<GridBuilder> {
  //final List<Map> myProducts =
  //List.generate(100000, (index) => {"id": index, "name": "Product $index"})
     // .toList();
  final List<String> widgetList = ["rainfall", "windspeed"];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1/ 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: widgetList.length,
        itemBuilder: (BuildContext ctx, index) {
          return GestureDetector(
            onLongPress: (){
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Delete'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('Would you like to delete the ${widgetList.elementAt(index)} widget?'),
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
            },
            child: Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.blue[200],
              width: 20.0,
              height: 30.0,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('80'),
                    subtitle: Text(widgetList.elementAt(index)),
                  ),
                ],

              ),
          ),


          );
        });
  }
}
//https://blog.logrocket.com/how-to-create-a-grid-list-in-flutter-using-gridview/