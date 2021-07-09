import 'package:country_before_travel/res/values.dart' as R; // ignore: library_prefixes, prefer_relative_imports
import 'package:get/get.dart';
import 'package:widgets_by_zpdl/material.dart';

import '../../../responsive_scaffold/responsive_scaffold.dart';
import '../../widget/buttons.dart';
import '../routes.dart';
import 'home_controller.dart';

class HomePage extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      prefer: ResponsiveScaffoldPrefer.DRAWER,
      bodyBuilder: _buildBody,
      subBuilder: _buildSub,
      drawerBuilder: ResponsiveDrawerBuilder(
        builder: (context, type) {
          return Drawer(
            elevation: 10,
            child: SubTest(),
          );
        },
      ),
    );
  }

  SliverAppBar _buildAppbar(BuildContext context, ThemeData theme, double width, bool visibleDrawerMenu) {
    return SliverAppBar(
      pinned: true,
      collapsedHeight: kToolbarHeight,
      toolbarHeight: kToolbarHeight,
      expandedHeight: width * (1080.0 / 1920.0),
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        title: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SafeArea(
              child: Hero(
                tag: Routes.SEARCH,
                child: Container(
                  padding: const EdgeInsetsOnly(
                      start: kToolbarHeight, end: 8, vertical: 8),
                  height: kToolbarHeight,
                  child: AppScaleButton(
                      onTap: () {
                        Routes.SEARCH.toNamed();
                      },
                      pressScale: 0.95,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(color: theme.backgroundColor)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                            padding: const EdgeInsetsOnly(horizontal: 16),
                            child: Text('검색',
                                style: theme.backgroundColor.bodyText1),
                          )),
                          Padding(
                            padding: const EdgeInsetsOnly(all: 8),
                            child: Icon(
                              Icons.search,
                              color: theme.backgroundColor,
                            ),
                          )
                        ],
                      )),
                ),
              ),
            );
          },
        ),
        titlePadding: EdgeInsets.zero,
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
          child: R.images.fog_6126432_1920.widget(fit: BoxFit.cover),
        ),
        // background: Stack(
        //   children: [
        //     Positioned.fill(
        //       child: R.images.fog_6126432_1920.widget(fit: BoxFit.cover),
        //     ),
        //     Positioned.fill(
        //       child: Container(
        //         // color: theme.backgroundColor.withOpacity(0.5),
        //         decoration: BoxDecoration(
        //           gradient: LinearGradient(
        //             colors: [R.color.backgroundColor, Colors.transparent, Colors.transparent],
        //             begin: Alignment.topLeft,
        //             end: Alignment.bottomRight,
        //           )
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        collapseMode: CollapseMode.parallax,
        stretchModes: [StretchMode.zoomBackground],
      ),
      backgroundColor: theme.primaryColor,
      leading: AnimatedOpacity(
        opacity: visibleDrawerMenu ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: IconButton(
          icon: Icon(
            Icons.menu,
            color: theme.backgroundColor,
          ),
          onPressed: visibleDrawerMenu
              ? () {
                  Scaffold.of(context).openDrawer();
                }
              : null,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, ResponsiveDevice type, bool visibleDrawerMenu, bool visibleSubMenu) {
    return LayoutBuilder(builder: (context, constraint) {
      return CustomScrollView(
        slivers: [
          _buildAppbar(
              context, R.theme, constraint.maxWidth, visibleDrawerMenu),
          SliverToBoxAdapter(
            child: Obx(() {
              final mofaNotice = controller.mofaNoticeResponse;
              if (mofaNotice != null) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: RowSubject(
                        titleText: '외교부 공지',
                        actions: [
                          RowSubject.createElevationButton(
                              Icon(
                                Icons.more_horiz,
                                color: R.theme.primaryColor,
                                size: 24,
                              ),
                              R.theme.backgroundColor, onTap: () {
                            Routes.MOFA_NOTICE_LIST.toNamed();
                          })
                        ],
                      ),
                    ),
                    for (int i = 0;
                    i < mofaNotice.data.length && i < 5;
                    i++) ...[
                      AppScaleButton(
                        onTap: () {},
                        pressScale: 0.97,
                        child: RowPrefixText(
                            prefix: '·',
                            prefixDivider: 4,
                            text: mofaNotice.data[i].title,
                            style: R.bodyText1,
                            padding: const EdgeInsetsOnly(
                                vertical: 16, horizontal: 16)),
                      ),
                      Divider()
                    ],
                  ],
                );
              }
              return Container();
            }),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 200,
              color: R.color.illuminating,
              alignment: AlignmentDirectional.center,
              child: Container(
                child: TouchWell(
                  onTap: () {
                    // Routes.MAP.toNamed();
                    Routes.PLACE_SEARCH.toNamed();
                  },
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  bgColor: R.color.ultimate_gray,
                  child: RowWrap(
                    height: 30,
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text('GO MAP ${controller.obj}')),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              color: R.color.ultimate_gray,
              child: Center(
                child: AppElevationButton(
                  onTap: () {},
                  color: Colors.cyan,
                  elevation: 10,
                  disabledOpacity: 0.5,
                  child: RowWrap(height: 50, child: Text('ButtonByZpdL')),
                ),
              ),
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
              color: R.color.white,
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
              color: R.color.white,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              color: R.color.white,
            ),
          ),
          SliverToBoxAdapter(
            child: TouchWell(
              onTap: () {},
              elevation: 10,
              child: Container(
                height: 200,
                color: R.color.white,
              ),
            ),
          ),
        ],
      );
    });
  }

  // ignore: unused_element
  Widget _buildSub(BuildContext context, ResponsiveDevice type) {
    return SubTest();
  }
}

class SubTest extends StatefulWidget {
  @override
  _SubTestState createState() => _SubTestState();
}

class _SubTestState extends State<SubTest> {

  @override
  void initState() {
    super.initState();
    print('KKH _SubTestState initState');
  }

  @override
  void dispose() {
    super.dispose();
    print('KKH _SubTestState dispose');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('KKH _SubTestState didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Text(
          'alkhflkadghlk;adhgl;dashlbksnblscnbsclkncsblnlscbnslckbnlsbknlks;dhgdlkhgdalhdalghdalghadgl;'),
    );
  }
}
