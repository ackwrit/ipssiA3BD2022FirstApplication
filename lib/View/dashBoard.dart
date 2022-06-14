import 'package:flutter/material.dart';
import 'package:ipssiaa3bd2022firstapplication/Services/librairie.dart';
import 'package:ipssiaa3bd2022firstapplication/View/MyDrawer.dart';

class dashBoard extends StatefulWidget {



  @override
  State<StatefulWidget> createState(){
    return dashboardState();
  }
}

class dashboardState extends State<dashBoard>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: Container(
        width: MediaQuery.of(context).size.width/2,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: MyDrawer(),
      ),

      appBar : AppBar(
        title : const Text("Ma deuxième page"),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.yellow,
      body : Center(
          child : Text("${GlobalUser.id}")
      ),
    );
  }
}