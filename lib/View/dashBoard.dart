import 'package:flutter/material.dart';

class dashBoard extends StatefulWidget {
  String email;
  String epassword;
  dashBoard({required this.email,required this.epassword});
  @override
  State<StatefulWidget> createState(){
    return dashboardState();
  }
}

class dashboardState extends State<dashBoard>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
        title : const Text("Ma deuxième page"),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.yellow,
      body : Center(
          child : Text("${widget.email} et ${widget.epassword}")
      ),
    );
  }
}