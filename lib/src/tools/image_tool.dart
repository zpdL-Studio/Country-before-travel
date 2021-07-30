import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as im;

export 'package:image/image.dart' show Image;

ImageMimeType? mimeType(Uint8List data) {
  final decoder = im.findDecoderForData(data);
  if (decoder is im.JpegDecoder) {
    return ImageMimeType.JPG;
  }

  if (decoder is im.PngDecoder) {
    return ImageMimeType.PNG;
  }

  if (decoder is im.GifDecoder) {
    return ImageMimeType.GIF;
  }

  if (decoder is im.WebPDecoder) {
    return ImageMimeType.WEBP;
  }

  if (decoder is im.TiffDecoder) {
    return ImageMimeType.TIFF;
  }

  if (decoder is im.PsdDecoder) {
    return ImageMimeType.PSD;
  }

  if (decoder is im.ExrDecoder) {
    return ImageMimeType.EXR;
  }

  if (decoder is im.BmpDecoder) {
    return ImageMimeType.BMP;
  }

  if (decoder is im.TgaDecoder) {
    return ImageMimeType.TGA;
  }

  if (decoder is im.IcoDecoder) {
    return ImageMimeType.ICO;
  }
  return null;
}

Future<im.Image?> decode(Uint8List data) {
  return compute(im.decodeImage, data);
}

Future<Uint8List> encodeJpg(im.Image image, {ImageSize? size}) {
  return compute(_encodeJpg, _EncodeArguments(image, size));
}

Uint8List _encodeJpg(_EncodeArguments args) {
  im.Image image = args.image;

  final size = args.size;
  if (size != null) {
    image = im.copyResize(args.image, width: size.width, height: size.height);
  }
  return Uint8List.fromList(im.encodeJpg(image));
}

ImageSize containImageSize(ImageSize source, ImageSize target) {
  final wRatio = target.width.toDouble() / source.width.toDouble();
  final hRatio = target.height.toDouble() / source.height.toDouble();

  if (wRatio < 1 || hRatio < 1) {
    if (wRatio < hRatio) {
      return ImageSize(
          (source.width * wRatio).toInt(), (source.height * wRatio).toInt());
    } else {
      return ImageSize(
          (source.width * hRatio).toInt(), (source.height * hRatio).toInt());
    }
  }

  return source;
}

enum ImageMimeType {
  JPG,
  PNG,
  GIF,
  WEBP,
  TIFF,
  PSD,
  EXR,
  BMP,
  TGA,
  ICO,
}

class ImageSize {
  final int width;
  final int height;

  const ImageSize(this.width, this.height);

  factory ImageSize.size(int size) => ImageSize(size, size);

  @override
  String toString() {
    return 'ImageSize{width: $width, height: $height}';
  }
}

class _EncodeArguments {
  final im.Image image;
  final ImageSize? size;

  const _EncodeArguments(this.image, this.size);
}