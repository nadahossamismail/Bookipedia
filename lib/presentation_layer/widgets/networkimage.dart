import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageHandel extends StatelessWidget {
  const NetworkImageHandel({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: MediaQuery.of(context).size.width / 2.5 - 20,
        height: MediaQuery.of(context).size.height / 6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
      ),
      errorWidget: (context, url, error) => const ErrorNetworkImage(),
      placeholder: (context, url) => const ErrorNetworkImage(),
    );
  }
}

class ErrorNetworkImage extends StatelessWidget {
  const ErrorNetworkImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5 - 20,
      height: MediaQuery.of(context).size.height / 5.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: const DecorationImage(
              image: AssetImage(
                  'assets/images/884f6bbb75ed5e1446d3b6151b53b3cf.gif'),
              fit: BoxFit.cover)),
    );
  }
}
