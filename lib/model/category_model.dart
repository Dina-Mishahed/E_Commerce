class CategoryModel{
  String? name  ,image;

  CategoryModel(this.name, this.image);
  CategoryModel.fromJson(Map<dynamic,dynamic> map){
    if(map == null){
      return;
    }
    else{
      name =map['name'] ;
      image = map['image'] ;
    }

  }
  toJson(){
    return{
      'name': name,
      'image': image,
    };
  }


}