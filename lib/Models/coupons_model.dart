class coupons {
	int id;
	String description;
	String code;
	int discount;
	Store store;

	coupons({this.id, this.description, this.code, this.discount, this.store});

	coupons.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		description = json['description'];
		code = json['code'];
		discount = json['discount'];
		store = json['store'] != null ? new Store.fromJson(json['store']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['description'] = this.description;
		data['code'] = this.code;
		data['discount'] = this.discount;
		if (this.store != null) {
			data['store'] = this.store.toJson();
		}
		return data;
	}
}

class Store {
	int id;
	String name;
	String image;
	String link;

	Store({this.id, this.name, this.image, this.link});

	Store.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		name = json['name'];
		image = json['image'];
		link = json['link'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['name'] = this.name;
		data['image'] = this.image;
		data['link'] = this.link;
		return data;
	}
}