import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login_screen';
  const LoginScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        centerTitle: true,
        title: Text("MumFua"),
        actions: [IconButton(icon:Icon(Icons.notification_add) , onPressed: () {})],
          

      ),

    );

  }
}
