// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:campuscravings/widgets/profile_photos.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFFF8EAD7),
        child: Stack(
          children: [
            Positioned(
              left: 200,
              top: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    child: Text(
                      '“There is no sincerer love than the love of food.”',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 40,
              top: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 400,
                    child: Text(
                      'Seth',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
             Positioned(
              top: 80,
              right: 70,
              child: Icon(
                Icons.emoji_events,
                size: 50,
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 130,
              left: 16,
              child: CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage(
                  "assets/cat.png",
                ),
              ),
            ),
            Positioned( // Add image icon button
                      top: 250,
                      right: 280,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 0, 0),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add_rounded,
                          color: Color(0xFFF8EAD7),
                          size: 40,
                        ),
                      ),
                    ),
          
           
            Positioned(
              top: 80,
              right: 25,
              child: Icon(
                Icons.bookmark,
                size: 50,
                color: Colors.black,
              ),
            ),
          
            Positioned(
              top: 300,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 800,
                child: Profilephotos(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
