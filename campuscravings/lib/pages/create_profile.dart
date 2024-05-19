// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:campuscravings/widgets/back_button.dart';
import 'package:campuscravings/pages/home_screen.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity, 
        height: double.infinity, 
        color: Color(0xFFF8EAD7), 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 700,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(color: Color(0xFFF8EAD7)),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned( // Back Button
                      top: 25,
                      left: 25,
                      child: CustomBackButton()
                    ),
                    Positioned( // Profile picture container
                      top: 200,
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 91, 91, 91),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned( // Add image icon button
                      top: 450,
                      right: 100,
                      child: Container(
                        width: 50,
                        height: 50,
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
                    Positioned( // Display Name field
                      top: 560,
                      child: SizedBox(
                        width: 300,
                        height: 50,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter a display name',
                          ),
                        ),
                      ),
                    ),
                    Positioned( // Create Profile button
                      top: 650,
                      child: InkWell(
                        child: Container(
                          width: 300,
                          height: 50,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 300,
                                  height: 50,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFD57272),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 3, color: Color(0x00E2C973)),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Create Profile',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF0E0606),
                                        fontSize: 25,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    )
                                  )
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () { 
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        },
                      ),
                    ),
                  ]
                )
              )
            ]
          )
        )
      )
    );
  }
}
