import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

 class AppContainer extends StatefulWidget {


   @override
   _AppContainerState createState() => _AppContainerState();
 }

 class _AppContainerState extends State<AppContainer> {
	 final _controller = TextEditingController();
	 int id;
	 String description;
	 String code;
	 String discount;
	 Null storeId;
	 String storeName;
	 String storeImage;
	 String storeLink;
	 String createdAt;
	 String updatedAt;
	 _AppContainerState(
			 {this.id,
				 this.description,
				 this.code,
				 this.discount,
				 this.storeId,
				 this.storeName,
				 this.storeImage,
				 this.storeLink,
				 this.createdAt,
				 this.updatedAt});
   @override
   Widget build(BuildContext context) {
     return Container();
   }
 }

