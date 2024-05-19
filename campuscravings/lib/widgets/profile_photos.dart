import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class Profilephotos extends StatelessWidget {
  Profilephotos({super.key});

  final  List<String> paths = [
    "assets/yum.png",
    "assets/yum2.jpg",
    "assets/yum3.jpg",
    "assets/yum4.jpg",
    "assets/yum5.jpg",
    "assets/yum6.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      itemCount: 6,
      physics: const AlwaysScrollableScrollPhysics(),
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemBuilder: (context, index) => Image.asset(paths[index]),
    );
  }
}