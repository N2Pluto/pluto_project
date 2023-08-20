import 'package:flutter/material.dart';
import 'home/list.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListScreen(),
      ),
    );
  }
}

class AppText extends StatelessWidget {
  final String text;

  const AppText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
