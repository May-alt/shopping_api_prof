
 class CategoriesModels{
  late bool status;
  late CategoriesDataModel data;

  CategoriesModels({required this.status, required this.data});
  CategoriesModels.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = CategoriesDataModel.fromJson(json['data']);
  }

 }

 class CategoriesDataModel{

  late int currentPage;
  late List<CategoryListData> datalist = [];

  CategoriesDataModel({required this.currentPage,required this.datalist});

  CategoriesDataModel.fromJson(Map<String, dynamic> json){
    currentPage = json['current_page'];
    json['data'].forEach((elemnt){
      datalist.add(CategoryListData.fromJson(elemnt));
    });
  }

 }

 class CategoryListData{
  late int id;
  late String name;
  late String image;

  CategoryListData({required this.id, required this.name, required this.image});

  CategoryListData.fromJson(Map<String,dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;

    return data;
  }


 }