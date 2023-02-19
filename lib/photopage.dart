import 'package:flutter/material.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({Key? key}) : super(key: key);

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
              child: Image.network("https://images.pexels.com/photos/1987301/pexels-photo-1987301.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
        ],

      ),
    );
  }
}
