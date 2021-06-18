import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'file:///E:/Dwinkal/Flutter/Flutter%20Projects/practical_task_1/lib/pages/homepage.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;


void main()async {
    WidgetsFlutterBinding.ensureInitialized();
    //returns path directory hive can use
    Directory directory = await pathProvider.getApplicationDocumentsDirectory();
    //proivide path
    await Hive.init(directory.path);
    //open box to store data
    //mydatabox is db name
   await Hive.openBox('mydatabox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.white,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

