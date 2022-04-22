import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key, required this.title, required this.onPressed,

  }) : super(key: key);
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        enableFeedback: true,
        backgroundColor: Colors.blueAccent,
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: const BorderSide(color: Colors.blueAccent)
        ),
      ),
    onPressed: onPressed, child: Text(title, style: const TextStyle(color: Colors.white),),);
  }
}
