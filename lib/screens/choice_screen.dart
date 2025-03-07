import 'package:flutter/material.dart';
import 'new_user_screen.dart';

class ChoiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Choose an Option")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 100),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NewUserScreen()));
                  },
                  child: Text("New User"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // Existing User Logic
                  },
                  child: Text("Existing User"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
