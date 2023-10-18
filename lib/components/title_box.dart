import 'package:flutter/material.dart';

class TitleBox extends StatelessWidget {
  final IconData icon;
  final String title;
  const TitleBox({ Key? key, required this.title, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(child: Icon(icon, size: 15, color: const Color.fromRGBO(255, 255, 255, 0.5),)),
          const WidgetSpan(child: SizedBox(width: 5,)),
          TextSpan(text: title, style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 15,))
        ]
      ),
    );
  }
}