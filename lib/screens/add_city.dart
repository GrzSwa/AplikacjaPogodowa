import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/locationProvider.dart';
import 'package:weather_app/services/location_service.dart';

class AddCity extends StatefulWidget {
  const AddCity({ Key? key }) : super(key: key);

  @override
  _AddCityState createState() => _AddCityState();
}

class _AddCityState extends State<AddCity> {
  LocationService locationService = LocationService();
  final List<String> cities = ['Warszawa','Sandomierz','Gdańsk','Kraków','Bytom','Wrocław','Poznań','Wieliczka', 'Lublin','Katowice','Tarnobrzeg','Szczecin'];
  List<Map<dynamic,dynamic>> endpointCities = [];
  late TextEditingController _textController;
  String text = '';

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void getCity(String city) async{
    var prepareData = city.toLowerCase()
      .replaceAll("ą", "a")
      .replaceAll("ę", "e")
      .replaceAll("ć", "c")
      .replaceAll("ż", "z")
      .replaceAll("ź", "z")
      .replaceAll("ó", "o")
      .replaceAll("ł", "l")
      .replaceAll("ń", "n")
      .replaceAll("ś", "s");
    
    var response = await locationService.getCity(
      "127.0.0.1:30000",
      "/search/",
      {
        "search_name":prepareData, 
      }
    );
    setState(() {
      endpointCities = response;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5), 
            child: TextButton(
              onPressed: ()=> context.go('/add'), 
              child: const Text("Anuluj", 
                style: TextStyle(color: Colors.blueAccent, fontSize: 16),
              )
            )
          )
        ],
        title: SizedBox(
          height: AppBar().preferredSize.height / 1.5,
          child: TextField(
            controller: _textController,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
            decoration: InputDecoration(
              labelText: _textController.text.isEmpty ? 'Dodaj lokalizację' : '',
              labelStyle: const TextStyle(color: Colors.grey),
              fillColor: const Color.fromARGB(255, 225, 225, 225),
              filled: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(Icons.search, size: 16, color: Colors.grey),
              floatingLabelBehavior: FloatingLabelBehavior.never
            ),
            maxLines: 1,
            onSubmitted: (value){
              if(value != '') {
                getCity(value);
                setState(() {
                  text = value;
                });
              }
            },
          ),
        )
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 5), 
              child: Text(endpointCities.isEmpty ?'Popularne miasta' : "Dopasowania", style: const TextStyle(color: Colors.grey),)
            ),
            const SizedBox(height: 10,),
            if(endpointCities.isEmpty)
              Wrap(
                children: [
                  for(int i = 0; i < cities.length; i++)
                    GestureDetector(
                      onTap: (){
                        getCity(cities[i]);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 225, 225, 225),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(cities[i]),
                      ),
                    ),
                ],
              )
            else
              Expanded(
                child:ListView.builder(
                  itemCount: endpointCities.length,
                  itemBuilder: (context,index){
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 5,),
                      margin: const EdgeInsets.only(top: 5),
                      child: ListTile(
                        title: Text(endpointCities[index]["display_name"].toString().split(",")[0], style: const TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text("${endpointCities[index]["display_name"].toString().split(",")[1]}, ${endpointCities[index]["display_name"].toString().split(",")[2]}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.add), 
                          onPressed: () {
                            Provider.of<LocationProvider>(context, listen: false).addLocation(endpointCities[index]);
                            context.go("/add");
                          },
                        ),
                      )
                    );
                  }
                )
              )
          ],
        )
        
       
      ),
    );
  }
}