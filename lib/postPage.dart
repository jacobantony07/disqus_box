import 'package:flutter/material.dart';

class postPage extends StatefulWidget {
  @override
  _postPageState createState() => _postPageState();
}

class _postPageState extends State<postPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              "assets/images/post1.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset("assets/images/wallpaper1.jpg"),
                  )
                ],
              ),
            );
          }),
        )
      ],
    );
  }
}
