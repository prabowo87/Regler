import 'package:flutter/material.dart';

class AddBuildingView extends StatefulWidget {
  @override
  _AddBuildingViewState createState() => _AddBuildingViewState();
}

class _AddBuildingViewState extends State<AddBuildingView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Montserrat',
            accentColor: Colors.teal),
        home: Scaffold(
          body: Container(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 2.0),
                  ),
                  InkWell(
                      onTap: () {},
                      child: Card(
                          child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.location_city,
                              color: Colors.redAccent,
                              size: 35.0,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              "Add Building",
                              style: TextStyle(
                                  color: Colors.tealAccent,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w200),
                            )
                          ],
                        ),
                      ))),
                      InkWell(
                        onTap: () {},
                        child: Card(
                            child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 2.0),
                          child: Column(
                            children: <Widget>[
                              TextField(
                                onChanged: (String val) {
                                  
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter Building Name'),
                              )
                            ],
                          ),
                        ))),
                        InkWell(
                        onTap: () {},
                        child: Card(
                            child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 2.0),
                          child: Column(
                            children: <Widget>[
                              TextField(
                                onChanged: (String val) {
                                  
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter Director Name'),
                              )
                            ],
                          ),
                        ))),
                        Center(
                      child: RaisedButton(
                        color: Colors.blue,
                        splashColor: Colors.blueAccent,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.add),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Add Building",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        onPressed: () {
                        
                        },
                      ),
                    ),
                ],
              )),
        ));
  }
}