import 'package:get/get.dart';

import 'home/home_bindings.dart';
import 'home/home_page.dart';
import 'map/map_bindings.dart';
import 'map/map_page.dart';
import 'mofa_notice/mofa_notice.dart';
import 'mofa_notice/mofa_notice_list_page.dart';
import 'place_detail/place_detail_bindings.dart';
import 'place_detail/place_detail_page.dart';
import 'search/search_bindings.dart';
import 'search/search_page.dart';
import 'search_place/search_place_bindings.dart';
import 'search_place/search_place_page.dart';

enum Routes {
  HOME,
  SEARCH,
  MOFA_NOTICE_LIST,
  MAP,
  SEARCH_PLACE,
  PLACE_DETAIL,
}

extension RouteExtension on Routes {
  String get route {
    switch(this) {
      case Routes.HOME:
        return '/';
      case Routes.SEARCH:
        return '/search';
      case Routes.MOFA_NOTICE_LIST:
        return '/mofa_notice_list';
      case Routes.MAP:
        return '/map';
      case Routes.SEARCH_PLACE:
        return '/search_place';
      case Routes.PLACE_DETAIL:
        return '/place_detail';
    }
  }

  Future<T?>? toNamed<T>({
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    return Get.toNamed(route,
        arguments: arguments,
        id: id,
        preventDuplicates: preventDuplicates,
        parameters: parameters);
  }
}

List<GetPage> get routesPages => [
      GetPage(
        name: Routes.HOME.route,
        binding: HomeBindings(),
        page: () => HomePage(),
      ),
      GetPage(
        name: Routes.SEARCH.route,
        binding: SearchBindings(),
        page: () => SearchPage(),
      ),
      GetPage(
        name: Routes.MOFA_NOTICE_LIST.route,
        binding: MofaNoticeBindings(),
        page: () => MofaNoticeListPage(),
      ),
      GetPage(
        name: Routes.MAP.route,
        binding: MapBindings(),
        page: () => MapPage(),
      ),
      GetPage(
        name: Routes.SEARCH_PLACE.route,
        binding: SearchPlaceBindings(),
        page: () => SearchPlacePage(),
      ),
      GetPage(
        name: Routes.SEARCH_PLACE.route,
        binding: SearchPlaceBindings(),
        page: () => SearchPlacePage(),
      ),
      GetPage(
          name: Routes.PLACE_DETAIL.route,
          binding: PlaceDetailBindings(),
          page: () => PlaceDetailPage(),
      ),
    ];