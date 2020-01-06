import 'package:disqus_box/mainTheme.dart';
import 'package:disqus_box/postPage.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List categories = new List();

  List<String> categoryimages = [
    "assets/images/travel.jpg",
    "assets/images/Health.jpg",
    "assets/images/DIY.jpg",
    "assets/images/foodanddrinks.jpg",
    "assets/images/quotes.png",
  ];

  List<String> posts = [
    "assets/images/post1.jpg",
    "assets/images/post2.jpg",
  ];

  List<String> categorytitle = [
    "Travel",
    "Health",
    "DIY",
    "Food ",
    "Quotes",
  ];
  List<String> postcaptions = [
    "en Route berlin!",
    "Godzilla",
  ];

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        //Text('Carousel $carouselIndex'),
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 400.0,
          width: 350,
          child: PageView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 2,
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.9),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, carouselIndex, itemIndex);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                posts[itemIndex],
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 30),
              child: Container(
                width: double.maxFinite,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Image.asset(
                          "assets/images/wallpaper3.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Thomas Hofstader",
                      style: userName,
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 120.0, left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      postcaptions[itemIndex],
                      style: captions,
                    ),
                    SizedBox(
                      height: 200,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right:20.0),
                          child: FlatButton(onPressed: ()async {var navigationResult =
                          await Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) =>
                                    postPage(),
                              ));

                          if (navigationResult == true) {
                            return null;
                          }  },
                          child: Icon(Icons.message,color: Colors.white,size: 30,),),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _Topheight = 200;
    final double _Botheight = _Topheight - 200;
    final double _height = logicalSize.height;
    final double _width = logicalSize.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.96,
            child: Center(
              child: Image.asset(
                'assets/images/wallpaper2.jpg',
                width: _width,
                height: _height,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
            child: Container(
              child: Text(
                "Hello!",
                style: loginPageHeading,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 150.0, horizontal: 0),
            child: Container(
              width: _width,
              height: 110,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25)),
                        height: 100,
                        width: 180,
                        child: Stack(children: <Widget>[
                          Opacity(
                            opacity: 0.9,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              child: Image.asset(
                                categoryimages[index],

                                // fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    categorytitle[index],
                                    style: categoriesFont,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ]),
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300, left: 00.0),
            child: Container(
              height: 400,
              width: 400,
              // decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index % 2 == 0) {
                      return _buildCarousel(context, 1);
                    } else {
                      return Divider();
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
