import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/settings_provider.dart';

class Settings extends StatefulWidget {
  const Settings({ Key? key }) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

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
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20), 
                    child: Text("JENDNOSTKI", style: TextStyle(color: Colors.grey, fontSize: 13, ))),
                  ListTile(
                    title: Text("Jednostka temperatury", style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(context.watch<SettingsProvider>().getDefaultSettings["temperatureUnit"]),
                    trailing: PopupMenuButton(
                      color: Colors.grey,
                      itemBuilder: (context) => [
                        for(int i = 0; i < Provider.of<SettingsProvider>(context,listen: false).getTemperatureUnit.length; i++)
                          PopupMenuItem(
                            child: Text(Provider.of<SettingsProvider>(context,listen: false).getTemperatureUnit[i]),
                            value: Provider.of<SettingsProvider>(context,listen: false).getTemperatureUnit[i],
                          ),
                      ],
                      onSelected: (String value){
                          context.read<SettingsProvider>().setTemperatureUnit(value);
                      },
                    ),
                  ),

                  ListTile(
                    title:Text("Jednostka prędkości wiatru", style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(context.watch<SettingsProvider>().getDefaultSettings["utniOfWindSpeed"]),
                    trailing: PopupMenuButton(
                      color: Colors.grey,
                      itemBuilder: (context) => [
                        for(int i = 0; i < Provider.of<SettingsProvider>(context,listen: false).getUtniOfWindSpeed.length; i++)
                          PopupMenuItem(
                            child: Text(Provider.of<SettingsProvider>(context,listen: false).getUtniOfWindSpeed[i]),
                            value: Provider.of<SettingsProvider>(context,listen: false).getUtniOfWindSpeed[i],
                          ),
                      ],
                      onSelected: (String value){
                          context.read<SettingsProvider>().setUtniOfWindSpeed(value);
                      },
                    ),
                  ),

                  ListTile(
                    title:Text("Jednostka ciśnienia atmosferycznego", style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(context.watch<SettingsProvider>().getDefaultSettings["unitOfAtmosphericPressure"]),
                    trailing: PopupMenuButton(
                      color: Colors.grey,
                      itemBuilder: (context) => [
                        for(int i = 0; i < Provider.of<SettingsProvider>(context,listen: false).getUnitOfAtmosphericPressure.length; i++)
                          PopupMenuItem(
                            child: Text(Provider.of<SettingsProvider>(context,listen: false).getUnitOfAtmosphericPressure[i]),
                            value: Provider.of<SettingsProvider>(context,listen: false).getUnitOfAtmosphericPressure[i],
                          ),
                      ],
                      onSelected: (String value){
                          context.read<SettingsProvider>().setUnitOfAtmosphericPressure(value);
                      },
                    ),
                  ),
                  Divider(color: Colors.grey, height: 2,)
                  
                ],
              )
            ),

            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20), 
                    child: Text("POZOSTAŁE USTAWIENIA", style: TextStyle(color: Colors.grey, fontSize: 13, ))),
                  ListTile(
                    title: Text("Automatycznie aktualizuj w nocy", style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text("Zaktualizuj informacje o pogodzie między 23:00 a 07:00"),
                    trailing: Switch(
                      value: context.watch<SettingsProvider>().getDefaultSettings["autoUpdate"],
                      onChanged: (value){
                          context.read<SettingsProvider>().setAutoUpdate(value);
                      },
                    )
                  ),

                  ListTile(
                    title:Text("Efekty dźwiękowe", style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text("Efekty dźwiękowe towarzyszą zmianom pogody"),
                    trailing: Switch(
                      value: context.watch<SettingsProvider>().getDefaultSettings["soundEffect"],
                      onChanged: (value){
                        context.read<SettingsProvider>().setSoundEffect(value);
                      },
                    )
                  ),
                  Divider(color: Colors.grey, height: 2,)
                  
                ],
              )
            ),

            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20), 
                    child: Text("O POGODZIE", style: TextStyle(color: Colors.grey, fontSize: 13, ))),
                  ListTile(
                    title: Text("Opinia", style: TextStyle(fontWeight: FontWeight.bold),),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: (){
                        showCupertinoDialog<void>(
                          context: context, 
                          builder: (BuildContext context){
                            return CupertinoAlertDialog(
                              title: const Text("Oceń Pogodę"),
                              actions:<CupertinoDialogAction>[
                                CupertinoDialogAction(
                                  child: const Text("Później"),
                                  isDestructiveAction: true,
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),

                                CupertinoDialogAction(
                                  child: const Text("Oceń teraz"),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                )

                              ],
                            );
                          }
                        );
                      },
                    )
                  ),

                  ListTile(
                    title:Text("Polityka Prywatności", style: TextStyle(fontWeight: FontWeight.bold),),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: (){
                        
                      },
                    )
                  ),  
                ],
              )
            ),
          ],
        )
      ),
    );
  }
}