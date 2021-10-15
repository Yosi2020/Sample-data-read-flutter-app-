import 'package:debo_eyu/constants.dart';
import 'package:debo_eyu/screens/View/view_Screen.dart';
import 'package:flutter/material.dart';
import 'package:debo_eyu/components/primary_button.dart';
import 'package:debo_eyu/screens/Themes/component/new1.dart';

class ThemeScreen extends StatefulWidget{
  ThemeScreen({Key key}) : super(key: key);
  @override
  _ThemeScreenState createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen>{
  int optionSelected = 0;

  void checkOption(int index) {
    setState(() {
      optionSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:Text('Theme Debo'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding
          ),
          child: Column(
            children: [
              SizedBox(height: kDefaultPadding,),
              PrimaryButton(
                text: "set Background photo",
                press: ()=>  Navigator.push(
                  context, MaterialPageRoute(builder: (context)
                =>ViewScreen(optionSelected : optionSelected)
                ),),
              ),
              SizedBox(height: kDefaultPadding,),
              Expanded(
                  child: GridView.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                    children: <Widget> [
                      for (int i = 0; i < months.length; i++)
                        MonthOption(
                          months[i]['month'] as String,
                          img: months[i]['img'] as String,
                          onTap: () => checkOption(i + 1),
                          selected: i + 1 == optionSelected,
                        ),
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class MonthOption extends StatelessWidget {
  const MonthOption(
      this.title, {
        Key key,
        this.img,
        this.onTap,
        this.selected,
      }) : super(key: key);

  final String title;
  final String img;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Ink.image(
      fit: BoxFit.cover,
      image: AssetImage(img),
      child: InkWell(
        onTap: onTap,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: selected ?? false ? Colors.red : Colors.transparent,
                  width: selected ?? false ? 5 : 0,
                ),
              ),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Row(children: <Widget>[
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: selected ?? false
                      ? Colors.blue.withOpacity(0.8)
                      : Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  title ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key key,
    this.optionSelected,
  }) : super(key: key);

  final int optionSelected;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [Colors.black, Colors.black12],
        begin: Alignment.bottomCenter,
        end: Alignment.center,
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(months[optionSelected]['img']),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
          ),
        ),
      ),
    );
  }
}