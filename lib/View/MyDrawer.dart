import 'package:flutter/material.dart';
import 'package:ipssiaa3bd2022firstapplication/Services/global.dart';

class MyDrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyDrawerState();
  }

}

class MyDrawerState extends  State<MyDrawer>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(20),
      child:  Center(
        child: Column(
          children: [
            //Avatar cliquable
            Container(
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(GlobalUser.avatar!)
                ),
              ),

            ),



            //Pseudo qui pourra changer


            // nom et prénom complet


            // adresee mail


            //Date de naissnace



          ],
        ),
      ),
    );
  }

}