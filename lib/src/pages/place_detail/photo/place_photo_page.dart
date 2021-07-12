import 'package:country_before_travel/res/values.dart' as R; // ignore: library_prefixes, prefer_relative_imports
import 'package:flutter/material.dart';
import 'package:widgets_by_zpdl/material.dart';

import '../../../service/google_place/google_place_photo_model.dart';
import '../../../service/google_place/google_place_photo_provider.dart';
import '../../../widget/buttons.dart';
import '../../../widget/glass_container.dart';


class PlacePhotoPage extends StatelessWidget {
  static Future<int?> show(BuildContext context,
      {required List<GooglePlacePhotoModel> photos, int? index}) {
    int currentIndex = index ?? 0;
    final pageController = PageController(initialPage: currentIndex);

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: GlassContainer(
              sigmaX: 8.0,
              sigmaY: 8.0,
              opacity: 0.4,
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Stack(
                    children: [
                      PlacePhotoPage(
                        photos: photos,
                        pageController: pageController,
                        onPageChanged: (index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                      Align(alignment: AlignmentDirectional.topStart, child: AppScaleButton(
                        onTap: () {
                          Navigator.pop(context, pageController.page?.toInt());
                        },
                        pressScale: 0.90,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsetsOnly(all: 16),
                          child: Icon(
                            Icons.close,
                            color: R.theme.backgroundColor,
                          ),
                        ),
                      )),
                      Align(
                          alignment: AlignmentDirectional.bottomEnd,
                          child: Padding(
                            padding: const EdgeInsetsOnly(all: 16),
                            child: Text('${currentIndex + 1} / ${photos.length}', style: R.subtitle1.copyWith(color: R.theme.backgroundColor),),
                          ))
                    ],
                  );
                },
              )),
        );
      },
    );
  }

  final List<GooglePlacePhotoModel> photos;
  final PageController pageController;
  final ValueChanged<int>? onPageChanged;

  const PlacePhotoPage({Key? key, required this.photos, required this.pageController, this.onPageChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemBuilder: (BuildContext context, int index) {
        return Image(
          image: GooglePlacePhotoProvider(photos[index].copyWithMaximumSize(1024, 1024)),
          fit: BoxFit.contain,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if(loadingProgress == null)
              return child;

            return Center(
              child: Icon(Icons.downloading_outlined, size: 64, color: R.color.backgroundColor,),
            );
          },
          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
            return Center(
              child: Column(
                children: [
                  Icon(Icons.error_outline_outlined, size: 64, color: R.color.backgroundColor,),
                  ColumnSpace(16),
                  Text(error.toString(), style: R.subtitle1,)
                ],
              ),
            );
          },
        );
      },
      itemCount: photos.length,
      onPageChanged: onPageChanged,
    );
  }
}