import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easy/core/config.dart';
import 'package:flutter_easy/demo/account_profile.dart';
import 'package:flutter_easy/demo/hero_animation/hero_animation_demo.dart';
import 'package:flutter_easy/demo/scan/scan_view.dart';
import 'package:flutter_easy/demo/service/service_detail_view.dart';
import 'package:flutter_easy/pages/block/block_pattern.dart';
import 'package:flutter_easy/pages/home/home_cover_top.dart';
import 'package:flutter_easy/pages/home/home_navigation.dart';
import 'package:flutter_easy/repository/utility/navigation_provider.dart';
import 'package:flutter_easy/ui/button/inbox_button.dart';
import 'package:flutter_easy/ui/button/pattern_button.dart';
import 'package:flutter_easy/ui/button/title_viewmore.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  ScrollController scrollController;
  StreamSubscription reTapBottom;
  StreamController<double> scrollChange;
  final double heightBanner = 200;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollChange = StreamController.broadcast();
    scrollController.addListener(() {
      if (scrollController.hasClients) {
        scrollChange.add(scrollController.offset);
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((callback) async {
      reTapBottom = Provider.of<NavigationProvider>(context, listen: false)
          .reTap
          .stream
          .listen(onReTapBottom);
    });
  }

  @override
  void dispose() {
    if (reTapBottom != null) {
      reTapBottom.cancel();
    }
    scrollController.dispose();
    scrollChange.close();
    super.dispose();
  }

  void onReTapBottom(int index) {
    if (index == 0) {
      scrollController.animateTo(0,
          duration: const Duration(milliseconds: 250),
          curve: const ElasticOutCurve(0.25));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        if (scrollController.position.pixels != 0) {
          await scrollController.animateTo(0,
              duration: const Duration(milliseconds: 250),
              curve: const ElasticOutCurve(0.25));
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            RefreshIndicator(
              onRefresh: _refreshHomepage,
              child: CustomScrollView(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate([
                      // banner
                      StreamProvider<double>.value(
                        value: scrollChange.stream,
                        child: Consumer<double>(builder: (key, offset, child) {
                          return Baseline(
                            baseline: 150 + _offsetToPosition(offset),
                            baselineType: TextBaseline.alphabetic,
                            child: Transform.scale(
                              scale: _offsetToScale(offset),
                              child: HomeCoverTop(heightBanner),
                            ),
                          );
                        }),
                      ),
                      const Baseline(
                          baseline: -100,
                          baselineType: TextBaseline.alphabetic,
                          child: HomeNavigation()),
                      ViewMoreTitle(
                        title: 'Service'.toUpperCase(),
                        onPressed: () {
                          Provider.of<NavigationProvider>(context,
                                  listen: false)
                              .switchTo(PageName.category.index);
                        },
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: ((size.width / 2) - 10 - 40) / 95,
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                        children: [
                          PatternButton(
                            title: 'Service',
                            color: Colors.green,
                            icon: Icons.pets,
                            callback: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ServiceDetailView(),
                                ),
                              );
                            },
                          ),
                          PatternButton(
                            title: 'Scanner',
                            color: Colors.blue,
                            icon: MaterialCommunityIcons.barcode_scan,
                            callback: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ScanView()));
                            },
                          ),
                          PatternButton(
                            title: 'Hero Anim',
                            color: Colors.orange,
                            icon: Icons.branding_watermark,
                            callback: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HeroAnimationDemo()));
                            },
                          ),
                          PatternButton(
                            title: 'Profile',
                            color: Colors.purple,
                            icon: Icons.group,
                            callback: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AccountProfile(),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                      ViewMoreTitle(
                        title: 'NewsFeed'.toUpperCase(),
                        onPressed: () {
                          Provider.of<NavigationProvider>(context,
                                  listen: false)
                              .switchTo(PageName.category.index);
                        },
                      ),
                    ]),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((_, index) {
                        final _color = Color(
                                (Random().nextDouble() * 0xFFFFFF).toInt() << 0)
                            .withAlpha(255);
                        return BlockPattern(
                          child: const SizedBox(height: 200),
                          margin: const EdgeInsets.only(bottom: 15),
                          color: _color,
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: StreamProvider<double>.value(
                value: scrollChange.stream,
                child: Consumer<double>(builder: (key, offset, child) {
                  if (offset != null && offset > 100) {
                    return AppBar(
                      title: Container(
                        height: 40,
                        child: Row(
                          children: <Widget>[
                            const FlutterLogo(),
                            const SizedBox(width: 10),
                            Text(kAppName),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        InboxButton(
                          color: Theme.of(context).accentColor,
                        )
                      ],
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _offsetToScale(double offset) {
    if (offset != null && offset < 0) {
      final double _temp = offset / (-900);
      return 1.0 + _temp;
    }
    return 1;
  }

  double _offsetToPosition(double offset) {
    if (offset != null && offset < 0) {
      return offset * 0.9;
    }
    return 0;
  }

  Future<void> _refreshHomepage() async {}

  @override
  bool get wantKeepAlive => true;
}
