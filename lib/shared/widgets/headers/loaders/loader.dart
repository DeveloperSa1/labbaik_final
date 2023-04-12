import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:labbaik/imports.dart';
import 'package:labbaik/shared/constant/colors.dart';

class AppLoading extends StatefulWidget {
  const AppLoading({super.key});

  @override
  State<AppLoading> createState() => _AppLoadingState();
}

class _AppLoadingState extends State<AppLoading> {
  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
  color: color1,
  size: 50.0,
);
  }
}