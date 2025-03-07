import 'package:flutter/material.dart';
import 'choice_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Centered Image Asset
            Image.asset(
              'assets/images/moflogo.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),

            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCustomButton(context, "Check In", () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChoiceScreen()));
                }),
                SizedBox(width: 20),
                _buildCustomButton(context, "Check Out", () {
                  // Checkout Logic
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Custom Button Widget
  Widget _buildCustomButton(BuildContext context, String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black, // White background
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Rounded corners
        side: BorderSide(color: Colors.white), // White border
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // White text
      ),
    );
  }
}
