import 'package:flutter/material.dart';

class BookmarkPage extends StatefulWidget {
  final String title;

  BookmarkPage({Key? key, required this.title}) : super(key: key);

  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  // Define a list of data for each tile
  List<Map<String, String>> tileData = [
    {
      'image': 'assets/ramen.png',
      'recipeName': 'Home Made Ramen',
      'description': 'My attempt at fancy ramen with ramen packets',
    },
    {
      'image': 'assets/Stew.jpg',
      'recipeName': "Some Irish Stew",
      'description': 'An Irish style beef stew made with Guiness',
    },
    {
      'image': 'assets/PotPie.jpg',
      'recipeName': 'Home-made pot pie',
      'description': 'Irish Style Pot pie',
    },
    {
      'image': 'assets/Bagel.jpg',
      'recipeName': 'Breakfast Bagel',
      'description': 'Buoght some Breakfast at nearby coffee shop',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFF8EAD7),
        child: ListView.builder(
          itemCount: tileData.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 243, 228, 208),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 120.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(tileData[index]['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tileData[index]['recipeName']!,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            tileData[index]['description']!,
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}