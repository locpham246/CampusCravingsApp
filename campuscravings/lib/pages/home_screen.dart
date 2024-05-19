// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:convert';
import 'dart:io';

import 'package:campuscravings/pages/bookmarks_page.dart';
import 'package:campuscravings/pages/map.dart';
import 'package:campuscravings/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:campuscravings/pages/create_post.dart';
import 'package:campuscravings/pages/filter_layout.dart';
import 'package:campuscravings/pages/user_profile.dart';

import 'dart:async';

import 'package:path_provider/path_provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostData> posts = [];

  @override
  void initState() {
    super.initState();
    _createFolder();

    _getPosts();
  }
  
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  _createFolder() async {
    final path = await _localPath;
    Directory('$path/posts').create();
  }

  Future<String> _readPost(String fileName) async {
    String text = "";
    try {
      final path = await _localPath;
      final File file = File('$path/posts/$fileName');
      text = await file.readAsString();
    } catch (e) {
      print("Couldn't read file");
    }
    return text;
  }

  void _getPosts() async {
    final path = await _localPath;
    final List<FileSystemEntity> entities = await Directory('$path/posts/').list().toList();
    final Iterable<File> files = entities.whereType<File>();

    posts = [];
    for (var file in files) {
      //await file.delete();
      String fileName = file.path.split('/').last;
      String encodedJson = await _readPost(fileName);
      PostData postData = PostData.fromJson(jsonDecode(encodedJson));
      posts.add(postData);
    }
    posts = List.from(posts.reversed);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0DBBE), 
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.local_fire_department,
            color: Color.fromARGB(255, 0, 0, 0),
            size: 30,
          ),
          onPressed: () async {
            
          },
        ),
        actions: [
          IconButton( // Profile tab
            icon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfile()),
              );
            },  
          ),
          IconButton( // Filters tab
            icon: Icon(
              Icons.filter_alt,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FilterLayover()),
              );
            },  
          ),
        ]
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFFF8EAD7),
        child: ListView.builder(
          itemCount: posts.length,
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) {
            return PostCard(
              data: posts[index]
            );
          }
        )
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFF0DABE),
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 56,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BookmarkPage(title: "Bookmarks")),
                          );
                        },
                        icon: Icon(Icons.bookmark, color: Colors.black),
                      ),
                    ),
                    Container(
                      width: 56,
                      height: 56,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapScreen()),
                          );
                        },
                        icon: Icon(Icons.location_on, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePost()),
          ).then((value) {
            setState(() {
              _getPosts();
            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}