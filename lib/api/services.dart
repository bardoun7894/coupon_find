import 'dart:convert';

import 'package:coupon_find/Models/coupons_model.dart';
import 'package:http/http.dart' as http;

class Services {
	static const String url = "https://still-plateau-33433.herokuapp.com/index";
	static Future<List<CouponModel>> getCoupons() async{

		try{
			final response = await http.get(url);
			if(response.statusCode==200){
				List<CouponModel> list =parseCoupons(response.body);
				return list ;
			}else{
				throw Exception("error");
			}
		}catch(e){
throw Exception(e.toString());
		}

	}
	static List<CouponModel> parseCoupons(String  responseBody){
		final parsed =json.decode(responseBody).cast<Map<String,dynamic>>();
		return parsed.map<CouponModel>((json)=>CouponModel.fromJson(json)).toList();
	}


}
