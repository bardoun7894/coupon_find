


import 'dart:convert';

import 'package:coupon_find/Models/coupons_model.dart';
import 'package:dio/dio.dart' as http_dio;

class APIProvider{
	http_dio.Dio dio =http_dio.Dio();
Future<List<CouponModel>> getDataApiAsync() async{
	http_dio.Response response;
response= await  dio.get("https://still-plateau-33433.herokuapp.com/index");
final List rawData = jsonDecode(jsonEncode(response.data));
if (response.statusCode  == 200) {
	List<CouponModel> listCouponModel = rawData.map((f) => CouponModel.fromJson(f)).toList();
	return listCouponModel ;
}else
  	{ return null; }
}

	}


