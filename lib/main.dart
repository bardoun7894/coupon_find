import 'package:coupon_find/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AnimationController _scaleController;
  Animation<double> _scale;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("asset/adv.jpg"),
        fit: BoxFit.fill,
      )),
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.6),
            Colors.black.withOpacity(.8),
            Colors.black.withOpacity(.3)
          ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeAnimation(1, Text("find best Location",style: TextStyle(color: Colors.white.withOpacity(.9),fontSize:40,fontWeight: FontWeight.bold)))
    ,SizedBox(height: 30,)
     ,FadeAnimation(1.2, Text("find best Location",style: TextStyle(color: Colors.white.withOpacity(.5),fontSize:20,fontWeight: FontWeight.bold),)),
        SizedBox(height: 150,),
            InkWell(
              onTap:(){} ,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.yellow[700]
                ),child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[

                  Text("find everset near me ",style: TextStyle(color: Colors.white,fontSize: 15),),
                  Icon(Icons.arrow_forward,color: Colors.white,)
                ],

              ),
              ),


            ),
            SizedBox(height: 60,)
          ],
        ),
      ),
    ));
  }
}
