import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  var imageUrl;
   FullScreenImage({super.key,@required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image(image: NetworkImage(imageUrl));
  }
}
