// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () { 
        Navigator.pop(context);
      },
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: Color(0xFFB05A98),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Color(0xFFF8EAD7),
          size: 20,
        ),
      ),
    );
  }
}
