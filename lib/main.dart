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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _scaleController;
  Animation<double> _scaleAnimation;
  bool hide = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 30.0).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {}
          });
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scaleController.dispose();
  }

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
        padding: EdgeInsets.all(30.0),
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
            FadeAnimation(
                1.0,
                Text("find best Location",
                    style: TextStyle(
                        color: Colors.white.withOpacity(.9),
                        fontSize: 40,
                        fontWeight: FontWeight.bold))),
            SizedBox(
              height: 30.0,
            ),
            FadeAnimation(
                1.2,
                Text(
                  "find best Location",
                  style: TextStyle(
                      color: Colors.white.withOpacity(.5),
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 150,
            ),
            FadeAnimation(1.4,InkWell(
              onTap: () {
                setState(() {
                  hide = true;
                });
                _scaleController.forward();
              },
              child: AnimatedBuilder(
                animation: _scaleController,
                builder: (context,child)=>Transform.scale(
                  scale: _scaleAnimation.value,
                child:Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.yellow[700]),
                  child: hide == false ?
                  Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "find everset near me ",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Icon( Icons.arrow_forward, color: Colors.white, )
                    ],
                  ):Container(),
                ),)
              )


            )),
            SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    ));
  }
}
