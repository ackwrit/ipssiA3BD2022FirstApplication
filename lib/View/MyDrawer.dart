import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipssiaa3bd2022firstapplication/Services/FirestoreHelper.dart';
import 'package:ipssiaa3bd2022firstapplication/Services/global.dart';
import 'package:file_picker/file_picker.dart';

class MyDrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyDrawerState();
  }

}

class MyDrawerState extends  State<MyDrawer>{
  //Variable
  String? nomImage;
  String? urlImage;
  Uint8List? bytesImage;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child:  Center(
            child: Column(
              children: [
                //Avatar cliquable
                InkWell(
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(GlobalUser.avatar!),
                          fit: BoxFit.fitHeight
                      ),
                    ),

                  ),
                  onTap: (){
                    print("J'ai cliquer sur l'image");
                    pickImage();
                  },
                ),
                SizedBox(height: 10,),




                //Pseudo qui pourra changer
               TextButton.icon(

                   onPressed: (){

                   } ,
                   icon: const Icon(Icons.edit),
                   label: Text(GlobalUser.pseudo!)
               ),




                // nom et prénom complet
                Text(GlobalUser.nomComplet()),


                // adresee mail
                Text(GlobalUser.mail),


                ElevatedButton.icon(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.exit_to_app_sharp),
                    label: const Text("Fermer")
                )




              ],
            ),
          ),
        )
    );

  }

  //Fonction

  //Choisir l'image
  Future pickImage() async{
    FilePickerResult? resultat = await FilePicker.platform.pickFiles(
      withData: true,
      type: FileType.image
    );
    if (resultat != null){
      nomImage = resultat.files.first.name;
      bytesImage = resultat.files.first.bytes;
      MyPopUp();
      
    }



  }
  
  //Création de notre popUp
MyPopUp(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context){
          if(Platform.isIOS){
            return CupertinoAlertDialog(
              title: const Text("Mon image"),
              content: Image.memory(bytesImage!),
              actions: [
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, 
                    child: const Text("Annuler"),
                ),

                ElevatedButton(
                  onPressed: (){
                    //Stocker et on va récupérer son url
                    FirestoreHelper().stockageImage(bytesImage!, nomImage!).then((value){
                      setState(() {
                        GlobalUser.avatar = value;
                        urlImage = value;
                      });
                      //Mettre à jour notre base de donnée en stockant l'url
                      Map<String,dynamic> map ={
                        //Key : Valeur
                        "AVATAR":urlImage
                      };
                      FirestoreHelper().updateUser(GlobalUser.id, map);



                      Navigator.pop(context);
                    });







                  },
                  child: const Text("Enregistrement"),
                ),
              ],
            );
          }
          else {
            return AlertDialog(
              title: const Text("Mon image"),
              content: Image.memory(bytesImage!),
              actions: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text("Annuler"),
                ),

                ElevatedButton(
                  onPressed: (){
                    //Stocker et on va récupérer son url
                    FirestoreHelper().stockageImage(bytesImage!, nomImage!).then((value){
                      setState(() {
                        GlobalUser.avatar = value;
                        urlImage = value;
                      });
                      //Mettre à jour notre base de donnée en stockant l'url
                      Map<String,dynamic> map ={
                        //Key : Valeur
                        "AVATAR":urlImage
                      };
                      FirestoreHelper().updateUser(GlobalUser.id, map);



                      Navigator.pop(context);
                    });
                  },
                  child: const Text("Enregistrement"),
                ),
              ],
              
            );
          }
        }
    );
}



}