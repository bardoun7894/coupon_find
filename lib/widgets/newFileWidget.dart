import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:coupon_find/Models/coupons_model.dart';
import 'package:coupon_find/Models/fakeCouponsModel.dart';
import 'package:coupon_find/api/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:coupon_find/Models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class NewAppModified extends StatefulWidget {
  @override
  _NewAppModifiedState createState() => _NewAppModifiedState();

  NewAppModified({this.destination});
  Destination destination;
}

class _NewAppModifiedState extends State<NewAppModified> {
  List<FakeCoupons> filterList = List();


  final _controller = TextEditingController();
  static Color appColor = Color.fromRGBO(68, 138, 255, 30);
  int selected;

  @override
  initState() {
    super.initState();
    // Add listeners to this class
    filterList = fakeList;
  }

  Widget containerBox(String sname, int indexSelected, String image) {
    return  GestureDetector(
      onTap: () {
        setState(() {
          selected = indexSelected;
        });},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4),
        margin: EdgeInsets.only(top: 10, bottom: 10, right: 16),
        height: 80,
        width: 100,
        decoration: BoxDecoration(
            color: (selected != null && selected == indexSelected)
                ? Colors.blue
                : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            InkWell(
              child: Image(
                image: NetworkImage(image),
                width: 60,
                height: 60,
              ),
              onTap: () {
                setState(() {
                  selected = indexSelected;
                  setState(() {
                    filterList =
                        fakeList.where((u) => u.store.image == image).toList();
                  });
                });
              },
            ),
            Text(
              sname,
              style: TextStyle(
                  color: selected == indexSelected ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> showCoupons(context, String url, String image) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 350.0,
              width: 200.0,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 150.0,
                      ),
                      Container(
                        height: 100.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                            color: Colors.blue),
                      ),
                      Positioned(
                        top: 50.0,
                        left: 94.0,
                        child: Container(
                          height: 90.0,
                          width: 90.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(image),
                              ),
                              borderRadius: BorderRadius.circular(45.0),
                              border: Border.all(
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                  width: 2.0)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "تم نسخ الكود",
                      style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "هل تريد تصفح الموقع الان",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0),
                    ),
                  ),
                  SizedBox(height: 38),
                  Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: Row(
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            _launchURL(url);
                          },
                          color: Colors.teal,
                          child: Center(
                            child: Text(
                              "نعم",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              color: Colors.grey,
                              child: Center(
                                child: Text(
                                  "لا",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildFolderView() {
    return Column(
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
            FlatButton(
              child: Text(" الكل",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent)),
              onPressed: () {
                setState(() {
                  filterList =
                      fakeList.where((u) => u.store.name.contains("")).toList();
                  selected = null;
                });
              },
            )
          ],
        ),
        Container(
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: <Widget>[
                for (int i = 0; i <fakeList.length; i++)
                  containerBox(
                      fakeList[i].store.name, i, fakeList[i].store.image),
              ],
            ))
      ],
    );
  }

  Text buildRattingStars(int rating) {
    String stars = "";
    for (int i = 0; i < rating; i++) {
      stars += '⭐';
    }
    stars.trim();
    return Text(stars);
  }

APIRepository _apiRepository=APIRepository();

  Widget carouselCoupond() {
    return Expanded(

      child:  ListView.builder(
        itemCount: filterList.length,
        itemBuilder: (BuildContext context, int index)
              {
         return getStackData(index);
               },
      )

    );
  }

Widget  getStackData(index){

  return Stack(
    children: <Widget>[
      Container(
        margin: EdgeInsets.fromLTRB(10.0, 2, 10.0, 5),
        width: MediaQuery.of(context).size.width - 20,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 110, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      filterList[index].description,
                      style: TextStyle(
                          fontSize: 21.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 20),
              child: Row(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Container(
                      height: 40,
                      width: 50,
                      color: Color(0xFF4DA447),
                      child: Center(
                        child: Text(
                          filterList[index].code,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  Container(
                      height: 40,
                      width: 100,
                      color: Color(0xFF30405D),
                      child: Center(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                ClipboardManager.copyToClipBoard(
                                    filterList[index].code);
                                showCoupons(
                                    context,
                                    filterList[index].store.link,
                                    filterList[index].store.image);
                              });
                            },
                            child: Text(
                              "اضغط للنسخ ",
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ))),
                ],
              ),
            ),
          ],
        ),
      ),
      Positioned(
        right: 10,
        top: 5.0,
        child: ClipRRect(
          child: Image(
              width: 80,
              height: 80,
              image: NetworkImage(filterList[index].store.image)),
        ),
      )
    ],
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appColor,
        body: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child:   Stack(
                children: <Widget>[
                  Positioned(
                    left: 10,
                    top: 32,
                    right: 8,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  onPressed: () {}),
                              IconButton(
                                onPressed: () {},
                                padding: EdgeInsets.all(8),
                                icon: Icon(
                                  FontAwesomeIcons.shoppingBag,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(left: 16, right: 16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(32)),
                            padding: EdgeInsets.only(right: 20),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 8,
                                  child: TextField(
                                    controller: _controller,
                                    decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        hintText: "ابحث عن كوبون",
                                        border: InputBorder.none),
                                  ),
                                ),
                                VerticalDivider(
                                  thickness: 1,
                                  color: Colors.grey[400],
                                ),
                                Expanded(
                                  flex: 2,
                                  child: IconButton(
                                    icon: Icon(Icons.search),
                                    color: Colors.grey,
                                    onPressed: () {
                                      setState(() {
                                        filterList = fakeList
                                            .where((u) => u.store.name
                                            .contains(_controller.text))
                                            .toList();
                                      });
                                    },
                                    iconSize: 30,
                                  ),
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
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24))),
                        child: Padding(
                          padding:
                          const EdgeInsets.only(left: 5, right: 5, top: 5),
                          child: Column(
                            children: <Widget>[
                              _buildFolderView(),
                              carouselCoupond()
                            ],
                          ),
                        )),
                  )

                ],
              )
          ),

        ));
  }
}


_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
