import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';

class ImageWidget extends StatelessWidget {

  const ImageWidget({
    required this.imageUrl,
    super.key,
    this.width = 165,
    this.height = 52,
    this.fit,
    this.color,
    this.colorFilter,
  });
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.contains('http') || imageUrl.contains('https')) {
      return ExtendedImage.network(
        imageUrl,
        width: width,
        height: height,
        fit: fit ?? BoxFit.fill,
        color: color,
        loadStateChanged: (state) {
          switch (state.extendedImageLoadState) {
            case LoadState.completed:
              return state.completedWidget;
            case LoadState.loading:
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            case LoadState.failed:
            default:
              return const SizedBox();
          }
        },
      );
    } else if (imageUrl.contains('.svg')) {
      return SvgPicture.asset(
        imageUrl,
        semanticsLabel: 'Acme Logo',
        width: width,
        height: height,
        fit: fit ?? BoxFit.fill,
        colorFilter: color!= null? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      );
    }
    return Image.asset(
      imageUrl,
      width: width,
      height: height,
      fit: fit?? BoxFit.fill,
      color: color,
    );
  }
}
