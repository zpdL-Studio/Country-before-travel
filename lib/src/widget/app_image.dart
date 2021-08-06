import 'package:flutter/widgets.dart';

class AssetsImage extends StatelessWidget {

  final String name;
  final double? size;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const AssetsImage(this.name, {Key? key,  this.size, this.width, this.height, this.fit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      name,
      width: width ?? size,
      height: height ?? size,
      fit: fit,
    );
  }
}