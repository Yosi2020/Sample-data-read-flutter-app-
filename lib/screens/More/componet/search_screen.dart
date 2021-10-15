import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';


class SearchScreen extends StatefulWidget{
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>{
  var _suggestionTextFiledController = new TextEditingController();
  List SuggestionList = [
    "Apple",
    "Armidillo",
    "Actual",
    "Actuary",
    "America",
    "Argentina",
    "Australia",
    "Antarctica",
    "Blueberry",
    "Cheese",
    "Danish",
    "Eclair",
    "Fudge",
    "Granola",
    "Hazelnut",
    "Ice Cream",
    "Jely",
    "Kiwi Fruit",
    "Lamb",
    "Macadamia",
    "Nachos",
    "Oatmeal",
    "Palm Oil",
    "Quail",
    "Rabbit",
    "Salad",
    "T-Bone Steak",
    "Urid Dal",
    "Vanilla",
    "Waffles",
    "Yam",
    "Zest"
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Searching"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            AutoCompleteTextField(
              controller: _suggestionTextFiledController,
              clearOnSubmit: false,
              suggestions: SuggestionList,
              style: TextStyle(color: Colors.black, fontSize: 16.0),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              itemFilter: (item, query){
                return item.toLowerCase().startsWith(query.toLowerCase());
                },
              itemSorter: (a, b){
                return a.compareTo(b);
                },
              itemSubmitted: (item){
                _suggestionTextFiledController.text = item;
                },
              itemBuilder: (context, item){
                return Container(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        item,
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                );
                },
            ),
          ],
        ),
      ),
    );
  }
}