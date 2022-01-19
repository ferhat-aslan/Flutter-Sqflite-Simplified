import 'package:demo_sql/data/dbHelper.dart';
import 'package:demo_sql/models/product.dart';
import 'package:demo_sql/screens/product_add.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  var dbHelper = DbHelper();
  List<Product>? products=[];
  int productcount = 0;
  @override
  void initState() {
    setState(() {
          getProducts();

    });
    print(products);
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    print("data ${products}");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ürün Listesi"),
        ),
        body:buildProductList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            goToProductAdd(context);
          },
          child: Icon(Icons.add),
          tooltip: "Yeni Ürün Ekle",
        ),
      ),
    );
  }

  Widget buildProductList() {
    return  ListView.builder(
        itemCount: productcount,
        itemBuilder: (BuildContext context, int index) {
         print("data ${products!}");
          return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black12,
                  child: Text("P"),
                ),
                title: Text(products![index].name.toString()),
                subtitle: Text(products![index].description.toString()),
                onTap: () {},
              );
        });
  }
void goToProductAdd(BuildContext context) async{
bool result=  await Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductAdd()));
if(result!=null){
  if(result){
    print("result $result" );
    getProducts();
  }
  
}
}
void getProducts()async {
  var productsFuture = dbHelper.getProduct();
    productsFuture.then((data) {
      products = data;
      productcount = data!.length;
      for(int i=0;i<productcount;i++){print("data ${products![i].id}  "+i.toString() );}
      
      print(productcount);
    });
    setState(() {
      productcount;
    });
}
}




