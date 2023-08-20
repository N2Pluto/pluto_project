import 'package:flutter/material.dart' show AppBar, BuildContext, Column, EdgeInsets, ElevatedButton, InputDecoration, Navigator, Padding, Scaffold, SizedBox, State, StatefulWidget, Text, TextEditingController, TextField, Widget;
import 'package:http/http.dart' as http;

import '../../constants/api_contants.dart';

class UpdateScreen extends StatefulWidget {
  final Map<String, dynamic> data;

  UpdateScreen({required this.data});

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late TextEditingController nameController;
  late TextEditingController stidController;
  late TextEditingController locationController;
  late TextEditingController commentController;
  late TextEditingController phoneController;


  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.data['name']);
    stidController = TextEditingController(text: widget.data['stid']);
    locationController = TextEditingController(text: widget.data['location']);
    commentController = TextEditingController(text: widget.data['comment']);
    phoneController = TextEditingController(text: widget.data['phone']);
  }

  // Update data via API
  Future<void> updateData(String id, String newName, String newStid, String newLocation, String newComment , String newPhone) async {
    final response = await http.post(Uri.parse('$apiEndpoint/update.php'), body: {
      'id': id,
      'name': newName,
      'stid': newStid,
      'location': newLocation,
      'comment': newComment,
      'phone': newPhone,
    });
    if (response.statusCode == 200) {
      // Data updated successfully
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update File'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'ชื่อ'),
            ),
            TextField(
              controller: stidController,
              decoration: InputDecoration(labelText: 'รหัสนักศึกษา'),
            ),
            TextField(
              controller: locationController,
              decoration: InputDecoration(labelText: 'สถานที่รับ'),
            ),
            TextField(
              controller: commentController,
              decoration: InputDecoration(labelText: 'หมายเหตุ'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Update data
                updateData(widget.data['id'], nameController.text, stidController.text, locationController.text, commentController.text, phoneController.text);
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
