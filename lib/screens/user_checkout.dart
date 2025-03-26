import 'package:flutter/material.dart';
import 'package:visitorslog/screens/welcome_screen.dart';

class UserCheckout extends StatefulWidget {
  const UserCheckout({super.key});

  @override
  State<UserCheckout> createState() => _UserCheckoutState();
}

class _UserCheckoutState extends State<UserCheckout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button
        backgroundColor: Colors.green[400],
        centerTitle: true,
        title: const Text(
          "Checkout",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),

            // ✅ Success Icon
            const Icon(
              Icons.check_circle,
              size: 120,
              color: Colors.green,
            ),

            const SizedBox(height: 20),

            // ✅ Success Message
            const Text(
              "You Have Successfully Checkout.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
            ),

            const SizedBox(height: 30),

            // ✅ Return Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  WelcomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[400],
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  "Return",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
