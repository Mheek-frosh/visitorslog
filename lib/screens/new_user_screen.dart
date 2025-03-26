import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/user_bloc.dart';
import '../blocs/user_event.dart';
import '../blocs/user_state.dart';
import 'more_questions_screen.dart';

class NewUserScreen extends StatefulWidget {
  @override
  _NewUserScreenState createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? imagePath;

  void _showImagePreview(BuildContext context, String path) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Image Preview"),
          content: Image.file(File(path), fit: BoxFit.cover),
          actions: [
            TextButton(
              onPressed: () {
                context.read<UserBloc>().add(CaptureImageEvent());
              },
              child: const Text("Retake"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  imagePath = path;
                });
                Navigator.pop(context);
              },
              child: const Text("Use Photo"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        centerTitle: true,
        title: const Text(
          "New User Registration",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.person, size: 100, color: Colors.green),
            _buildTextField(fullNameController, "Full Name", Icons.person),
            _buildTextField(companyController, "Company Name", Icons.business),
            _buildTextField(addressController, "Company Address", Icons.location_on),
            _buildTextField(emailController, "Email Address", Icons.email),
            _buildTextField(phoneController, "Phone Number", Icons.phone, TextInputType.phone),
            const SizedBox(height: 16),
            _buildImageCaptureContainer(),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.read<UserBloc>().add(
                  SaveUserDetailsEvent(
                    fullName: fullNameController.text,
                    companyName: companyController.text,
                    companyAddress: addressController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    imagePath: imagePath ?? "",
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MoreQuestionsScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[400],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, [TextInputType? inputType]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        keyboardType: inputType ?? TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.green[400]),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildImageCaptureContainer() {
    return GestureDetector(
      onTap: () {
        context.read<UserBloc>().add(CaptureImageEvent());
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.green, width: 2),
        ),
        child: imagePath == null
            ? const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(CupertinoIcons.camera, size: 50, color: Colors.green),
              SizedBox(height: 10),
              Text(
                "Tap to Capture Image",
                style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
            : ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.file(File(imagePath!), fit: BoxFit.cover),
        ),
      ),
    );
  }
}