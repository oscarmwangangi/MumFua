import 'package:flutter/material.dart';

class WorkerprofileScreen extends StatefulWidget {

  static const String id = "worker_profile_screen";
  const WorkerprofileScreen({super.key});

  @override
  State<WorkerprofileScreen> createState() => _WorkerprofileState();
}

class _WorkerprofileState extends State<WorkerprofileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       child: Text( "hello"),
      ),
    );
  }
}
