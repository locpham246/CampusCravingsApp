// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final String text;

  const LogoWidget({super.key, 
    required this.text,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned( // Logo image
            top: 0,
            child: SizedBox(
              width: 250,
              height: 150,
              child: Image.asset(
                'assets/logo.png',
                width: 213.18,
                height: 127.14,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned( // Title text
            top: 140,
            child: SizedBox(
              width: 250,
              height: 130,
              child: Text(
                'CAMPUS CRAVINGS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  fontFamily: 'Blockletter',
                  fontWeight: FontWeight.w400,
                  height: 0.8,
                  letterSpacing: 0.25,
                ),
              ),
            )
          ),
          Positioned( // Middle divider bar
            top: 225,
            child: Container(
              width: 250,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 4,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                ),
              ),
            ),
          ),
          Positioned( // Custom text
            top: 238,
            child: SizedBox(
              width: 312,
              height: 33,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}