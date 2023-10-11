// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/locationProvider.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> context.go('/add'), icon: Icon(Icons.add)),
        actions: [
          IconButton(onPressed: ()=> context.go('/settings'), icon: Icon(Icons.settings))
        ],
        backgroundColor: Colors.red,
        title: Text(context.watch<LocationProvider>().getName),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.amberAccent,
              child: Padding(
                padding: EdgeInsets.all(10.0), 
                child: Text("Container 1"),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.amber,
              child: Padding(
                padding: EdgeInsets.all(10.0), 
                child: Text("Container 2"),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.blueAccent,
              child: Padding(
                padding: EdgeInsets.all(10.0), 
                child: Text("Container 3"),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.greenAccent,
              child: Padding(
                padding: EdgeInsets.all(10.0), 
                child: Text("Container 4"),
              ),
            )
          ],
        ),
      ),
    );
  }
}