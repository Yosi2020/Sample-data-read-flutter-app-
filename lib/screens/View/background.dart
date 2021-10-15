import 'package:flutter/material.dart';
import 'package:debo_eyu/screens/Themes/component/new1.dart';

class BackgroundScreen extends StatelessWidget{
  final int optionSelected;

  const BackgroundScreen({Key key, @required this.optionSelected}): super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<int> y =[0,];
    int x;
    if (optionSelected != null){
      y.add(optionSelected);
      x = y.last;
    }
    else {
      x = y.last;
    }
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(x != 0 ?
              months[x-1]['img']: "assets/images/AA.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.white70, BlendMode.darken)
          )
      ),
    );
  }
}