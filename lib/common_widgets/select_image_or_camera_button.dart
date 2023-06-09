import 'package:flutter/material.dart';

class SelectImageOrCameraButton extends StatelessWidget {
  const SelectImageOrCameraButton(
      {super.key,
      required this.title,
      required this.textColor,
      required this.iconColor,
      required this.onPressed,
      required this.icon});
  final String title;
  final IconData icon;
  final Color textColor;
  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.grey,
            backgroundColor: Colors.white,
            shadowColor: Colors.grey[400],
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
          ),
          onPressed: onPressed,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: iconColor,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 13,
                      color: textColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ));
  }
}
