import 'package:disqus_box/mainTheme.dart';
import 'package:disqus_box/postPage_content.dart';
import 'package:disqus_box/postPage_header.dart';
import 'package:flutter/material.dart';

class postPage extends StatefulWidget {
  @override
  _postPageState createState() => _postPageState();
}

class _postPageState extends State<postPage> {
  @override
  Widget build(BuildContext context) {

    /*Main Page of Post Page but separated into 3 different classes(Header/content)*/
    return Scaffold(
        body: Stack(
          children: <Widget>[
            /*Sliver components require CustomScrollView to function*/
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.black,
                  pinned: true,
                ),
                SliverPersistentHeader(
                  pinned: false,
                  floating: false,
                  delegate: postPageHeader(
                    minExtent: 250.0,
                    maxExtent: 250.0,
                  ),
                ),
                postPageContent(),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
              color: Colors.black87,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: TextFormField(
                  style: commentingBox,
                  maxLines: 2,
                  decoration: InputDecoration(
                      focusColor: Colors.black87,
                      hintText: "Comment here",
                      hintStyle: commentingHint),
                ),
              )),
        ));
  }
}
