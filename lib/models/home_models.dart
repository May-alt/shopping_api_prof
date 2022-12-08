

class HomeModel{
  late bool status;
  late homeData data;

  HomeModel({
    required this.status,
    required this.data
  });

  HomeModel.fromJson(Map<String, dynamic> json){
    status =json['status'];
    data = homeData.fromJson(json['data']);
  }
}

class homeData{
  List<BannersHome>banners = [];
  List<ProductsHome>products = [];
  late String ad;

  homeData({ required this.banners,required this.products,required this.ad,});

  homeData.fromJson(Map<String, dynamic> json){
    json['banners'].forEach((elements){
      banners.add(BannersHome.fromJson(elements));
    });
    json['products'].forEach((elements){
      products.add(new ProductsHome.fromJson(elements));
    });
    // if (json['banners'] != null) {
    //   banners = new List<Banners>();
    //   .forEach((elm) {
    //     banners.add(new ProductsHome.fromJson(elm));
    //   });
    // };
    ad = json['ad'];
  }

  Map<String, dynamic> toJson(){
   final Map<String, dynamic> data = new Map<String,dynamic>();
   if (this.banners != null) {
     data['banners'] = this.banners.map((v) => v.toJson()).toList();
   }
   if (this.products != null) {
     data['products'] = this.products.map((v) => v.toJson()).toList();
   }
   data['ad'] = this.ad;
   return data;
  }
}

class BannersHome{
 late int id;
 late String image;

 BannersHome.fromJson(Map<String, dynamic> json){
   id = json['id'];
   image = json['image'];
 }

 Map<String, dynamic> toJson(){
   final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['image'] = this.image;
   return data;
 }

}

class ProductsHome{
 late int id;
 late dynamic price;
 late dynamic oldPrice;
 late int discount;
 late String image;
 late String name;
 late bool inFavorites;
 late bool inCart;
 late String description;
 ProductsHome({
   required this.id,
   required this.name,
   required this.image,
   required this.price,
   required this.discount,
   required this.oldPrice,
   required this.inCart,
   required this.inFavorites,
   required  this.description,
 });

 ProductsHome.fromJson(Map<String, dynamic> json){
   id = json['id'];
   name = json['name'];
   image = json['image'];
   price = json['price'];
   oldPrice = json['old_price'];
   discount = json['discount'];
   inCart = json['in_cart'];
   inFavorites = json['in_favorites'];
   description = json['description'];
 }

 Map<String, dynamic>toJson (){
   final Map<String, dynamic> data = new Map<String, dynamic>();
   data ['id']= this.id;
   data['name'] = this.name;
   data['image'] = this.image;
   data['price'] = this.price;
   data['old_price']= this.oldPrice;
   data['in_cart'] = this.inCart;
   data['discount'] = this.discount;
   data['description'] = this.description;
   data['in_favorites'] = this.inFavorites;
   return data;
}

}