import 'package:disqus_box/Loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';

void main(){
  enableFlutterDriverExtension();
  runApp(MyApp());}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: Loginpage(),
    );
  }
}

