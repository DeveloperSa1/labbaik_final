import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:labbaik/features/authentaction/view/splash.dart';
import 'package:labbaik/global_bindings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'imports.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wr// Wrap your app
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogged = false;

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        useInheritedMediaQuery: true,
        locale: const Locale('ar', 'AR'),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          // uses `flutter_localizations`
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en', 'US'), Locale('AR', 'IR')],
        title: 'Labbaik',
        getPages: appRoutes(),
        debugShowCheckedModeBanner: false,
        initialBinding: GlobalAppBindings(),
        home: const SplashScreen(),
        builder: EasyLoading.init(),
      );
    });
  }
}
