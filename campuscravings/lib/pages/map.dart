// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:campuscravings/widgets/logo_widget.dart';
import 'package:campuscravings/widgets/post_card.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(30.4133, -91.1800);

  List<PostData> posts = [];
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getPosts();
    //print(posts);
  }

  _getMarkers() {
    _markers = {};
    for (var post in posts) {
      print("there is a post in posts!");
      _markers.add(Marker(
        markerId: MarkerId('${post.lat},${post.lng}'),
        position: LatLng(double.parse(post.lat), double.parse(post.lng)),
        // icon: BitmapDescriptor.,
        
        onTap: () async {
          await showDialog<void>(
            context: context,
            builder: (context) => AlertDialog(
              content: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Container(
                    child: PostCard(
                      data: post
                    )
                  )
                ]
              )
            )
          );
        }
      ));
    }
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
      print("there is a file!");
      String fileName = file.path.split('/').last;
      String encodedJson = await _readPost(fileName);
      PostData postData = PostData.fromJson(jsonDecode(encodedJson));
      posts.add(postData);
    }
    posts = List.from(posts.reversed);
    setState(() {});
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _getMarkers();
    setState(() {});
    //print(_marker);
    /*final marker = Marker(
      markerId: MarkerId('Judes'),
      position: LatLng(30.402260, -91.179909),
      // icon: BitmapDescriptor.,
      
      onTap: () async {
        await showDialog<void>(
          context: context,
          builder: (context) => AlertDialog(
            content: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  child: PostCard(
                    data: PostData(
                      username: "Seth Miller",
                      pfp: "assets/ramen.png",
                      image: "assets/ramen.png",
                      time: "6:04 AM",
                      description: "GLIZZY!",
                    )
                  )
                )
              ]
            )
        );
      }
    );

    setState(() {
      markers[MarkerId('Judes')] = marker;
    });)*/

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0DBBE), 
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color.fromARGB(255, 0, 0, 0),
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: Set<Marker>.of(_markers),
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 13.0,
        ),
      ),
    );
  }
}