import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:practical_task_1/common_widgets.dart';
import 'package:practical_task_1/model/response_model.dart';
import 'package:practical_task_1/pages/formpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String jsondata;
  var jsonList;
  ResponseModel responseModel = new ResponseModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getJsonFileData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);

              return Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      responseModel.welcomeScreen.title,
                      style: mediumTextStyle(Colors.black, 18),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      responseModel.welcomeScreen.description,
                      style: regularTextStyle(Colors.black, 12),
                    ),
                    SizedBox(
                      height: 250,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FormPage(
                                      model: responseModel,
                                    )));
                      },
                      color: Colors.black,
                      textColor: Colors.white,
                      child: Text('Start'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        var databox=Hive.box('mydatabox');
                        print(databox.containsKey('data'));
                        if(databox.containsKey('data')) {
                          var name = databox.get('data');
                          AlertDialog alert = AlertDialog(
                            title: Text(databox.get('id').toString()),
                            content: Text("last person first name is $name"),

                          );

                          // show the dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        }
                      },
                      color: Colors.black,
                      textColor: Colors.white,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text('View Recent '),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Future<ResponseModel> getJsonFileData() async {
    jsondata = await rootBundle.loadString('assets/response.json');
    jsonList = json.decode(jsondata);

    responseModel = ResponseModel.fromJson(jsonList);

    return responseModel;
  }
}
