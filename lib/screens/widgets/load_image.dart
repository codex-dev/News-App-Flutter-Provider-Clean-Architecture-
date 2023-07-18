import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/api_config.dart';

class LoadImage extends StatelessWidget {
  const LoadImage({super.key, this.url, this.height, this.width, this.fit});

  final String? url;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return loadImage();
  }

  Widget loadImage() {
    String imgUrl = (url == null || url!.trim().isEmpty)
        ? ApiConfig.imageNotFoundPlaceholderUrl
        : url.toString();

    bool isSVG = imgUrl.trim().toLowerCase().endsWith(".svg");

    if (isSVG) {
      return Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          child: SvgPicture.network(
            Uri.parse(imgUrl).toString(),
          ));
    } else {
      return Image.network(
        Uri.parse(imgUrl).toString(),
        height: height,
        width: width,
        fit: fit,
      );
    }
  }
}
