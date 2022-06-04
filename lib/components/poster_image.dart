import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PosterImage extends StatelessWidget {
  final String imageUrl;
  const PosterImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: (imageUrl == 'https://image.tmdb.org/t/p/originalnull')
            ? Lottie.asset(
                "assets/animations/no_image_found.json",
                height: 150,
              )
            : Image.network(
                imageUrl,
                height: 150,
                fit: BoxFit.fill,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Lottie.asset(
                    "assets/animations/img_loading.json",
                    height: 150,
                  );
                },
              ),
      );
    } catch (e) {
      // When no internet or SocketException
      return Lottie.asset(
        "assets/animations/img_loading.json",
        height: 150,
      );
    }
  }
}
