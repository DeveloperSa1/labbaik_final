import 'package:labbaik/imports.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 500),
      delay: const Duration(milliseconds: 800),
      child: Row(
        children: [
          
          const Spacer(),
          Expanded(
            flex: 2,
            child: Image.asset(
              "assets/images/Labbaik.png",
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class LogoImage2 extends StatelessWidget {
  const LogoImage2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 250),
      delay: const Duration(milliseconds: 2000),
      child: Row(
        children: [
          const Spacer(),
          Expanded(
            flex: 2,
            child: Image.asset(
              "assets/images/Labbaik.png",
            ),
          ),
          const Text('Made with love in Jeddah '),
        ],
      ),
    );
  }
}

class LogoImage3 extends StatelessWidget {
  const LogoImage3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FadeInImage(
      width: 30.h,
      height: 30.h,
      image: const AssetImage(
        "assets/images/Labbaik.png",
      ),
      placeholder: const AssetImage("assets/images/Labbaik.png"),
    );
  }
}
