import 'package:flutter/material.dart';

class GridBuilder extends StatefulWidget {


  const GridBuilder({Key key});
  @override
  GridBuilderState createState() => GridBuilderState();
}

class GridBuilderState extends State<GridBuilder> {
  //final List<Map> myProducts =
  //List.generate(100000, (index) => {"id": index, "name": "Product $index"})
     // .toList();
  final List<String> widgetList = ["Feels Like", "Temperature Minimum", "Temperature Maximum", "Rain Amount", "Clouds", "Humidity"];
  final List<String> widgetDataList = ["35F", "28F", "41F", "2.8in", "90%", "34%"];

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
                          Text('Would you like to delete the ${widgetList.elementAt(index)} widget?',
                            style: TextStyle(color: Colors.red[400]),
                          ),
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
              decoration: BoxDecoration(
                  color:Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0,1),
                    ),
                  ],
                  // border: Border.all(
                  //   color: Colors.blue[200]
                  // ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    title: Center(child: Text(widgetDataList.elementAt(index),
                      style: const TextStyle(
                        fontSize: 40.0,
                      ),
                      ),
                    ),
                    subtitle: Center(
                      child: Text(widgetList.elementAt(index)),
                    ),
                  ),
                ],

              ),
          ),

          );
        });
  }
}
//https://blog.logrocket.com/how-to-create-a-grid-list-in-flutter-using-gridview/