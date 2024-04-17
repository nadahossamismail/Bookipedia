import 'package:flutter/cupertino.dart';

class NotFoundGif extends StatelessWidget {
  const NotFoundGif({
    super.key,
    this.imageheight = 200,
    this.imageWidth,
  });
  final double? imageheight, imageWidth;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          'assets/images/884f6bbb75ed5e1446d3b6151b53b3cf.gif',
          height: imageheight,
          width: imageWidth,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
