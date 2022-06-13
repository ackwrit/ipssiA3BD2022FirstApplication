
import 'package:cloud_firestore/cloud_firestore.dart';

// Constructeur de la classe utilisateur via Firebase

class Utilisateur {
  //Attributs
  late String id ;
  late String nom;
  late String prenom;
  late String mail;
  String? avatar;
  String? pseudo;
  DateTime birthday =  DateTime.now();




  //Constructeur
  Utilisateur(DocumentSnapshot snapshot){
    String? provisoire;
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    nom = map["NOM"];
    prenom = map["PRENOM"];
    mail = map["MAIL"];
    provisoire = map["AVATAR"];
    if(provisoire == null){
      // Une image spécifique que je vais luis donner
      avatar = "";
    }
    else
      {
        avatar = provisoire;
      }
    provisoire = map["PSEUDO"];
    if(provisoire == null){
      // Une image spécifique que je vais luis donner
      pseudo = "";
    }
    else
    {
      pseudo = provisoire;
    }
    Timestamp timestamp = map["BIRTHDAY"];
    birthday = timestamp.toDate();

  }






}