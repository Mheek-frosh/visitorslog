import 'package:flutter/material.dart';
import 'check_out_screen.dart';
import 'choice_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back arrow
        backgroundColor: Colors.green[400], // Lighter green color
        centerTitle: true, // Center the title
        title: const Text(
          "Visitors Management",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),

          // ✅ Ministry Logo
          Center(
            child: Image.asset(
              'assets/images/ministry-removebg-preview.png',
              width: 250,
              height: 250,
            ),
          ),
          const SizedBox(height: 20),

          // ✅ Caption text
          const Center(
            child: Text(
              "Welcome to the Federal Ministry of Finance.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),

          // ✅ Note text
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Note: For all new and existing users, please fill the form appropriately.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
          ),
          const SizedBox(height: 30),

          // ✅ Buttons Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCustomButton(context, "Check In", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChoiceScreen()));
              }),
              _buildCustomButton(context, "Check Out", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOutScreen()));
              }),
            ],
          ),
        ],
      ),
    );
  }

  // ✅ Custom Button Widget
  Widget _buildCustomButton(BuildContext context, String text, VoidCallback onPressed) {
    return SizedBox(
      width: 140, // Increased button width
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[400], // Lighter green color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ), // Rounded corners
          elevation: 5, // Slight elevation for a better look
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
