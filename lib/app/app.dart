import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:store_nxt/app/app_config.dart';
import 'package:store_nxt/app/localizations/localizations.dart';
import 'package:store_nxt/app/routes/routes.dart';
import 'package:store_nxt/core/service/inherited_provider.dart';
import 'package:store_nxt/ui/styles/colors.dart';

class StoreNxtApp extends StatefulWidget with WidgetsBindingObserver {
  final String initialRoute;
  StoreNxtApp({Key key, this.initialRoute}) : super(key: key);

  @override
  _StoreNxtAppState createState() => _StoreNxtAppState();
}

class _StoreNxtAppState extends State<StoreNxtApp> {
  bool _initialized;
  String _initialRouteName;

  @override
  void initState() {
    _initialized = false;
    super.initState();
    _initialize();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _initialize() async {
    _initialRouteName = widget.initialRoute;;
    _initialized = true;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ServiceProvider(
      builder: (_, serviceContainer) {
        return MaterialApp(
          title: 'StoreNxt',
          debugShowCheckedModeBanner: false,
          initialRoute: _initialRouteName,
          navigatorKey: appConfig.mainNavigatorKey,
          onGenerateRoute: appConfig.router.onGenerateMainRoute,
          theme: ThemeData(
              primarySwatch: AppColors.primaryColor,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              bottomSheetTheme: ThemeData.light()
                  .bottomSheetTheme
                  .copyWith(backgroundColor: Colors.transparent, elevation: 0),
              appBarTheme: AppBarTheme(
                color: Colors.white,
                elevation: 0.0,
                iconTheme: IconThemeData(color: AppColors.primaryColor),
              ),
              fontFamily: "HelveticaNeue"),
          localizationsDelegates: [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: [const Locale('fr')],
        );
      },
    );
  }
}
