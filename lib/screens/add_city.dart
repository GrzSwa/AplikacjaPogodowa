import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddCity extends StatefulWidget {
  const AddCity({ Key? key }) : super(key: key);

  @override
  _AddCityState createState() => _AddCityState();
}

class _AddCityState extends State<AddCity> {
  final List<String> cities = ['Warszawa','Sandomierz','Gdańsk','Kraków','Bytom','Wrocław','Poznań','Wieliczka', 'Lublin','Katowice','Tarnobrzeg','Szczecin'];
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
            padding: EdgeInsets.only(right: 5), 
            child: TextButton(
              onPressed: ()=> context.go('/add'), 
              child: Text("Anuluj", 
                style: TextStyle(color: Colors.blueAccent, fontSize: 16),
              )
            )
          )
        ],
        title: SizedBox(
          height: AppBar().preferredSize.height / 1.5,
          child: TextField(
            controller: _textController,
            style: TextStyle(fontSize: 16, color: Colors.grey),
            decoration: InputDecoration(
              labelText: _textController.text.isEmpty ? 'Dodaj lokalizację' : '',
              labelStyle: TextStyle(color: Colors.grey),
              fillColor: Color.fromARGB(255, 225, 225, 225),
              filled: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.search, size: 16, color: Colors.grey),
              floatingLabelBehavior: FloatingLabelBehavior.never
            ),
            maxLines: 1,
            onChanged: (value) {
              setState(() {
                text = _textController.text;
              });
            },
          ),
        )
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15, left: 5), 
              child: Text('Popularne miasta', style: TextStyle(color: Colors.grey),)
            ),
            const SizedBox(height: 10,),
            Wrap(
              children: [
                for(int i = 0; i < cities.length; i++)
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 225, 225, 225),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(cities[i]),
                    ),
                  ),
              ],
            )
          ],
        )
        
       
      ),
    );
  }
}