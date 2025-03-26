import 'package:flutter/material.dart';

class FloorSelectionDropdown extends StatefulWidget {
  @override
  _FloorSelectionDropdownState createState() => _FloorSelectionDropdownState();
}

class _FloorSelectionDropdownState extends State<FloorSelectionDropdown> {
  final List<String> _floorOptions = [
    "First Floor", "Second Floor", "Third Floor", "Fourth Floor",
    "Fifth Floor", "Sixth Floor", "Seventh Floor", "Eighth Floor",
    "Ninth Floor", "Tenth Floor"
  ];

  List<String> _selectedFloors = [];

  void _toggleFloorSelection(String floor) {
    setState(() {
      if (_selectedFloors.contains(floor)) {
        _selectedFloors.remove(floor);
      } else {
        _selectedFloors.add(floor);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Select Floors",
        prefixIcon: Icon(Icons.house, color: Colors.green[400]),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
      value: null, // Dropdown won't show a default value
      items: [
        DropdownMenuItem(
          value: "Select Floors",
          child: _buildFloorSelectionMenu(),
        ),
      ],
      onChanged: (_) {}, // No need for onChanged, selection happens inside _buildFloorSelectionMenu()
    );
  }

  Widget _buildFloorSelectionMenu() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              activeColor: Colors.green[400],
              checkColor: Colors.white,
              onChanged: (bool? selected) {
                setState(() {
                  _toggleFloorSelection(floor);
                });
              },
            );
          }).toList(),
        );
      },
    );
  }
}
