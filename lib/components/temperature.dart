import 'package:flutter/material.dart';

class Temperature extends StatelessWidget {
const Temperature({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("20", style: TextStyle(
                fontSize: 90,
                color: Colors.white
              ),),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15), 
                child: Text("ºC", style: TextStyle(
                  fontSize: 25,
                  color: Colors.white
                ),)
              )
            ],
          ),
          const Text('Deszcz 21º/22º', 
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height:15),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(child: Icon(Icons.energy_savings_leaf_rounded, size: 15, color: Colors.white)),
                  TextSpan(text: " IJP 65", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))
                ]
              )
            )
          )
        ],
      ),
    );
  }
}