import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/user_bloc.dart';
import '../blocs/user_event.dart';
import '../blocs/user_state.dart';

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
          title: Text("Image Preview"),
          content: Image.file(File(path), fit: BoxFit.cover),
          actions: [
            TextButton(
              onPressed: () {
                context.read<UserBloc>().add(CaptureImageEvent()); // Retake image
              },
              child: Text("Retake"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  imagePath = path; // Save captured image
                });
                Navigator.pop(context);
              },
              child: Text("Use Photo"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New User Registration")),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is ImageCapturedState) {
            _showImagePreview(context, state.imagePath); // Show preview before saving
          }
        },
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTextField(fullNameController, "Full Name", Icons.person),
                _buildTextField(companyController, "Company Name", Icons.business),
                _buildTextField(addressController, "Company Address", Icons.location_on),
                _buildTextField(emailController, "Email Address", Icons.email),
                _buildTextField(phoneController, "Phone Number", Icons.phone, TextInputType.phone),
                SizedBox(height: 20),

                // Rectangular Camera Capture Container
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<UserBloc>().add(CaptureImageEvent());
                      },
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.blue, width: 2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: imagePath == null
                              ? Center(
                            child: Icon(Icons.camera_alt, size: 50, color: Colors.grey),
                          )
                              : Image.file(File(imagePath!), fit: BoxFit.cover),
                        ),
                      ),
                    ),

                    // Retake Button
                    if (imagePath != null)
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Row(
                          children: [
                            Icon(Icons.refresh, color: Colors.blue),
                            SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                context.read<UserBloc>().add(CaptureImageEvent());
                              },
                              child: Text("Retake", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),

                SizedBox(height: 20),

                // Continue Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
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
                    },
                    child: Text("Continue", style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, [TextInputType? inputType]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 55,
        child: TextField(
          controller: controller,
          keyboardType: inputType ?? TextInputType.text,
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
