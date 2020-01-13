import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:coupon_find/api/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Models/coupons_model.dart';

class ArticleSearch extends SearchDelegate {
	String q ;

	ArticleSearch(q){ this.q = q;}


  APIRepository _apiRepository = APIRepository();
  Widget getStackData(index, filterList, context) {
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
                child: GestureDetector(
                  onTap: () {
                    ClipboardManager.copyToClipBoard(filterList[index].code);
                    showCoupons(context, filterList[index].storeLink,
                        filterList[index].storeImage);
                  },
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
                            child: Text(
                              "اضغط للنسخ ",
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ],
                  ),
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
                image: NetworkImage(filterList[index].storeImage)),
          ),
        )
      ],
    );
  }

  Widget carouselCoupond(filterList) {
    return Expanded(
        child: ListView.builder(
      itemCount: filterList.length,
      itemBuilder: (BuildContext context, int index) {
        return getStackData(index, filterList, context);
      },
    ));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
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

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(child: Text('no data')),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return SearchData(query);
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget SearchData(Query) {
  	query =q;
    return Container(
        child: FutureBuilder(
            future: _apiRepository.getDataApi,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                List<CouponModel> fakList = snapshot.data
                    .where((u) => u.storeName.toString().contains(query))
                    .toList();
                var filterList = fakList;
                return Stack(children: <Widget>[
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, top: 5),
                            child: Column(
                              children: <Widget>[carouselCoupond(filterList)],
                            ),
                          )))
                ]);
              } else {
                return Container(
                  color: Colors.white,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }));
  }
}
