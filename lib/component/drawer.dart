import 'package:flutter/material.dart';
import 'package:task_1/Services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  void logout() {
    final _auth = AuthService();
    _auth.SignOut();
  }

  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const DrawerHeader(
                  child: Icon(
                Icons.message_rounded,
                color: Colors.deepPurple,
                size: 120,
              )),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                title: const Text(
                  'Home',
                  style: TextStyle(fontSize: 16),
                ),
                leading: const Icon(
                  Icons.home,
                  color: Colors.deepPurple,
                  size: 30,
                ),
              ),
              ListTile(
                onTap: logout,
                title: const Text(
                  'Logout',
                  style: TextStyle(fontSize: 16),
                ),
                leading: const Icon(
                  Icons.logout_outlined,
                  color: Colors.deepPurple,
                  size: 30,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
