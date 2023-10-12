import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class Settings extends StatelessWidget {
const Settings({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> context.go('/'), icon: Icon(Icons.arrow_back, color: Colors.black,)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Ustawienia", style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      ),
    );
  }
}