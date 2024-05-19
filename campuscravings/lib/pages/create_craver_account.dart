// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:campuscravings/pages/create_profile.dart';
import 'package:flutter/material.dart';
import 'package:campuscravings/widgets/logo_widget.dart';
import 'package:campuscravings/widgets/back_button.dart';

class CreateCraverAccount extends StatelessWidget {
  const CreateCraverAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Positioned( // Logo widget
                    top: 100,
                    child: LogoWidget(
                      text: "Create craver account:"
                    )
                  ),
                  Positioned( // username field
                    top: 375,
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter a username',
                        ),
                      ),
                    ),
                  ),
                  Positioned( // School email field
                    top: 435,
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your school email',
                        ),
                      ),
                    ),
                  ),
                  Positioned( // Password field
                    top: 495,
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your password',
                        ),
                      ),
                    ),
                  ),
                  Positioned( // Confirm password field
                    top: 555,
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Confirm your password',
                        ),
                      ),
                    ),
                  ),
                  Positioned( // Create Account button
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
                                    color: Color(0xFF89C892),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 3, color: Color(0x00E2C973)),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Create Account',
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
                            MaterialPageRoute(builder: (context) => CreateProfile()),
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
