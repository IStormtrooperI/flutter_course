import 'package:flutter/material.dart';

void main() => runApp(StatefulWidgetTemplate());

class StatefulWidgetTemplate extends StatefulWidget {
  const StatefulWidgetTemplate({Key? key}) : super(key: key);

  @override
  _StatefulWidgetTemplateState createState() => _StatefulWidgetTemplateState();
}

class _StatefulWidgetTemplateState extends State<StatefulWidgetTemplate> {
  double counter = 0.0;
  Color colorText2 = Colors.red;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            counter+=5;
                          });
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.green,
                          size: 100,
                        )),
                    // InkWell(
                    //     onLongPress: () {
                    //       counter += 10;
                    //       setState(() {});
                    //     },
                    //     onTap: () {
                    //       counter = 0;
                    //       setState(() {});
                    //     },
                    //     child: Text(
                    //       '${counter}',
                    //       style: TextStyle(
                    //           fontSize: 30,
                    //           color: counter > 10 ? colorText2 : Colors.black),
                    //     )),
                    InkWell(
                        onTap: () {
                          setState(() {
                            counter-=5;
                          });
                        },
                        child: Icon(
                          Icons.remove,
                          color: Colors.red,
                          size: 100,
                        )),
                  ],
                ),
                AnimatedContainer(
                  margin: EdgeInsets.all(16),
                  duration: Duration(milliseconds: 450),
                  color: counter > 20 ? Colors.red : Colors.blue,
                  width: 100 + counter,
                  height: 100 + counter,
                ),
              ],
            ),
          )),
    );
  }
}
