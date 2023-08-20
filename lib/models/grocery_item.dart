import 'package:flutter/cupertino.dart';

class GroceryItem {
  final int? id;
  final String name;
  final String description;
  final String imagePath;
  final String details;

  GroceryItem({
    this.id,
    required this.name,
    required this.description,
    required this.details,
    required this.imagePath,
  });
}

var demoItems = [
  GroceryItem(
      id: 1,
      name: "purple line",
      description: "8.30 - 17.00",
      details: "- วิชาการ 5 \n- นวัตกรรม \n- ศูนย์เครื่องมือ 8 \n- สถาปัต",
      imagePath: "assets/images/grocery_images/banana.png"),
  GroceryItem(
      id: 2,
      name: "Red line",
      description: "8.30 - 20.45",
      details: "- สถาปัต \n- เรียนรวม 1-7 \n- ไทยบุรี \n- โรงอาหาร4 \n- ศูนย์บรรณ \n- สถาปัต",
      imagePath: "assets/images/grocery_images/apple.png"),
  GroceryItem(
      id: 3,
      name: "Blue Line",
      description: "8.30 - 20.45",
      details: "- ไทยบุรี \n- หอ 1-3 \n- ลานไทร \n- หอ 4-5 \n- หอ 16-18",
      imagePath: "assets/images/grocery_images/pepper.png"),
  GroceryItem(
      id: 4,
      name: "Green Line",
      description: "8.30 - 20.30",
      details: "- ลานไทร \n- หอ 1-3 \n- ไทยบุรี \n- โรงอาหาร 4 \n- ศูนย์ดิจิทัล \n- อาคารบริหาร \n- โรงพยาบาลศูนย์การแพทย์ \n- คุ้มสวสดิ์ \n- ซอยทุ่งแสงตะวัน \n- ถนนสาย 401",
      imagePath: "assets/images/grocery_images/ginger.png"),
  GroceryItem(
      id: 5,
      name: "Yellow Line",
      description: "17.00 - 20.30",
      details: "- ไทยบุรี \n- หอ 1-3 \n- ลานไทร \n- หอ 4-5 \n- หอ 16-18 \n- สนามกีฬา",
      imagePath: "assets/images/grocery_images/beef.png"),
];

var exclusiveOffers = [demoItems[0], demoItems[1]];

var bestSelling = [demoItems[2], demoItems[3]];

var groceries = [demoItems[4]];

