import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  ChatBubble({super.key, required this.message, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.deepPurple : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),

      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Text(message,style: TextStyle(color: Colors.white),),
    );
  }
}