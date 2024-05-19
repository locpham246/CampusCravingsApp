// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTag extends StatelessWidget {
  final String text;
  final Color color;

  const CustomTag({super.key,
    required this.text,
    required this.color,
  });
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () { 
        
      },
      child: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        constraints: const BoxConstraints(
          maxWidth: 100,
        ),
        child: Text(
          text,
          style: TextStyle(color: Color(0xFFF8EAD7)),
        ),
      )
    );
  }
}


