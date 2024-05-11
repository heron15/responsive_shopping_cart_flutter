import 'package:flutter/material.dart';
import 'package:responsive_shopping_cart/screens/widget/button_widget.dart';

Widget alertDialog(
    String title, String message, String buttonText, VoidCallback onTap) {
  return AlertDialog(
    surfaceTintColor: Colors.white,
    title: Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
    ),
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
      ),
    ),
    contentPadding: const EdgeInsets.all(30),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      buttonWidget(buttonText, onTap),
    ],
  );
}
