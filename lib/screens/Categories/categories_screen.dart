import 'package:debo_eyu/screens/View/view_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:debo_eyu/model/products_model.dart';
import 'package:debo_eyu/screens/Categories/componet/eyu.dart';

class CategoriesScreen extends StatelessWidget{

  //const CategoriesScreen({Key key, this.optionSelected}): super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Categories Screen"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 10,
                  childAspectRatio: .70,
                ),
                itemBuilder: (context, index) => ItemCard(
                  product: products[index],
                  press: ()=> Navigator.push(
                    context, MaterialPageRoute(builder: (context)
                  =>ViewScreen(product: products[index],)
                  ),),
                ),
              )))
        ],
      )
    );
  }
}