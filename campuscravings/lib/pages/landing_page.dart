// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:campuscravings/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:campuscravings/widgets/logo_widget.dart';
import 'package:campuscravings/pages/account_signup.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

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
                    Positioned( // Logo widget
                      top: 100,
                      child: LogoWidget(
                        text: "Discover. Savor. Share."
                      )
                    ),
                    Positioned( // Sign In button
                      top: 400,
                      child: InkWell(
                        child: Container(
                          width: 300,
                          height: 49,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 300,
                                  height: 49,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF89C892),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 3, color: Color(0x00E2C973)),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 106,
                                top: 7.46,
                                child: Text(
                                  'Sign In',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF0E0606),
                                    fontSize: 25,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                      ),
                    ),
                    Positioned( // Sign Up button
                      top: 475,
                      child: InkWell(
                        child: Container(
                          width: 300,
                          height: 49,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 300,
                                  height: 49,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFD57272),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 3, color: Color(0x00E2C973)),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 106,
                                top: 7.46,
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF0E0606),
                                    fontSize: 25,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () { 
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AccountSignup()),
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
