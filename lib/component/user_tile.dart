import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  UserTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          
          
            color: Colors.white, 
            borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(left: 15,right: 15,top: 20),
        padding: EdgeInsets.all(20),
        child: Row(
          
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Icon(Icons.person), 
          SizedBox(width: 20,),
          Text(text)],
          
        ),
        
      ),
      
    );
  }
}
