import 'package:flutter/material.dart';
import '../../core/constants.dart';
import 'App/home.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: const Icon(Icons.menu),
        centerTitle: true,
        title: const Text("MumFua"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notification_add_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text.rich(
              TextSpan(
                style: kHeaderTextStyle,
                children: [
                  TextSpan(text: "Book a trusted \n"),
                  TextSpan(
                    text: "MumFua \n",
                    style: kHeaderHighlightStyle,
                  ),
                  TextSpan(text: "in minutes\n"),
                  TextSpan(
                    text: "Fast. Reliable. Affordable",
                    style: kSubTitleTextStyle,
                  ),
                ],
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              "image/homeImage.jpg",
              height: 350,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                PrimaryButton(
                  text: "Book Now",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomerHomeScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                SecondaryButton(
                  text: "How it works",
                  icon: Icons.play_arrow_outlined,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
