import 'package:flutter/material.dart';

/*
  This file is generated from Figma so it's a mess.
  Needs to be cleared out and reimplemented with lists of the custom tag wideget.
*/

class FilterLayover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 600,
        height: 950,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Color(0xFF3C3C3C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          children: [
            // Filters text
            Positioned(
              left: 125,
              top: 100,
              child: SizedBox(
                width: 177,
                height: 51,
                child: Text(
                  'Filters',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFF8EAD7),
                    fontSize: 24,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            
            // Search box
            Positioned(
              left: 62.5,
              top: 175,
              child: Container(
                width: 300,
                height: 36,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 36,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: Color(0xEDFAFAFA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Magnifier icon
                          Icon(
                            Icons.search,
                            color: Color(0x993C3C43),
                            size: 24,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                'Search',
                                style: TextStyle(
                                  color: Color(0x993C3C43),
                                  fontSize: 17,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  letterSpacing: -0.41,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            //Box option
                        
                      Positioned(
                        left: 65,
                top: 295,
                        child: Container(
                          width: 94,
                          height: 27,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 94,
                                  height: 27,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF2B86B9),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 4.24, color: Color(0x00E2C973)),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 9,
                                top: 5,
                                child: SizedBox(
                                  width: 76,
                                  height: 18,
                                  child: Text(
                                    'Food Truck',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFF8EAD7),
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 180,
                        top: 155,
                        child: Container(
                          width: 117,
                          height: 27,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 28.48,
                                top: 0,
                                child: Container(
                                  width: 59.80,
                                  height: 27,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFB92B2B),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 4.24, color: Color(0x00E2C973)),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 5,
                                child: SizedBox(
                                  width: 117,
                                  height: 21.13,
                                  child: Text(
                                    'Meat',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFF8EAD7),
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                   Positioned( //Pick tags
                left: 35,
                top: 250,
                child: Container(
                  width: 304,
                  height: 218,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 30,
                        top: 0,
                        child: Container(
                          width: 94,
                          height: 27,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 94,
                                  height: 27,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF2B86B9),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 4.24, color: Color(0x00E2C973)),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 9,
                                top: 5,
                                child: SizedBox(
                                  width: 76,
                                  height: 18,
                                  child: Text(
                                    'Homemade',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFF8EAD7),
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 24,
                        top: 95,
                        child: Container(
                          width: 76,
                          height: 27,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 7,
                                top: 0,
                                child: Container(
                                  width: 61,
                                  height: 27,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF2B86B9),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 4.24, color: Color(0x00E2C973)),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 5,
                                child: SizedBox(
                                  width: 76,
                                  height: 18,
                                  child: Text(
                                    'Salad',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFF8EAD7),
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 139,
                        child: Container(
                          width: 123.26,
                          height: 27,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 30,
                                top: 0,
                                child: Container(
                                  width: 63,
                                  height: 27,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFB92B2B),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 4.24, color: Color(0x00E2C973)),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 5,
                                child: SizedBox(
                                  width: 123.26,
                                  height: 21.13,
                                  child: Text(
                                    'Vegan',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFF8EAD7),
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 91,
                        top: 139,
                        child: Container(
                          width: 107,
                          height: 27,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 26.69,
                                top: 0,
                                child: Container(
                                  width: 56.05,
                                  height: 27,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFB92B2B),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 4.24, color: Color(0x00E2C973)),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 5,
                                child: SizedBox(
                                  width: 107,
                                  height: 21,
                                  child: Text(
                                    'Halal',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFF8EAD7),
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 157,
                        top: 139,
                        child: Container(
                          width: 147,
                          height: 27,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 36.67,
                                top: 0,
                                child: Container(
                                  width: 77,
                                  height: 27,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFB92B2B),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 4.24, color: Color(0x00E2C973)),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 5,
                                child: SizedBox(
                                  width: 147,
                                  height: 21,
                                  child: Text(
                                    'Kosher',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFF8EAD7),
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 65,
                        top: 52,
                        child: Container(
                          width: 143.26,
                          height: 27,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 35.20,
                                top: 0,
                                child: Container(
                                  width: 74.44,
                                  height: 27,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF7F3779),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 4.24, color: Color(0x00E2C973)),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 5,
                                child: SizedBox(
                                  width: 143.26,
                                  height: 21.13,
                                  child: Text(
                                    'American',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFF8EAD7),
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
          ],
        ),
      ),
                         )
          ]
        )
      )
             );
          
        
      
    
  }
}
