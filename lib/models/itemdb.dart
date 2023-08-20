import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import '../common_widgets/app_button.dart';
import '../constants/api_contants.dart';

class CreateScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController stidController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Add new data via API
  Future<void> addData(BuildContext context, String name, String stid, String location, String comment, String phone) async {
    print(Uri.parse('$apiEndpoint/create.php'));
    final response =await http.post(Uri.parse('$apiEndpoint/create.php'),
      body: {
        'name': name,
        'stid': stid,
        'location': location,
        'comment': comment,
        'phone': phone,
      },
    );

    print({
      'name': name,
      'stid': stid,
      'location': location,
      'comment': comment,
      'phone': phone,
    });

    if (response.statusCode == 200) {
      // Data added successfully
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16), // เพิ่ม padding ด้านซ้ายและขวา
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15),
                SvgPicture.asset("assets/icons/app_icon_color.svg"),
                SizedBox(height: 5),
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
                  decoration: InputDecoration(labelText: 'เบอร์โทรศัพท์'),
                ),
                SizedBox(height: 16),

                AppButton(
                  label: "Finish",
                  onPressed: () {
                    addData(
                      context,
                      nameController.text,
                      stidController.text,
                      locationController.text,
                      commentController.text,
                      phoneController.text,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
