import 'package:flutter/material.dart';

Widget buttonWidget(String text, VoidCallback onTap){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(25)
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
    ),
  );
}