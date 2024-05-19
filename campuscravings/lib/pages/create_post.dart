// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:campuscravings/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:campuscravings/widgets/back_button.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  File? image;
  final myController = TextEditingController();
  final tagsController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    tagsController.dispose();
    super.dispose();
  }

  Future pickImage(ImageSource src) async {
    try {
      final image = await ImagePicker().pickImage(source: src);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  _writePost(String fileName, String content) async {
    final path = await _localPath;
    final File file = File('$path/posts/$fileName');
    await file.writeAsString(content);
  }

  Future<LatLng> getLocation() async { 
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    ); 
    return LatLng(position.latitude, position.longitude);
  }

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
                    /*Positioned( // location field
                      top: 100,
                      child: SizedBox(
                        width: 250,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Location',
                          ),
                        ),
                      ),
                    ),
                    Positioned( // Location icon
                      top: 110,
                      left: 25,
                      child: Icon(
                        Icons.location_on_outlined,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 40,
                      ),
                    ),*/
                    Positioned( // Description field
                      top: 370,
                      child: SizedBox(
                        width: 250,
                        height: 250,
                        child: TextFormField(
                          controller: myController,
                          autofocus: true,
                          autocorrect: false,
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 3,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFF2F2F2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(width: 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned( // Description icon
                      top: 380,
                      left: 25,
                      child: Icon(
                        Icons.textsms_outlined,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 40,
                      ),
                    ),
                    Positioned( // Gallery picker
                      top: 20,
                      child: MaterialButton(
                        color: Colors.blue,
                        child: const Text(
                          "Pick Image from Gallery ",
                          style: TextStyle(
                            color: Colors.white70, fontWeight: FontWeight.bold
                          )
                        ),
                        onPressed: () {
                          pickImage(ImageSource.gallery);
                        }
                      ),
                    ),
                    Positioned( // Camera picker
                      top: 60,
                      child: MaterialButton(
                        color: Colors.blue,
                        child: const Text(
                          "Pick Image from Camera",
                          style: TextStyle(
                            color: Colors.white70, fontWeight: FontWeight.bold
                          )
                        ),
                        onPressed: () {
                          pickImage(ImageSource.camera);
                        }
                      ),
                    ),
                    
                    Positioned( // Image
                      top: 120,
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child:  ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: image != null ? Image.file(
                            image!,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ) : Center(child: Text('No image selected')),
                        ),
                      ),
                    ),
                    Positioned( // Tags field
                      top: 300,
                      child: SizedBox(
                        width: 300,
                        height: 50,
                        child: TextFormField(
                          controller: tagsController,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter tags seperated by ", "',
                          ),
                        ),
                      ),
                    ),
                    Positioned( // Create Post
                      bottom: 25,
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
                                      'Create Post',
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
                          DateTime now = DateTime.now();
                          String formattedDate = DateFormat('MM-dd, hh:mm').format(now);
                          //LatLng position = getLocation();
                          PostData mypost = PostData(
                            username: "Seth",
                            pfp: "assets/cat.png",
                            image: image!.path,
                            time: formattedDate,
                            description: myController.text,
                            lat: "30.407770919024053",
                            lng: "-91.17933649808421",
                            tags: tagsController.text
                          );

                          _writePost(getRandomString(15), jsonEncode(mypost.toJson()));

                          Navigator.pop(context);
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
