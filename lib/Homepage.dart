import 'package:disqus_box/mainTheme.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'postdata.dart';

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

  List<String> categorytitle = [
    "Travel",
    "Health",
    "DIY",
    "Food ",
    "Quotes",
  ];

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        //Text('Carousel $carouselIndex'),
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 300.0,
          width: 350,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, carouselIndex, itemIndex);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                style: LoginpageHeading,
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
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25)),
                        height: 100,
                        width: 180,
                        child: Stack(
                          children:<Widget>[
                            Opacity(
                              opacity: 0.9,
                              child: ClipRRect(
                                borderRadius:
                                BorderRadius.all(
                                    Radius.circular(15)),
                                child: Image
                                    .asset(
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
                                      style: Categories,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:300,left:00.0),
            child: Container(
              height: 300,
              width: 400,
             // decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    if( index % 2 == 0){
                      return _buildCarousel(context, index ~/ 2);
                    }
                    else{
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

