import 'package:flutter/material.dart';
import 'package:task_1/Page/Chat_Page.dart';
import 'package:task_1/Services/Chat/chat_services.dart';
import 'package:task_1/Services/auth/auth_service.dart';
// import 'package:task_1/auth/auth_service.dart';
import 'package:task_1/component/drawer.dart';
import 'package:task_1/component/user_tile.dart';

class MyHomePage extends StatelessWidget {
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        centerTitle: true,
        title: Text('HomePage'),
        actions: [],
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  //build a list of users except for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUserStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading..");
          }

          return ListView(
              children: snapshot.data!
                  .map<Widget>(
                      (userData) => _buildUserListItem(userData, context))
                  .toList());
        });
  }

  //build individual list tile for user
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyChats(
                  receiverEmail: userData["email"],
                  recieverID: userData["uid"],
                ),
              ));
        },
      );
    } else {
      return Container();
    }
  }
}
