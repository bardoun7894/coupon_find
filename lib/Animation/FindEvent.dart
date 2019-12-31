import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class FindEvent extends StatelessWidget {

  static Color appColor = Color.fromRGBO(68, 138, 255,30);

  Widget _buildFolderView() {
    return Expanded(
      flex: 6,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "كوبونات",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(" الكل",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent))
            ],
          ),
          Container(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    margin: EdgeInsets.only(top: 16, bottom: 16, right: 16),
                    height: 140,
                    width: 120,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blue[100],
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(0, 4)),
                        ],
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.blue[100],
                        ),
                        Text(
                          "My Project",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        Text(
                          "12/31/2019",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    margin: EdgeInsets.only(top: 16, bottom: 16, right: 16),
                    height: 140,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey)),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.blue[100],
                        ),
                        Text(
                          "Drible",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          "12/31/2019",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16, bottom: 16, right: 16),
                    height: 140,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.blue[100],
                        ),
                        Text(
                          "Gmail",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          "12/31/2019",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16, bottom: 16, right: 16),
                    height: 140,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.blue[100],
                        ),
                        Text(
                          "Drible",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          "12/31/2019",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: appColor,
      body:SingleChildScrollView(
     child:Container(
         width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: Stack(
        children: <Widget>[
          Positioned(
            left:10,
            top: 32,
            right:8,
            child: Container(

              height: MediaQuery.of(context).size.height / 3.5,
              child: Column(
                children: <Widget>[
                	Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
										children: <Widget>[
											IconButton(icon:Icon(Icons.menu,color: Colors.white,size: 28,),onPressed:(){}),
                      Badge(
                        position: BadgePosition.topRight(),
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.notifications_none,color: Colors.white,size: 28,),
                      ),


										],
									),
                  SizedBox(height: 16,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 16,right: 16 ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32)
                    ),padding: EdgeInsets.only(right: 20),
                    child: Row(
                    children: <Widget>[
                      Expanded(

                        flex: 8,
                        child: TextField(
                        decoration: InputDecoration(hintStyle:TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.bold),hintText: "ابحث "
                        ,border: InputBorder.none
                        ) , ), ),
                      VerticalDivider(
                        thickness: 1,
                        color: Colors.grey[400],
                      ),
                      Expanded(
                        flex:2,
                        child: IconButton(icon:Icon( Icons.search),color: Colors.grey,onPressed: (){},iconSize: 30,),

                      )
                    ],
                  ),
                  )

                ],




              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: MediaQuery.of(context).size.height / 4,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 18, top: 24),
                  child: Column(
                    children: <Widget>[
                      _buildFolderView(),
                      Expanded(
                        flex: 6,
                        child: Placeholder(),
                      ),
                      Expanded(
                        flex: 2,
                        child: Placeholder(),
                      )
                    ],
                  ),
                )),
          )
        ],
      )),)
    );
  }
}
