import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  // Nilai yang diperlukan
  final String text;
  final IconData icon;
  final void Function()? onPressed;

  InfoCard({
    required this.text,
    required this.icon,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Gunakan onPressed
      child: Card(
        color: Colors.black,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.white,
          ),
          title: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
