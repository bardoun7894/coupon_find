import 'package:coupon_find/Models/coupons_model.dart';
import 'package:coupon_find/api/api_provider.dart';

class APIRepository{

	APIProvider _provider=APIProvider();
Future<List<CouponModel>> get getDataApi =>_provider.getDataApiAsync();
}



