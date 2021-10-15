import 'package:debo_eyu/constants.dart';
import 'package:debo_eyu/screens/Home/home.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Spacer(flex: 2,),
          Image.asset('assets/images/debo2.jpg'),
          Spacer(flex: 3,),
          Text("Welcome to our Debo Education\n application",
          style: Theme.of(context).textTheme.headline5.copyWith(
            fontWeight: FontWeight.bold
          ),),
          Spacer(flex: 2,),
          Text('Debo engineering plc is integrated engineering '
              'private \ncompany that provides innovative and '
              'problem solving \nservices based on the most '
              'advanced and emerging \ntechnologies such us '
              'IOT, AI, IP, Data science and etc'),
          Spacer(flex: 3,),
          FittedBox(
            child: TextButton(onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) =>
                MyBottomBarDemo())
            ),
            child: Row(
              children: [
                Text("Skip",
                  style: Theme.of(context).textTheme
                  .bodyText1.copyWith(color : Theme.of(context)
                      .textTheme
                      .bodyText1
                      .color
                      .withOpacity(0.8),),),
                SizedBox(width: kDefaultPadding / 4,),
                Icon(Icons.arrow_forward_ios,
                size:  16,
                color: Theme.of(context).textTheme.bodyText1
                    .color.withOpacity(0.8),)
              ],
            ) ,)
          )
        ],
      )),

    );
  }
}