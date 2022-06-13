import 'package:flutter/material.dart';
import 'package:ipssiaa3bd2022firstapplication/View/dashBoard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String mail = "";
  String password = "";




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Padding(
        child : bodyPage(),
        padding : const EdgeInsets.all(10),

      )
    );
  }


  Widget bodyPage(){
    //Créer un design de connexion comportant des champs d'entrée et un bouton
    //3 éléments(adresse mail, mot de passe , bouton) + 1 élément de logo
    return Column(
      children : [
        //Logo

        Container(
          height : 80,
          decoration : const BoxDecoration(
              shape : BoxShape.circle,
              image : DecorationImage(
                  image : NetworkImage("https://medias.pourlascience.fr/api/v1/images/view/5d1b663a8fe56f77c8671165/wide_1300/image.jpg"),
                  fit : BoxFit.fill

              )
          ),
        ),







        //Champs adresse mail
        const SizedBox(height : 10),

        TextField(
            decoration : InputDecoration(
                hintText : "Entrer votre adresse mail",
                icon : const Icon(Icons.mail),
                border : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                )
            ),
            onChanged : (String value){
              setState((){
                mail = value;
              });




            }

        ),



        //champs mot de passe

        const SizedBox(height : 10),


        TextField(
            obscureText : true,
            decoration : InputDecoration(
              hintText : "Entrer votre mot de passe",
              icon : const Icon(Icons.lock),
              border : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
              ),

            ),
            onChanged : (value){
              setState((){
                password = value;
              });
            }


        ),



        //Bouton
        const SizedBox(height : 10),

        ElevatedButton(
            onPressed : (){
              print("J'ai appuyé");
              print(mail);
              Navigator.push(context,MaterialPageRoute(
                  builder : (context){
                    return dashBoard(email : mail, epassword : password);              }
              ));
            },
            child : const Text("Connexion")

        )

      ],
    );
  }
}
