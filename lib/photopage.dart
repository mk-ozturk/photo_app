import 'package:flutter/material.dart';

class PhotoPage extends StatefulWidget {

  dynamic img;

  PhotoPage(this.img);

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    var scrSize = MediaQuery.of(context).size;
    final scrHeight= scrSize.height;
    final scrWidth=scrSize.width;
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: scrWidth , height: scrHeight/1.3,
              child: Image(image: widget.img))
        ],

      ),
    );
  }
}
