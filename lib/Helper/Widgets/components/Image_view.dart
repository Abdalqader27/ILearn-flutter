import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatefulWidget {
  final imageUrl;

  const ImageView({Key key, this.imageUrl}) : super(key: key);
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
          child: Hero(
            tag: widget.imageUrl,
            child: PhotoView(
            imageProvider:CachedNetworkImageProvider(
              widget.imageUrl
            )
        ),
          )),
    );
  }
}
