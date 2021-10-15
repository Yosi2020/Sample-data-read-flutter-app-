import 'package:debo_eyu/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:debo_eyu/screens/View/background.dart';
import "package:share/share.dart";

class ViewScreen extends StatelessWidget{
  final Product product;
  final int optionSelected;

  const ViewScreen({Key key, this.product, @required this.optionSelected}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        BackgroundScreen(optionSelected: optionSelected,),
        Scaffold(
          backgroundColor: Colors.transparent,
          //appBar:AppBar(title: Text("${product.title}")),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 3,),
                Container(
                  child: Center(
                    child: Text("Connect me with your data-set please!!",
                      style : const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30), textAlign: TextAlign.center
                  ),
                ),
                ),
                Spacer(flex: 2,),
                Expanded(
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //SizedBox(width: 20,),
                        Spacer(flex: 2,),
                        IconButton(icon:
                        Icon(Icons.share, color: Colors.white70),
                        onPressed: ()=> Share.share("text")
                        ),
                        //FutureBuilder(builder: checkFav(itmes[index]),
                        // builder: (context, snapshot){
                          //if (snapshot.hasData)
                           // return IconButton(onPressed: null,
                            //    icon: Icon(Icons.favorite,
                             //   color: Colors.red,), )
                              //  else
                               //   return IconButton(
                                //    icon: Icon(Icons.favorite_border) ,
                                 //   onPressed: null,)
                           // }
                        Spacer(flex: 10,),
                        IconButton(onPressed: ()=>Icon(Icons.favorite,
                          color: Colors.red,) ,
                            icon: Icon(Icons.favorite_border, color: Colors.red
                              ,),)
                      ],
                    ), ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}