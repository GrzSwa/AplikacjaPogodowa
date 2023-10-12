// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Other extends StatelessWidget {
const Other({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(
      children: [

        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("PN-z", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16) ),
                            const SizedBox(height: 5,),
                            Text("8.5 km/h", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)
                          ],
                        ),
                        Icon(Icons.circle, size: 80, color: Colors.white,)
                      ],
                    ),  
                  ),
                ),
              ),  

              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: "06:55", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                                TextSpan(text: " Wschód", style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14)),
                              ]
                            )
                          ),
                          const SizedBox(height: 5,),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: "17:52", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                                TextSpan(text: " Zachód", style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14)),
                              ]
                            )
                          )
                          ],
                        ),
                        Icon(Icons.circle, size: 80, color: Colors.white,)
                      ],
                    ),  
                  ),
                ),
              ), 
            ],
          ) 
        ),

        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Wilgotność', style: TextStyle(color: Colors.white.withOpacity(0.6) )),
                      Text('90%', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
                    ],
                  ),
                  Divider(color: Colors.white.withOpacity(0.6),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Odczuwalnie', style: TextStyle(color: Colors.white.withOpacity(0.6) )),
                      Text('13', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
                    ],
                  ),
                  Divider(color: Colors.white.withOpacity(0.6),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('UV', style: TextStyle(color: Colors.white.withOpacity(0.6) )),
                      Text('0', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
                    ],
                  ),
                  Divider(color: Colors.white.withOpacity(0.6),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Ciśnienie', style: TextStyle(color: Colors.white.withOpacity(0.6) )),
                      Text('1015mbar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
                    ],
                  ),
                  Divider(color: Colors.white.withOpacity(0.6),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Szansa na deszcz', style: TextStyle(color: Colors.white.withOpacity(0.6) )),
                      Text('90%', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
                    ],
                  ),
                  Divider(color: Colors.white.withOpacity(0.6),),
                ],
              ),
            ),
          ) 
        )
        
      ],
    );
  }
}