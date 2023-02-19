import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whoismysmilar/cameraCOntrol.dart';
import 'dart:async';
import 'dart:io';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(
      MaterialApp(
        theme: ThemeData.dark(),
        home: CameraPage(camera: firstCamera),
        debugShowCheckedModeBanner: false
        ,
      )
  );
}



