
import 'package:labbaik/imports.dart';
import 'package:labbaik/shared/constant/colors.dart';
import 'package:redirect_icon/redirect_icon.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          RedirectSocialIcon(
            url: "https://www.instagram.com/nishchayshakyaa/",
            icon: FontAwesomeIcons.earthEurope,
            radius: 15,
            size: 17,
            iconColor: Colors.white,
            circleAvatarColor: color2,
          ),
          const SizedBox(width: 15),
          const RedirectSocialIcon(
            url: "https://www.instagram.com/nishchayshakyaa/",
            icon: FontAwesomeIcons.whatsapp,
            radius: 15,
            size: 17,
            iconColor: Colors.green,
            circleAvatarColor: LightColors.kLightGreen,
          ),
          const SizedBox(width: 15),
          const RedirectSocialIcon(
            url: "https://www.instagram.com/nishchayshakyaa/",
            icon: FontAwesomeIcons.instagram,
            radius: 15,
            size: 17,
            iconColor: Colors.white,
            circleAvatarColor: AppColors2.contentColorOrange,
          ),
          const SizedBox(width: 15),
          RedirectSocialIcon(
            url: "https://www.instagram.com/nishchayshakyaa/",
            icon: FontAwesomeIcons.tiktok,
            radius: 15,
            size: 17,
            iconColor: Colors.white,
            circleAvatarColor: color1,
          ),
        ],
      ),
    );
  }
}
