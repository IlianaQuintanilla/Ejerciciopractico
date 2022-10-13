import 'package:flutter/material.dart';

class MusicaDeta extends StatefulWidget {
  final String title;
  final String description;
  final String color;
  final String img;
  final String songurl;

  const MusicaDeta(
      {super.key,
      required this.title,
      required this.description,
      required this.color,
      required this.img,
      required this.songurl,
      required songUrl});

  @override
  State<MusicaDeta> createState() => _MusicaDetaState();
}

class _MusicaDetaState extends State<MusicaDeta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
