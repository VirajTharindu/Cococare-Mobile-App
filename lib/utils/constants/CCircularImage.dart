import 'package:cached_network_image/cached_network_image.dart';
import 'package:coconut_disease_detection/common/shimmer.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:coconut_disease_detection/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CCircularImage extends StatelessWidget {
  const CCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = CSizes.sm,
    this.isNetworkImage = false,
  });
  final double width;
  final double height;
  final Color? overlayColor;
  final Color? backgroundColor;
  final String image;
  final BoxFit fit;
  final double padding;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        //if image background color is null then switch it to light & dark mode color design

        color: backgroundColor ??
            (CHelperFunctions.isDarkMode(context)
                ? Colors.black
                : Colors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  color: overlayColor,
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const CShimmerEffect(width: 55, height: 55),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  image: isNetworkImage
                      ? NetworkImage(image)
                      : AssetImage(image) as ImageProvider,
                  fit: fit,
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}
