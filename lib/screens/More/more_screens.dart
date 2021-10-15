import 'package:debo_eyu/constants.dart';
import 'package:debo_eyu/screens/More/componet/favorities_screen.dart';
import 'package:debo_eyu/screens/More/componet/search_screen.dart';
import 'package:debo_eyu/screens/More/componet/suggest_fact_screen.dart';
import 'package:flutter/material.dart';
import 'package:debo_eyu/screens/More/componet/give_feedback_screen.dart';
import 'package:share/share.dart';

class MoreScreen extends StatefulWidget{
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
        "More option"
      ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Facts", style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(
                  fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            CustomListTile(Icons.search, "Search", () => Navigator.push(
                context, MaterialPageRoute(builder: (context) =>
                SearchScreen())), Colors.grey),
            CustomListTile(Icons.menu_book, "Suggest Fact", ()=>Navigator.push(
                context, MaterialPageRoute(builder: (context) =>
                SfactScreen())), Colors.blueGrey),
            CustomListTile(Icons.favorite, "Favorities", ()=>Navigator.push(
                context, MaterialPageRoute(builder: (context) =>
                FavoritiesScreen())), Colors.red),
            ListTile(
              title: Text("About Us", style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .color
                    .withOpacity(0.8)
              )
              ),
              ),
            CustomListTile2(Icons.question_answer, "Share this app", ()=>
              Share.share("Text"), Colors.orange),
            CustomListTile2(Icons.star_rate_rounded, "Review this app", ()=>{}, Colors.yellow),
            CustomListTile2(Icons.help, "Help", ()=>{}, Colors.blueAccent),
            CustomListTile2(Icons.message_rounded, "Give us Feedback", ()=>Navigator.push(
                context, MaterialPageRoute(builder: (context) =>
                FeedbackScreen())), Colors.indigo),
          ],
        ),
      ),
    );
  }
}


class CustomListTile extends StatelessWidget{

  IconData icon;
  String text;
  final VoidCallback onTap;
  Color color1;

  CustomListTile(this.icon, this.text, this.onTap, this.color1);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: const EdgeInsets.fromLTRB(
            kDefaultPadding, 0, kDefaultPadding, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade400))
        ),
      child: InkWell(
        splashColor: Colors.greenAccent,
      onTap: onTap,
        child: Container(
          height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Icon(icon,color: color1,),
              Padding(padding: const EdgeInsets.all(8.0),
              child:Text(text,style: TextStyle(fontSize: 16.0),),),],),
          Icon(Icons.arrow_right),
        ],
      ),
    ),
    ),
      ),
    );
  }
}

class CustomListTile2 extends StatelessWidget{

  IconData icon;
  String text;
  Function onTap;
  Color color;

  CustomListTile2(this.icon, this.text, this.onTap, this.color);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          kDefaultPadding, 0, kDefaultPadding, 0),
    child: Container(
    decoration: BoxDecoration(
    border: Border(bottom: BorderSide(color: Colors.grey.shade400))
    ),
      child: InkWell(
        splashColor: Colors.greenAccent,
        onTap: onTap,
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Icon(icon, color: color,),
          Padding(padding: const EdgeInsets.all(8.0)),
                  Text(text,style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    )
    );
  }
}