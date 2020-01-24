import 'package:disqus_box/mainTheme.dart';
import 'package:flutter/material.dart';

class postPageContent extends StatefulWidget {
  @override
  _postPageContentState createState() => _postPageContentState();
}

class _postPageContentState extends State<postPageContent> {
  List Comments = new List();

  int likes = 30;
  int dislikes = 10;
  Color upvotestatecolor;
  Color downvotestatecolor;
  bool postupvoted;
  bool postdownvoted;
  
  @override
  void initState(){
   super.initState();
   postupvoted = false;
    postdownvoted = false;
    upvotestatecolor = Colors.white;
    downvotestatecolor = Colors.white;
  }
  
  void upvotesanddownvotesCounter(String state){
    switch(state){
      case "upvoted" : postupvoted = true;setState(() {
        upvotestatecolor = Colors.green;
      }); likes++ ;break;
      case "un-upvoted" : postupvoted = false;setState(() {
        upvotestatecolor = Colors.white;
      });likes--;break;
      case "downvoted" : postdownvoted = true;setState(() {
        downvotestatecolor = Colors.red;
      }); dislikes++;break;
      case "un-downvoted" : postdownvoted = false;setState(() {
        downvotestatecolor = Colors.white;
      }); dislikes--;break;
    }
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
                      Row(
                        children: <Widget>[
                          IconButton(icon: Icon(Icons.arrow_upward,color: upvotestatecolor), onPressed: () {
                            if(postupvoted == false){
                               print("upvoted");
                              upvotesanddownvotesCounter("upvoted");
                            }
                            else{
                               print("un-upvoted");
                              upvotesanddownvotesCounter("un-upvoted");
                            }
                          },),
                          SizedBox(width: 10,),
                          Text(likes.toString(),style:userName,),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                      IconButton(icon: Icon(Icons.arrow_downward,color: downvotestatecolor), onPressed: () {
                        if(postdownvoted == false){
                              print("downvoted");
                              upvotesanddownvotesCounter("downvoted");
                          
                            }
                            else{
                               print("un-downvoted");
                              upvotesanddownvotesCounter("un-downvoted");
                            }
                      },),
                          SizedBox(width: 10,),
                          Text(dislikes.toString(),style:userName,),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.message,color: Colors.white,),
                          SizedBox(width: 10,),
                          Text('1',style:userName,),
                        ],
                      )
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
