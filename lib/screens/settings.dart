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
        leading: IconButton(onPressed: ()=> context.go('/'), icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Ustawienia", style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20), 
                    child: Text("JENDNOSTKI", style: TextStyle(color: Colors.grey, fontSize: 13, ))),
                  ListTile(
                    title: const Text("Jednostka temperatury", style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(context.watch<SettingsProvider>().getDefaultSettings["temperatureUnit"]),
                    trailing: PopupMenuButton(
                      color: Colors.grey,
                      itemBuilder: (context) => [
                        for(int i = 0; i < Provider.of<SettingsProvider>(context,listen: false).getTemperatureUnit.length; i++)
                          PopupMenuItem(
                            value: Provider.of<SettingsProvider>(context,listen: false).getTemperatureUnit[i],
                            child: Text(Provider.of<SettingsProvider>(context,listen: false).getTemperatureUnit[i]),
                          ),
                      ],
                      onSelected: (String value){
                          context.read<SettingsProvider>().setTemperatureUnit(value);
                      },
                    ),
                  ),

                  ListTile(
                    title:const Text("Jednostka prędkości wiatru", style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(context.watch<SettingsProvider>().getDefaultSettings["utniOfWindSpeed"]),
                    trailing: PopupMenuButton(
                      color: Colors.grey,
                      itemBuilder: (context) => [
                        for(int i = 0; i < Provider.of<SettingsProvider>(context,listen: false).getUtniOfWindSpeed.length; i++)
                          PopupMenuItem(
                            value: Provider.of<SettingsProvider>(context,listen: false).getUtniOfWindSpeed[i],
                            child: Text(Provider.of<SettingsProvider>(context,listen: false).getUtniOfWindSpeed[i]),
                          ),
                      ],
                      onSelected: (String value){
                          context.read<SettingsProvider>().setUtniOfWindSpeed(value);
                      },
                    ),
                  ),

                  ListTile(
                    title:const Text("Jednostka ciśnienia atmosferycznego", style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(context.watch<SettingsProvider>().getDefaultSettings["unitOfAtmosphericPressure"]),
                    trailing: PopupMenuButton(
                      color: Colors.grey,
                      itemBuilder: (context) => [
                        for(int i = 0; i < Provider.of<SettingsProvider>(context,listen: false).getUnitOfAtmosphericPressure.length; i++)
                          PopupMenuItem(
                            value: Provider.of<SettingsProvider>(context,listen: false).getUnitOfAtmosphericPressure[i],
                            child: Text(Provider.of<SettingsProvider>(context,listen: false).getUnitOfAtmosphericPressure[i]),
                          ),
                      ],
                      onSelected: (String value){
                          context.read<SettingsProvider>().setUnitOfAtmosphericPressure(value);
                      },
                    ),
                  ),
                  const Divider(color: Colors.grey, height: 2,)
                  
                ],
              )
            ),

            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20), 
                    child: Text("POZOSTAŁE USTAWIENIA", style: TextStyle(color: Colors.grey, fontSize: 13, ))),
                  ListTile(
                    title: const Text("Automatycznie aktualizuj w nocy", style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: const Text("Zaktualizuj informacje o pogodzie między 23:00 a 07:00"),
                    trailing: Switch(
                      value: context.watch<SettingsProvider>().getDefaultSettings["autoUpdate"],
                      onChanged: (value){
                          context.read<SettingsProvider>().setAutoUpdate(value);
                      },
                    )
                  ),

                  ListTile(
                    title:const Text("Efekty dźwiękowe", style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: const Text("Efekty dźwiękowe towarzyszą zmianom pogody"),
                    trailing: Switch(
                      value: context.watch<SettingsProvider>().getDefaultSettings["soundEffect"],
                      onChanged: (value){
                        context.read<SettingsProvider>().setSoundEffect(value);
                      },
                    )
                  ),
                  const Divider(color: Colors.grey, height: 2,)
                  
                ],
              )
            ),

            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20), 
                    child: Text("O POGODZIE", style: TextStyle(color: Colors.grey, fontSize: 13, ))),
                  ListTile(
                    title: const Text("Opinia", style: TextStyle(fontWeight: FontWeight.bold),),
                    trailing: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: (){
                        showCupertinoDialog<void>(
                          context: context, 
                          builder: (BuildContext context){
                            return CupertinoAlertDialog(
                              title: const Text("Oceń Pogodę"),
                              actions:<CupertinoDialogAction>[
                                CupertinoDialogAction(
                                  isDestructiveAction: true,
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Później"),
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
                    title:const Text("Polityka Prywatności", style: TextStyle(fontWeight: FontWeight.bold),),
                    trailing: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: (){
                        
                      },
                    )
                  ), 
                  const Divider(color: Colors.grey, height: 2,)
                ],
              )
            ),

            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 5.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20), 
                    child: Text("ZABEZPIECZENIA", style: TextStyle(color: Colors.grey, fontSize: 13, ))),
                  ListTile(
                    title:const Text("Wyłącz zabezpieczenia (nie zalecane)", style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: const Text("Twoje dane dotyczące lokalizacji mogą zostać przechwycone przez nieodpowiednie osoby"),
                    trailing: Switch(
                      activeColor: Colors.red,
                      value: context.watch<SettingsProvider>().getDefaultSettings["security"],
                      onChanged: (value){
                        context.read<SettingsProvider>().setSecurity(value);
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