import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visitorslog/screens/exisiting_user_screen.dart';
import 'package:visitorslog/screens/new_user_screen.dart';


class ChoiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Choose an Option",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),

          Center(
            child: Icon(
              Icons.person,
              size: 100,
              color: Colors.green[400],
            ),
          ),

          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Please select one of the options below to proceed.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCustomButton(context, "New User", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NewUserScreen()));
              }),
              _buildCustomButton(context, "Existing User", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ExistingUserScreen()));
              }),
            ],
          ),

          const Spacer(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildCustomButton(BuildContext context, String text, VoidCallback onPressed) {
    return SizedBox(
      width: 140,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[400],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 5,
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
