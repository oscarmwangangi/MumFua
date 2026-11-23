import 'package:flutter/material.dart';
import 'package:mam_fua/authentication/login.dart';
import 'package:mam_fua/pages/customer/App/home.dart';
import 'package:mam_fua/pages/customer/App/workerProfile.dart';
import 'package:mam_fua/pages/customer/main.dart';

void main() {
  runApp(const MumFua());
}

class MumFua extends StatelessWidget {
  const MumFua({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.id,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        CustomerHomeScreen.id: (context) => const CustomerHomeScreen(),
        WorkerprofileScreen.id: (context) => const WorkerprofileScreen(),
      },
    );
  }
}
