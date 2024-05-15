import 'package:oil2u/core/network/apis.dart';
import 'package:oil2u/core/network/logger.dart';
import 'package:oil2u/presentation/login_screen/notifier/login_notifier.dart';

import 'core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitDio()();
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    PrefUtils().init()
  ]).then((value) {
    runApp(ProviderScope(child: MyApp()));
  });
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final themeType = ref.watch(themeNotifier).themeType;
    final authToken = ref.watch(loginNotifier.notifier).authToken();
    debugLog(message: "token $authToken");
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'oil2u',
          navigatorKey: NavigatorService.navigatorKey,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            AppLocalizationDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: [
            Locale(
              'en',
              '',
            )
          ],
          initialRoute: authToken != null
              ? AppRoutes.dashboardPage
              : AppRoutes.initialRoute,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
