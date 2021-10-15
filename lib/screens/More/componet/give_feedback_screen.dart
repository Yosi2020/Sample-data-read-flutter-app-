import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FeedbackScreen extends StatefulWidget{
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen>{

  final controllername = TextEditingController();
  final controllerTo = TextEditingController();
  final controllerSubject = TextEditingController();
  final controllerMessgae = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Giving Feedback Screen"),
          centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            buildTextField(title: "Name", controller: controllername,
            autoHint: "Eyosiyas Tibebu"),
            SizedBox(height: 16,),
            buildTextField(title: "To", controller: controllerTo,
            autoHint: "test@gmail.com"),
            SizedBox(height: 16,),
            buildTextField(title: "Subject", controller: controllerSubject,
            autoHint: "My Subject"),
            SizedBox(height: 16,),
            buildTextField(title: "Messgae", controller: controllerMessgae,
            maxLines: 8, autoHint: "My Message"),
            const SizedBox(height: 32,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
                textStyle: TextStyle(fontSize: 20),
              ),
              child: Text("SEND"), onPressed: ()=>launchEmail(
              name: controllername.text,
              email : controllerTo.text,
              subject : controllerSubject.text,
              message : controllerMessgae.text,
            ),
            ),
          ],
        ),
      ),
    );
  }

  Future launchEmail({
    @required String name,
    @required String email,
    @required String subject,
    @required String message,
}) async {
    final serviceId = 'service_g1bxcvq';
    final templateId = "template_g93o19f";
    final userId = "user_HTXBj0yjSL81UIgKx82CO";

    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http.post(
      url,
        headers: {
        'Content-Type':"application/json",
        },
        body: json.encode({
        'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params' :{
          'user_name': name,
            'user_email': email,
            'to_email': 'other.email@gmail.com',
            'user_subject':subject,
            "user_message": message,
          }
    },),
    );
    print (response.body);
    }
    Widget buildTextField({
      @required String title,
      @required TextEditingController controller,
      int maxLines = 1,
      @required String autoHint,
    }) =>
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold
            ),),
            TextField(
              controller: controller,
              maxLines: maxLines,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: autoHint,
              ),
            )
          ],
        );
}