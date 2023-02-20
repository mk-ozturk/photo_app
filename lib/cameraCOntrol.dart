import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:whoismysmilar/photopage.dart';


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
    var scr=MediaQuery.of(context).size;
    final scrHeight= scr.height;
    final scrWidth=scr.width;
    return Scaffold(
      body: SizedBox(height: scrHeight/1.15, width: scrWidth ,
        child: FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder:(context, snaphot) {
              if(snaphot.connectionState==ConnectionState.done){
                return CameraPreview(_controller);} else
              {return const Center(child: CircularProgressIndicator(),);}
            }


        ),
      ),
      floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [FloatingActionButton(
          onPressed: () async {
            try {await _initializeControllerFuture;
                  final image=await _controller.takePicture();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PhotoPage(image)));
                 } catch (e)
            {print(e);}
          },
          child:  Icon(Icons.camera_alt),


        ),]
      ),

    );
  }
}
