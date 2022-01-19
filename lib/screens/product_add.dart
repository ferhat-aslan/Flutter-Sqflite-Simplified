import 'package:demo_sql/data/dbHelper.dart';
import 'package:demo_sql/models/product.dart';
import 'package:flutter/material.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({Key? key}) : super(key: key);

  @override
  _ProductAddState createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  var dbHelper=DbHelper();
  var txtName = TextEditingController();
  var dscName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Yeni Ürün Ekle"),
        ),
        body: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              buildNameField(),
              buildDescriptionField(),
              buildSaveButton()
            ],
          ),
        ),
      ),
    );
  }

  buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Adı"),
      controller: txtName,
    );
  }

  buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Tanımı"),
      controller: dscName,
    );
  }

  buildSaveButton() {
    return TextButton(
      onPressed: () {addProduct();},
      child: Text("Kaydet"),
    );
  }

  void addProduct() async{
  var result=  await dbHelper.insert(Product(name: txtName.text,description:dscName.text));
Navigator.pop(context,true); 
print(result);
  }
}
