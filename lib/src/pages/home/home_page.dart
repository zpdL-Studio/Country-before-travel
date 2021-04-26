import 'package:country_before_travel/res/values.dart' as R;
import 'package:country_before_travel/responsive_scaffold/widget/material/responsive_scaffold_sub.dart';
import 'package:country_before_travel/src/pages/home/home_controller.dart';
import 'package:country_before_travel/src/widget/buttons.dart';
import 'package:get/get.dart';
import 'package:widgets_by_zpdl/material.dart';
import 'package:country_before_travel/responsive_scaffold/responsive_scaffold.dart';

import '../routes.dart';

class HomePage extends GetWidget<HomeController> {

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffoldSub(
      bodyBuilder: (BuildContext context, ResponsiveDevice type, bool visibleDrawerMenu, bool visibleSubMenu) {
        return LayoutBuilder(
          builder: (context, constraint) {
            // print("KKH Body LayoutBuilder maxWidth: ${constraint.maxWidth} maxHeight: ${constraint.maxHeight}");
            return CustomScrollView(
              slivers: [
                _buildAppbar(context, R.theme, constraint.maxWidth, visibleDrawerMenu),
                SliverToBoxAdapter(
                  child: Obx(() {
                    final mofaNotice = controller.mofaNoticeResponse;
                    if(mofaNotice != null) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: RowSubject(
                              titleText: '외교부 공지',
                              actions: [
                                RowSubject.createElevationButton(
                                    Icon(
                                      Icons.more,
                                      color: R.theme.primaryColor,
                                      size: 24,
                                    ),
                                    R.theme.backgroundColor,
                                    onTap: () {
                                      Get.toNamed(Routes.MOFA_NOTICE_LIST);
                                    }
                                )
                              ],),
                          ),
                          for(int i = 0; i < mofaNotice.data.length && i < 5; i++)
                            ...[
                              AppScaleButton(
                                onTap: () {},
                                pressScale: 0.97,
                                child: RowPrefixText(
                                    prefix: '·',
                                    prefixDivider: 4,
                                    text: mofaNotice.data[i].title,
                                    style: R.bodyText1,
                                    padding: const EdgeInsetsOnly(vertical: 16, horizontal: 16)
                                ),
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
                        onTap: () {},
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(50))
                        ),
                        bgColor: R.color.ultimate_gray,
                        child: RowWrap(
                          height: 30,
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text('CENTER ${controller.obj}')),
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
                        child: RowWrap(
                            height: 50,
                            child: Text('ButtonByZpdL')),
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
          }
        );
      },
      subBuilder: (BuildContext context, ResponsiveDevice type) {
        return Container(color: Colors.purple, child: Text('alkhflkadghlk;adhgl;dashlbksnblscnbsclkncsblnlscbnslckbnlsbknlks;dhgdlkhgdalhdalghdalghadgl;'),);
      },
    );

    // return ResponsiveScaffoldDrawer(
    //   drawer: ResponsiveDrawerParameter(
    //     builder: (context, type) {
    //       return Drawer(
    //         elevation: 10,
    //         child: LayoutBuilder(
    //           builder: (context, constraint) {
    //             // print("KKH Drawer LayoutBuilder maxWidth: ${constraint.maxWidth} maxHeight: ${constraint.maxHeight}");
    //             return Container(
    //               color: R.color.accentColor,
    //             );
    //           }
    //         ),
    //       );
    //     },
    //   ),
    //   bodyBuilder: (BuildContext context, ResponsiveDevice type, bool visibleDrawerMenu, bool visibleSubMenu) {
    //     return LayoutBuilder(
    //       builder: (context, constraint) {
    //         // print("KKH Body LayoutBuilder maxWidth: ${constraint.maxWidth} maxHeight: ${constraint.maxHeight}");
    //         return CustomScrollView(
    //           slivers: [
    //             _buildAppbar(context, R.theme, constraint.maxWidth, visibleDrawerMenu),
    //             SliverToBoxAdapter(
    //               child: Obx(() {
    //                 final mofaNotice = controller.mofaNoticeResponse;
    //                 if(mofaNotice != null) {
    //                   return Column(
    //                     mainAxisSize: MainAxisSize.min,
    //                     children: [
    //                       Container(
    //                         child: RowSubject(
    //                           titleText: '외교부 공지',
    //                           actions: [
    //                             RowSubject.createElevationButton(
    //                                 Icon(
    //                                   Icons.more,
    //                                   color: R.theme.primaryColor,
    //                                   size: 24,
    //                                 ),
    //                                 R.theme.backgroundColor,
    //                                 onTap: () {
    //                                   Get.toNamed(Routes.MOFA_NOTICE_LIST);
    //                                 }
    //                             )
    //                           ],),
    //                       ),
    //                       for(int i = 0; i < mofaNotice.data.length && i < 5; i++)
    //                         ...[
    //                           AppScaleButton(
    //                             onTap: () {},
    //                             pressScale: 0.97,
    //                             child: RowPrefixText(
    //                                 prefix: '·',
    //                                 prefixDivider: 4,
    //                                 text: mofaNotice.data[i].title,
    //                                 style: R.bodyText1,
    //                                 padding: const EdgeInsetsOnly(vertical: 16, horizontal: 16)
    //                             ),
    //                           ),
    //                           Divider()
    //                         ],
    //                     ],
    //                   );
    //                 }
    //                 return Container();
    //               }),
    //             ),
    //             SliverToBoxAdapter(
    //               child: Container(
    //                 width: double.infinity,
    //                 height: 200,
    //                 color: R.color.illuminating,
    //                 alignment: AlignmentDirectional.center,
    //                 child: Container(
    //                   child: TouchWell(
    //                     onTap: () {},
    //                     elevation: 5,
    //                     shape: RoundedRectangleBorder(
    //                         side: BorderSide.none,
    //                         borderRadius: BorderRadius.all(Radius.circular(50))
    //                     ),
    //                     bgColor: R.color.ultimate_gray,
    //                     child: RowWrap(
    //                       height: 30,
    //                       child: Container(
    //                           padding: EdgeInsets.symmetric(horizontal: 12),
    //                           child: Text('CENTER ${controller.obj}')),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             SliverToBoxAdapter(
    //               child: Container(
    //                 height: 200,
    //                 color: R.color.ultimate_gray,
    //                 child: Center(
    //                   child: AppElevationButton(
    //                     onTap: () {},
    //                     color: Colors.cyan,
    //                     elevation: 10,
    //                     disabledOpacity: 0.5,
    //                     child: RowWrap(
    //                         height: 50,
    //                         child: Text('ButtonByZpdL')),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             SliverToBoxAdapter(
    //               child: Container(
    //                 height: 200,
    //                 color: R.color.white,
    //               ),
    //             ),
    //             SliverToBoxAdapter(
    //               child: Container(
    //                 height: 200,
    //                 color: R.color.white,
    //               ),
    //             ),
    //             SliverToBoxAdapter(
    //               child: Container(
    //                 height: 200,
    //                 color: R.color.white,
    //               ),
    //             ),
    //             SliverToBoxAdapter(
    //               child: Container(
    //                 height: 200,
    //                 color: R.color.white,
    //               ),
    //             ),
    //             SliverToBoxAdapter(
    //               child: Container(
    //                 height: 200,
    //                 color: R.color.white,
    //               ),
    //             ),
    //             SliverToBoxAdapter(
    //               child: TouchWell(
    //                 onTap: () {},
    //                 elevation: 10,
    //                 child: Container(
    //                   height: 200,
    //                   color: R.color.white,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         );
    //       }
    //     );
    //   },
    // );
  }

  SliverAppBar _buildAppbar(BuildContext context, ThemeData theme, double width, bool visibleDrawerMenu) {
    return SliverAppBar(
      pinned: true,
      collapsedHeight: kToolbarHeight,
      toolbarHeight: kToolbarHeight,
      expandedHeight: width * ( 1080.0 / 1920.0),
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        title: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SafeArea(
              child: Container(
                padding: const EdgeInsetsOnly(start: kToolbarHeight, end: 8, vertical: 8),
                height: kToolbarHeight,
                child: AppScaleButton(
                    onTap: () {},
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
                          child: Text('검색', style: theme.backgroundColor.bodyText1),
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
            );
          },
        ),
        titlePadding: EdgeInsets.zero,
        background: R.images.fog_6126432_1920.widget(fit: BoxFit.cover),
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
          onPressed: visibleDrawerMenu ? () {
            Scaffold.of(context).openDrawer();
          } : null,
        ),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ThemeLayoutBuilder(
//       builder: (BuildContext context, ThemeData theme, double width, double height) {
//         return Scaffold(
//           body: GetX<HomeController>(
//               init: HomeController(),
//               builder: (_) {
//                 return CustomScrollView(
//                   slivers: [
//                     _buildAppbar(context, theme, width),
//                     SliverToBoxAdapter(
//                       child: Container(
//                         width: double.infinity,
//                         height: 200,
//                         color: R.color.illuminating,
//                         alignment: AlignmentDirectional.center,
//                         child: Container(
//                           child: TouchWell(
//                             onTap: () {},
//                             elevation: 5,
//                             shape: RoundedRectangleBorder(
//                                 side: BorderSide.none,
//                                 borderRadius: BorderRadius.all(Radius.circular(50))
//                               ),
//                             bgColor: R.color.ultimate_gray,
//                             child: RowWrap(
//                               height: 30,
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(horizontal: 12),
//                                 child: Text('CENTER ${_.obj}')),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SliverToBoxAdapter(
//                       child: Container(
//                         height: 200,
//                         color: R.color.ultimate_gray,
//                         child: Center(
//                           child: ButtonByZpdL(
//                             onTap: () {},
//                             color: Colors.cyan,
//                             elevation: 10,
//                             disabledOpacity: 0.5,
//                             child: RowWrap(
//                               height: 50,
//                               child: Text('ButtonByZpdL')),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SliverToBoxAdapter(
//                       child: Container(
//                         height: 200,
//                         color: R.color.white,
//                       ),
//                     ),
//                     SliverToBoxAdapter(
//                       child: Container(
//                         height: 200,
//                         color: R.color.white,
//                       ),
//                     ),
//                     SliverToBoxAdapter(
//                       child: Container(
//                         height: 200,
//                         color: R.color.white,
//                       ),
//                     ),
//                     SliverToBoxAdapter(
//                       child: Container(
//                         height: 200,
//                         color: R.color.white,
//                       ),
//                     ),
//                     SliverToBoxAdapter(
//                       child: Container(
//                         height: 200,
//                         color: R.color.white,
//                       ),
//                     ),
//                     SliverToBoxAdapter(
//                       child: TouchWell(
//                         onTap: () {},
//                         elevation: 10,
//                         child: Container(
//                           height: 200,
//                           color: R.color.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               }
//           ),
//         );
//       },
//     );
//   }
//
//   SliverAppBar _buildAppbar(BuildContext context, ThemeData theme, double width, ) {
//     return SliverAppBar(
//         pinned: true,
//         expandedHeight: width * ( 1080.0 / 1920.0),
//         stretch: true,
//         flexibleSpace: FlexibleSpaceBar(
//           title: LayoutBuilder(
//             builder: (BuildContext context, BoxConstraints constraints) {
//               print("KKH _buildAppbar w : ${constraints.maxWidth} h :${constraints.maxHeight}");
//               double height = kToolbarHeight - 16;
//               return Container(
//                   width: double.infinity,
//                   height: height,
//                   alignment: AlignmentDirectional.bottomStart,
//                   child: AppButton(
//                     onTap: () {},
//                     elevation: 0.0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                       side: BorderSide(color: theme.primaryColor)
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Expanded(
//                             child: Container(
//                               padding: R.edgeInsets(horizontal: 16),
//                               child: Text('검색', style: theme.primaryColor.bodyText1),
//                             )),
//                         Padding(
//                           padding: R.edgeInsets(all: 8),
//                           child: Icon(Icons.search, color: theme.primaryColor,),
//                         )
//                         // IconButton(
//                         //   icon: const Icon(Icons.search),
//                         //   color: theme.primaryColor,
//                         //   // tooltip: 'Add new entry',
//                         //   // onPressed: () {
//                         //   //   /* ... */
//                         //   // },
//                         // ),
//                     ],
//                     )
//                   ),                  // child: Text('Available sears Available', style: TextStyle(backgroundColor: theme.primaryColor),)
//               );
//             },
//           ),
//           background: R.images.fog_6126432_1920.widget(fit: BoxFit.cover),
//           collapseMode: CollapseMode.parallax,
//           stretchModes: [StretchMode.zoomBackground],
//         ),
//         backgroundColor: theme.backgroundColor,
//         // actions: <Widget>[
//         //   IconButton(
//         //     icon: const Icon(Icons.add_circle),
//         //     tooltip: 'Add new entry',
//         //     onPressed: () {
//         //       /* ... */
//         //     },
//         //   ),
//         // ]
//     );
//   }
// }