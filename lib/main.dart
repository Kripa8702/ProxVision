import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:proxvision/config/build_config.dart';
import 'package:proxvision/config/flavour_config.dart';
import 'package:proxvision/proxvision_app.dart';
import 'package:proxvision/simple_bloc_observer.dart';
import 'package:proxvision/utils/pref_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.top,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark, // Change to dark if your core app theme is DARK
  ));

  final package = await PackageInfo.fromPlatform();

  BuildConfig.init(package);
  FlavorConfig.init();

  Bloc.observer = const SimpleBlocObserver();

  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init(),
  ]).then(
        (value) {
      runApp(
        const ProxVisionApp(),
      );
    },
  );
}
