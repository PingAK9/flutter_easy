import 'package:flutter_easy/core/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easy/repository/utility/navigation_provider.dart';
import 'package:provider/provider.dart';

import 'core/app_theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
      .copyWith(statusBarIconBrightness: Brightness.light));

//  ErrorWidget.builder = (FlutterErrorDetails details) => Container(
//    alignment: Alignment.center,
//    child: Icon(Icons.error),
//  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navKey.currentState.overlay.context;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: MyApp.navKey,
        title: 'My Flutter App',
        theme: appTheme,
        initialRoute: '/',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
