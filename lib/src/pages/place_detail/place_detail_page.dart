import 'package:country_before_travel/res/values.dart' as R; // ignore: library_prefixes, prefer_relative_imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:widgets_by_zpdl/material.dart';

import '../../service/google_place/google_place_photo_model.dart';
import '../../service/google_place/google_place_photo_provider.dart';
import '../../widget/async_worker.dart';
import '../place_photo/place_photo_page.dart';
import 'place_detail_controller.dart';

class PlaceDetailPage extends AsyncWorkerBuilder<PlaceDetailController> {

  @override
  Widget asyncWorkerBuilder(BuildContext context) {
    final detailsResult = controller.detailsResult;
    if(detailsResult != null) {
      return LayoutBuilder(
          builder: (context, constraint) {
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  _buildAppbar(context, constraint, detailsResult),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      color: R.color.accentColor,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      color: R.color.white,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      color: R.color.accentColor,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      color: R.color.white,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      color: R.color.accentColor,
                    ),
                  ),
                ],
              ),
            );
          }
      );
    } else {
      return Container();
    }
  }

  Widget _buildAppbar(BuildContext context, BoxConstraints constraints, DetailsResult detailsResult) {
    return SliverAppBar(
      pinned: true,
      collapsedHeight: kToolbarHeight,
      toolbarHeight: kToolbarHeight,
      expandedHeight: constraints.maxWidth * 4 / 3,
      stretch: true,
      backgroundColor: R.theme.primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        title: _buildAppbarTitle(detailsResult.name ?? ''),
        titlePadding: const EdgeInsetsOnly(all: 16.0),
        centerTitle: true,
        background: Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  R.color.black,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
          child: _buildPhotos(context, controller.photos, controller.photoController),
        ),
      ),
    );
  }

  Widget _buildAppbarTitle(String title) {
    return LayoutBuilder(builder: (context, constraint) {
      final appbar = context.findAncestorWidgetOfExactType<SliverAppBar>();
      final collapsedHeight = appbar?.collapsedHeight;
      final expandedHeight = appbar?.expandedHeight;
      var ratio = 0.0;
      if(collapsedHeight != null && expandedHeight != null) {
        final range = expandedHeight - collapsedHeight;
        ratio = (constraint.maxHeight - collapsedHeight) / range;
        if(ratio < 0) {
          ratio = 0;
        } else if(ratio > 1) {
          ratio = 1;
        }
      }

      return Row(
        children: [
          Spacer(flex: (ratio * 100).toInt() + 1,),
          Text(title),
          Spacer(flex: 1,),
        ],
      );
    });
  }

  Widget _buildPhotos(BuildContext context, List<GooglePlacePhotoModel> list, PageController pageController) {
    return PageView.builder(
      controller: pageController,
      itemBuilder: (BuildContext context, int index) {
        return Image(
          image: GooglePlacePhotoProvider(list[index].copyWithMaximumSize(1024, 1024)),
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if(loadingProgress == null)
              return TouchWell(
                  onTap: () async {
                    final result = await PlacePhotoPage.show(context, photos: list, index: index);
                    if(result != null) {
                      pageController.jumpToPage(result);
                    }
                  },
                  touchWellIsTop: true,
                  child: Hero(
                    tag: list[index].photoReference,
                    child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: child),
                  ));

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
      itemCount: list.length,
    );
  }

}