import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';

class postPageHeader implements SliverPersistentHeaderDelegate{

  postPageHeader({
    this.minExtent,
    this.maxExtent,
  });

  final minExtent;
  final maxExtent;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
  /*The size of the Sliver header is configured here*/
   return Stack(
     fit: StackFit.expand,
     children: <Widget>[
       Image.asset("assets/images/post1.jpg",
         fit: BoxFit.fitWidth,),

     ],
   );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }

  @override
  // TODO: implement snapConfiguration
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
}
