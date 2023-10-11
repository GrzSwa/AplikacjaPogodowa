import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/locationProvider.dart';

class Settings extends StatefulWidget {
  const Settings({ Key? key }) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: (){
          context.read<LocationProvider>().changeCity("Tarnobrzeg");
        },
        child: Text("CLICK"),),
    );
  }
}