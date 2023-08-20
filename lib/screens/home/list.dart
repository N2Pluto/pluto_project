import 'package:flutter/material.dart';
import 'package:grocery_app/constants/api_contants.dart';
import 'package:grocery_app/models/itemdb.dart';
import 'package:grocery_app/screens/home/updateCreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<dynamic> data = [];

  // Fetch data from API
  Future<void> fetchData() async {
    final response = await newMethod();
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    }
  }

  Future<http.Response> newMethod() => http.get(Uri.parse('$apiEndpoint/read.php'));

  // Delete data via API
  Future<void> deleteData(String id) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete request ?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                final response = await http.post(Uri.parse('$apiEndpoint/delete.php'), body: {
                  'id': id,
                });
                if (response.statusCode == 200) {
                  // Data deleted successfully
                  fetchData();
                }
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/icon.png'),
          ),
          title: Text(data[index]['name']),
          subtitle: Text('${data[index]['location']}\n${data[index]['phone']}'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Delete data
              deleteData(data[index]['id']);
            },
          ),
          onTap: () {
            // Navigate to update screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UpdateScreen(data: data[index]),
              ),
            ).then((value) {
              // Refresh the list after returning from update screen
              if (value == true) {
                fetchData();
              }
            });
          },
        );
      },
    ),
  );
}

}
