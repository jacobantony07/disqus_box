import 'package:disqus_box/mainTheme.dart';
import 'package:flutter/material.dart';

class postPageContent extends StatefulWidget {
  @override
  _postPageContentState createState() => _postPageContentState();
}

class _postPageContentState extends State<postPageContent> {
  List Comments = new List();
  void initState(){
   super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              color: Colors.white10,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.only(left:15.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 40,
                      height: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("assets/images/wallpaper1.jpg",fit: BoxFit.fill,),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Text("Thomas Hofstader",style: userName,)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Container(
                color: Colors.white10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Icon(Icons.arrow_upward,color: Colors.white,),
                      Icon(Icons.arrow_downward,color: Colors.white,),
                      Icon(Icons.message,color: Colors.white,)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(height: 50,child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Comments",style: TextStyle(color: Colors.white24,fontFamily: "RaleWay",fontWeight: FontWeight.w600,decoration: TextDecoration.none,fontSize: 20,fontStyle: FontStyle.italic),),
                ],
              ),),
            ),

            Container(
              width: 500,
              height:500 ,
              color: Colors.white10,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
               child: ListView.builder(
                 physics: NeverScrollableScrollPhysics(),
                 itemCount: 3,
                 itemBuilder: (context,int index){
                   return Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Container(
                             height: 40,
                             width: 40,
                             child: ClipRRect(
                               borderRadius: BorderRadius.circular(20),
                               child: Image.asset("assets/images/wallpaper1.jpg",fit: BoxFit.fill,),
                             ),
                           ),
                           SizedBox(width: 20,),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                               Row(
                                 children: <Widget>[
                                   Text("Thomas H.",style: commentsName,),
                                   Text("Just now.",style: lastSeen,),
                                 ],
                               ),
                               SizedBox(height: 10,),
                               Text("Cool.",style: commentsName,),
                               SizedBox(height: 10,),
                               InkWell(child: Text("Reply",style: lastSeen,),),
                             ],
                           ),
                         ],
                       ),

                       SizedBox(height: 50,)
                     ],
                   );
                 },
               ),
               ),
              ),

    ]
        )
      ),
    );
  }
}
