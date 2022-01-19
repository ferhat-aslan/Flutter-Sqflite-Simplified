class Product{
int? id;
String? name;
String? description;
Product({required this.name, required this.description});

//product({ req this.id,rq this.name, rq this.description});
Product.withId( this.id, this.name, this.description);

Map<String,dynamic>? toMap(){
var map = Map<String,dynamic>();
map["name"]=name;
map["description"]=description;
if(id!=null){
  map["id"]=id!;
}
return map;
}
Product.fromObject(Map map){
  this.id=int.tryParse(map["id"].toString());
  this.name=map["name"].toString();
  this.description=map["description"].toString();

}

}