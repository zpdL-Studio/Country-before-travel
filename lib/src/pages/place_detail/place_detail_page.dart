import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_before_travel/res/values.dart' as R; // ignore: library_prefixes, prefer_relative_imports
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:widgets_by_zpdl/material.dart';

import '../../service/google_place/google_place_photo_model.dart';
import '../../service/google_place/google_place_photo_provider.dart';
import '../../widget/async_worker.dart';
import '../../widget/rating_star_widget.dart';
import 'photo/place_photo_page.dart';
import 'place_detail_controller.dart';

class PlaceDetailPage extends AsyncWorkerBuilder<PlaceDetailController> {

  static const double hPadding = 16;
  static const double vPadding = 12;

  @override
  Widget asyncWorkerBuilder(BuildContext context) {
    final detailsResult = controller.detailsResult;
    if(detailsResult != null) {
      final rating = detailsResult.rating;
      final address = detailsResult.formattedAddress;
      final lat = detailsResult.geometry?.location?.lat;
      final lng = detailsResult.geometry?.location?.lng;
      final phone = detailsResult.formattedPhoneNumber;
      final website = detailsResult.website;
      final reviews = detailsResult.reviews;

      return LayoutBuilder(
          builder: (context, constraint) {
            return Scaffold(
              backgroundColor: R.color.backgroundColor,
              body: CustomScrollView(
                slivers: [
                  _buildAppbar(context, constraint, detailsResult),
                  SliverToBoxAdapter(
                    child: Container(
                      height: vPadding,
                    ),
                  ),
                  if(rating != null) _buildRating(context, rating),
                  if(address != null) _buildAddress(context, address, detailsResult.url),
                  if(phone != null) _buildPhoneNumber(context, phone),
                  if(lat != null && lng != null) _buildMap(context, detailsResult.placeId ?? '', LatLng(lat, lng)),
                  if(website != null) _buildWebsite(context, website),
                  if(reviews != null && reviews.isNotEmpty)
                    ...[
                      SliverToBoxAdapter(
                        child: Padding(
                            padding: const EdgeInsetsOnly(horizontal: hPadding, vertical: vPadding),
                            child: Text('Reviews', style: R.headline6)
                        ),
                      ),
                      _buildReviews(context, reviews),
                    ],
                  SliverToBoxAdapter(child: ColumnSpace(32)),
                ],
              ),
            );
          }
      );
    } else {
      return Container(
        color: R.color.backgroundColor,
      );
    }
  }

  Widget _buildAppbar(BuildContext context, BoxConstraints constraints, DetailsResult detailsResult) {
    return SliverAppBar(
      pinned: true,
      collapsedHeight: kToolbarHeight,
      toolbarHeight: kToolbarHeight,
      expandedHeight: constraints.maxWidth * 5 / 4,
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

  Widget _buildRating(BuildContext context, double rating) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsetsOnly(horizontal: hPadding, vertical: vPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Text(rating.toStringAsFixed(1), style: R.headline6)),
            RatingStarWidget(
              rating: rating,
              starCount: 5,
              starSize: 28,
              starSpace: 2,
              ratingColor: R.color.accentColor,
              starColor: R.color.accentColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddress(BuildContext context, String address, String? url) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsetsOnly(horizontal: hPadding, vertical: vPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: SelectableText(address, style: R.subtitle1)),
            if(url != null)
              ...[
                RowSpace(8),
                R.elevationIconButton(Icons.map, onTap: () {
                  url_launcher.launch(url);
                }),
              ]
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneNumber(BuildContext context, String phoneNumber) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsetsOnly(horizontal: hPadding, vertical: vPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: SelectableText(phoneNumber, style: R.subtitle1)),
            if(Platform.isAndroid || Platform.isIOS)
              ...[
                RowSpace(8),
                R.elevationIconButton(Icons.phone_forwarded, foregroundColor: Colors.green, onTap: () {
                  url_launcher.launch('tel://$phoneNumber');
                }),
              ],
          ],
        ),
      ),
    );
  }

  Widget _buildMap(BuildContext context, String placeId, LatLng latLng) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        height: 160,
        padding: const EdgeInsetsOnly(horizontal: hPadding, vertical: vPadding),
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition:
          CameraPosition(target: latLng, zoom: 16),
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
          mapToolbarEnabled: false,
          rotateGesturesEnabled: false,
          scrollGesturesEnabled: false,
          zoomControlsEnabled: false,
          zoomGesturesEnabled: false,
          markers: {
            Marker(
                markerId: MarkerId(placeId),
                position: latLng)
          },
        ),
      ),
    );
  }

  Widget _buildWebsite(BuildContext context, String website) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsetsOnly(horizontal: hPadding, vertical: vPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: SelectableText(website, style: R.subtitle1)),
            RowSpace(8),
            R.elevationIconButton(Icons.home_outlined, onTap: () async {
              url_launcher.launch(website);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildReviews(BuildContext context, List<Review> list) {
    return SliverList(delegate: SliverChildBuilderDelegate(
        (context, index) {
          final review = list[index];
          final profilePhotoUrl = review.profilePhotoUrl;
          final rating = review.rating;

          return Padding(
            padding: const EdgeInsetsOnly(horizontal: hPadding, vertical: vPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    profilePhotoUrl != null
                    ? TouchWell(
                      onTap: review.authorUrl != null ? () async {
                        final authorUrl = review.authorUrl;
                        if(authorUrl != null && await url_launcher.canLaunch(authorUrl)) {
                          url_launcher.launch(authorUrl);
                        }
                      } : null,
                      shape: R.shape.circular(),
                      touchWellIsTop: true,
                      child: CachedNetworkImage(
                          imageUrl: profilePhotoUrl,
                          width: 32,
                          height: 32,
                          fit: BoxFit.cover,
                        ),
                    )
                    : Icon(Icons.account_circle, size: 32, color: R.color.primaryColor,),
                    RowSpace(16),
                    Expanded(child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(review.authorName ?? '', style: R.bodyText1, softWrap: false, overflow: TextOverflow.ellipsis,),
                        Text(review.relativeTimeDescription ?? '', style: R.bodyText2, softWrap: false, overflow: TextOverflow.ellipsis,),
                      ],
                    )),
                    if(rating != null)
                      ...[
                        RowSpace(8),
                        RatingStarWidget(
                          rating: rating.toDouble(),
                          starCount: 5,
                          starSize: 12,
                          starSpace: 0,
                          ratingColor: R.color.primaryColor,
                          starColor: R.color.primaryColor,
                        ),
                      ],
                  ],
                ),
                ColumnSpace(8),
                Text(review.text ?? '', style: R.bodyText2,)
              ],
            ),
          );
        },
        childCount: list.length
    ));
  }
}