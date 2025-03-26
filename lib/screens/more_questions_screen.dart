import 'package:flutter/material.dart';
import 'package:visitorslog/screens/successful_screen.dart';

class MoreQuestionsScreen extends StatefulWidget {
  const MoreQuestionsScreen({super.key});

  @override
  State<MoreQuestionsScreen> createState() => _MoreQuestionsScreenState();
}

class _MoreQuestionsScreenState extends State<MoreQuestionsScreen> {
  String? selectedPurpose;
  final List<String> _selectedFloors = [];

  final List<String> _floorOptions = [
    "1F",
    "2F",
    "3F",
    "4F",
    "5F",
    "6F",
    "7F",
    "8F",
    "9F",
    "10F",
  ];

  void _toggleFloorSelection(String floor) {
    setState(() {
      if (_selectedFloors.contains(floor)) {
        _selectedFloors.remove(floor);
      } else {
        _selectedFloors.add(floor);
      }
    });
  }

  void _removeFloor(String floor) {
    setState(() {
      _selectedFloors.remove(floor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Visitors Questionnaire",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Header Image
            Image.asset(
              'assets/images/ministry-removebg-preview.png',
              width: 180,
              height: 180,
            ),

            const SizedBox(height: 20),

            // Instructional Text
            const Text(
              "Please fill in the following details to proceed.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
            ),

            const SizedBox(height: 20),

            // Text Fields with Icons
            _buildTextField("Who are you seeing?", Icons.person),
            const SizedBox(height: 16),
            _buildTextField("Which Department/Office?", Icons.business),
            const SizedBox(height: 16),

            // Multi-select Dropdown for Number of Floors
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Number of Floors",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 8),
            _buildMultiSelectDropdown(),

            const SizedBox(height: 16),

            // Number of Visitors
            _buildTextField("Number of Visitors", Icons.group),
            const SizedBox(height: 16),

            // Dropdown for Purpose of Visit
            DropdownButtonFormField<String>(
              decoration: _buildInputDecoration("Purpose of the visit", Icons.event_note),
              value: selectedPurpose,
              items: const [
                DropdownMenuItem(value: "Official", child: Text("Official")),
                DropdownMenuItem(value: "Unofficial", child: Text("Unofficial")),
              ],
              onChanged: (value) {
                setState(() {
                  selectedPurpose = value;
                });
              },
            ),
            const SizedBox(height: 30),

            // Confirm Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SuccessfulScreen()),
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
                  "Confirm",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Multi-select dropdown for Floors
  Widget _buildMultiSelectDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            _showFloorSelectionDialog();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black38),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedFloors.isEmpty ? "Select Floors" : _selectedFloors.join(", "),
                  style: TextStyle(fontSize: 14, color: _selectedFloors.isEmpty ? Colors.black54 : Colors.black87),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.black54),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),

        // Display Selected Floors as Chips
        Wrap(
          spacing: 8.0,
          children: _selectedFloors.map((floor) {
            return Chip(
              label: Text(floor, style: const TextStyle(color: Colors.white)),
              backgroundColor: Colors.green[400],
              deleteIcon: const Icon(Icons.close, color: Colors.white),
              onDeleted: () => _removeFloor(floor),
            );
          }).toList(),
        ),
      ],
    );
  }

  // Show Multi-Select Dialog for Floors
  void _showFloorSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder( // ✅ Enables immediate state updates inside the dialog
          builder: (context, setState) {
            return AlertDialog(
              title: const Text("Select Floors"),
              content: SingleChildScrollView(
                child: Column(
                  children: _floorOptions.map((floor) {
                    return CheckboxListTile(
                      title: Text(
                        floor,
                        style: TextStyle(
                          color: _selectedFloors.contains(floor) ? Colors.green[700] : Colors.black87,
                          fontWeight: _selectedFloors.contains(floor) ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      value: _selectedFloors.contains(floor),
                      activeColor: Colors.green[400], // ✅ Turns green when tapped
                      checkColor: Colors.white,
                      onChanged: (bool? selected) {
                        setState(() {
                          _toggleFloorSelection(floor); // ✅ Updates immediately on tap
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Ok"),
                ),
              ],
            );
          },
        );
      },
    );
  }



  // Custom TextField with Icon
  Widget _buildTextField(String labelText, IconData icon) {
    return TextField(
      decoration: _buildInputDecoration(labelText, icon),
    );
  }

  // Input Field Decoration with Leading Icon
  InputDecoration _buildInputDecoration(String labelText, IconData icon) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(fontSize: 14, color: Colors.black87),
      prefixIcon: Icon(icon, color: Colors.green[400]), // Leading Icon
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.green.shade400),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.black38),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.green.shade400, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    );
  }
}
