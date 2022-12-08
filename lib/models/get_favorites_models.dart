class GetFavoritesModels{
   bool? status;
   String? message;


  GetFavoritesModels({required this.status, required this.message});

  GetFavoritesModels.fromJson(Map<String ,dynamic> json){
    status = json['status'];
    message = json['message'];
  }

}