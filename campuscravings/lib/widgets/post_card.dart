// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, sized_box_for_whitespace

import 'dart:io';

import 'package:campuscravings/widgets/tag.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' as math;

class PostData {
  String username = "";
  String pfp = "";
  String image = "";
  String description = "";
  String time = "";
  String lat = "30.4133";
  String lng = "-91.1800";
  String tags = "";

  PostData({
    required this.username,
    required this.pfp,
    required this.image,
    required this.description,
    required this.time,
    required this.lat,
    required this.lng,
    required this.tags,
  });

  PostData.fromJson(Map<String, dynamic> json) {
    username = json['username'] as String;
    pfp = json['pfp'] as String;
    image = json['image'] as String;
    description = json['description'] as String;
    time = json['time'] as String;
    lat = json['lat'] as String;
    lng = json['lng'] as String;
    tags = json['tags'] as String;
  }

  Map<String, dynamic> toJson() => {
    'username': username,
    'pfp': pfp,
    'image': image,
    'description': description,
    'time': time,
    'lat': lat,
    'lng': lng,
    'tags': tags,
  };

  List<String> getTagNames() {
    return tags.split(", ");
  }
  List<CustomTag> getTagWidgets() {
    List<CustomTag> widgets = [];
    for (var tagName in getTagNames()) {
      widgets.add(
        CustomTag(
          text: tagName,
          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)
        ),
      );
    }
    return widgets;
  }
}

class PostCard extends StatelessWidget {
  final PostData data;

  PostCard({super.key,
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 570 + 25 * ('\n'.allMatches(data.description).length).toDouble(),
      width: 370,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned( // Avatar
            top: 0,
            left: 0,
            child: CircleAvatar(
              radius: 25, 
              backgroundImage: AssetImage(
                data.pfp,
              ),
            )
          ),
          Positioned( // Username
            top: 20,
            left: 60,
            child: SizedBox(
              width: 370,
              height: 50,
              child: Text(
                data.username,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned( // 'More' menu icon
            top: 0,
            right: 0,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(0, 0, 0, 0),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.more_horiz,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 50,
              ),
            ),
          ),
          Positioned( // Image
            top: 60,
            child: SizedBox(
              width: 370,
              height: 370,
              child:  ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.file(
                  File(data.image),
                  width: 370,
                  height: 370,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned( // 'Bookmark' menu icon
            top: 435,
            right: 0,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(0, 0, 0, 0),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.bookmark_outline_rounded,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 60,
              ),
            ),
          ),
          Positioned( // Tags
            top: 450,
            left: 0,
            child: Container(
              width: 310,
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: data.getTagWidgets().map((tag) {
                  return Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: tag,
                  );
                }).toList(),
              ),
            )
          ),
          Positioned( // Tags gradient
            top: 445,
            left: 265,
            child: Container(
              width: 45,
              height: 35,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(248, 234, 215, 0),
                    Color(0xFFF8EAD7),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              )
            ),
          ),
          Positioned( // Description
            top: 500,
            left: 0,
            child: SizedBox(
              width: 370,
              height: 50 + 25 * ('\n'.allMatches(data.description).length).toDouble(),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 24, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: data.username + " ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: data.description,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: "\n" + data.time,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 70, 70, 70),
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}