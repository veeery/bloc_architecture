import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppNetworkImage extends StatelessWidget {

  bool isCircular;
  double? width;
  double? height;
  String imageUrl;
  BoxFit fit;

  AppNetworkImage({
    required this.imageUrl,
    this.height,
    this.width,
    this.isCircular = true,
    this.fit = BoxFit.fill
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 0.3.sw,
      height: height ?? 0.15.sh,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(isCircular ? 25.w : 0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(isCircular ? 25.w : 0),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: fit,
          placeholder: (context, url) {
            return const Center(child: CircularProgressIndicator());
          },
          errorWidget: (context, url, error) {
            return const Center(child: Icon(Icons.image_not_supported_outlined));
          },
        ),
      ),
    );
  }
}
