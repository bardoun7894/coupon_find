class FakeCoupons {
  int id;
  String description;
  String code;
  int discount;
  Store store;
  FakeCoupons( {this.id, this.description, this.code, this.discount, this.store});
}

class Store {
  int id;
  String name;
  String image;
  String link;
  Store({this.id, this.name, this.image, this.link});
}
List<FakeCoupons> fakeList=[_fakeCouponsAnass,_fakeCouponsNoon,_fakeCouponsTajawol];
List<Store> stores=[storeNoon,storeAnass];



FakeCoupons _fakeCouponsNoon=FakeCoupons(id:0,description:"نون اون لاين 20% لازياء عصرية انيقة ",code:"F93",discount: 20,store: storeNoon);
FakeCoupons _fakeCouponsTajawol=FakeCoupons(id:2,description:"رقم تجول تواصل معه لخصم 10% علي الفنادق",code:"F159",discount: 10,store: storeTajawol);
FakeCoupons _fakeCouponsAnass=FakeCoupons(id:1,description:"اناس اون لاين 25% لازياء عصرية انيقة ",code:"B53",discount: 25,store: storeAnass);
Store storeNoon =  Store(id: 0,name: "نون",image:"https://www.couponswadi.com/wp-content/uploads/2019/12/كود-خصم-نون-مكياج.png",link:"https://www.tajawal.com/ar");
Store storeTajawol=Store(id: 0,name: " تجول",image:"https://www.couponswadi.com/wp-content/uploads/2019/02/tgawol-code-150x150.png",link:"https://www.noon.com/egypt-ar/");
Store storeAnass = Store(id: 1,name: " أناس",image:"https://www.couponswadi.com/wp-content/uploads/2019/12/اناس-اون-لاين.png",link:"https://www.ounass.com/");

List<FakeCoupons> coupons=[

	FakeCoupons(
			id:0,
			description: "st mark basilia  ",
			code: "SIghtsseeing tour ",
			discount:25,
			store:storeNoon
	),


];