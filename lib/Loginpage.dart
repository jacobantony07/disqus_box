import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'Homepage.dart';
import 'mainTheme.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool obscure = true;

  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _Topheight = 200;
    final double _Botheight = _Topheight - 200;
    final double _height = logicalSize.height;
    final double _width = logicalSize.width;
/*This is the Login Page Scaffolding with just the UI part*/
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/images/flat.jpg',
              width:_width,
              height:_height,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    width: _width,
                    height: 0.10 * _height,
                    child: Row(
                      children: <Widget>[],
                    ),
                  ),
                  Container(
                      width: _width,
                      height: 0.28 * _height,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Posts",
                              style: loginPageHeading,
                            ),
                            Text(
                              " for Days",
                              style: loginPageHeading,
                            )
                          ],
                        ),
                      )),
                  Container(
                    width: _width,
                    height: 0.4 * _height,
                    child: Form(
                      key: this._formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            BeautyTextfield(
                              width: double.infinity,
                              height: 60,
                              fontFamily: "RaleWay",
                              fontWeight: FontWeight.w500,
                              inputType: TextInputType.text,
                              prefixIcon: Icon(Icons.mail),
                              placeholder: "Email",
                              accentColor: Colors.white70,
                              textColor: Colors.black87,
                              backgroundColor: Colors.black45,
                            ),
                            BeautyTextfield(
                              width: double.infinity,
                              fontFamily: "RaleWay",
                              fontWeight: FontWeight.w500,
                              height: 60,
                              inputType: TextInputType.text,
                              obscureText: obscure,
                              maxLines: 1,
                              onClickSuffix: () async {
                                if (obscure == true) {
                                  setState(() {
                                    print("revealed");
                                    obscure = false;
                                    print(obscure.toString());
                                  });
                                } else {
                                  setState(() {
                                    print("Hidden");
                                    obscure = true;
                                    print(obscure.toString());
                                  });
                                }
                              },
                              prefixIcon: Icon(Icons.vpn_key),
                              suffixIcon: Icon(Icons.remove_red_eye),
                              placeholder: "Password",
                              accentColor: Colors.white70,
                              textColor: Colors.black87,
                              backgroundColor: Colors.black45,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10.0),
                                  child: FloatingActionButton(
                                    key: ValueKey('loginBtn'),
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.black,
                                    ),
                                    onPressed: () async{
                                      var navigationResult =
                                      await Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                            builder: (context) =>
                                                HomePage(),
                                          ));

                                      if (navigationResult == true) {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            "Sign up",
                            style: loginPageSubHeading,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.brightness_1,
                          color: Colors.white54,
                          size: 5,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        FlatButton(
                          child: Text(
                            "Forgot Password",
                            style: loginPageSubHeading,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
