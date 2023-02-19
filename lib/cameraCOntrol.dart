import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';


class CameraPage extends StatefulWidget {
  const CameraPage({super.key, required this.camera,}) ;
  final CameraDescription camera;


  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {

  late CameraController _controller;
  late Future<void> _initializeControllerFuture;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller=CameraController(widget.camera, ResolutionPreset.high  );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder:(context, snaphot) {
            if(snaphot.connectionState==ConnectionState.done){
              return CameraPreview(_controller);} else
            {return const Center(child: CircularProgressIndicator(),);}
          }


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {await _initializeControllerFuture;
                final image=await _controller.takePicture();
               } catch (e)
          {print(e);}
        },
        child:  Icon(Icons.camera_alt),


      ),

    );
  }
}
