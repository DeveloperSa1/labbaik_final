import 'package:labbaik/features/authentaction/view/components/card_select.dart';
import 'package:labbaik/features/authentaction/viewModel/auth.dart';
import 'package:labbaik/imports.dart';
import 'package:labbaik/shared/constant/colors.dart';
import 'package:labbaik/shared/constant/sizes.dart';
import 'package:labbaik/shared/constant/texts_styles.dart';
import 'package:labbaik/shared/enums/user_type.dart';
import 'package:labbaik/shared/widgets/logo_image.dart';
import 'widgets/background.dart';

class WelcomeScreen extends GetView<AuthVM> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WelcomeBackground(
      child: SingleChildScrollView(
        child: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              const LogoImage(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      sizedH10,
                      Text(' تسجيل الدخول', style: smallBlueText),
                      sizedH10,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              LoginCard(
                                  uType: UserType.guardian,
                                  color: color1.withOpacity(0.7),
                                  title: 'ولي الأمر',
                                  icon: FontAwesomeIcons.handsHoldingChild),
                              LoginCard(
                                  uType: UserType.specialest,
                                  color: AppColors2.contentColorPurple
                                      .withOpacity(0.6),
                                  title: 'فريق العمل',
                                  icon: FontAwesomeIcons.userGroup),
                              LoginCard(
                                  uType: UserType.admin,
                                  color: color1.withOpacity(0.8),
                                  title: 'الإدارة',
                                  icon: FontAwesomeIcons.userLock),
                            ],
                          ),
                        ),
                      ),
                      sizedH10,
                    ]),
              ),
              Text(
                'Made with love in JEDDAH ❤️',
                style: GoogleFonts.delius(
                    fontSize: 14.sp, decorationColor: lightGrey),
              ),
              sizedH20,
              const Text(
                '© 2023 this app made for LABBAIK educatonal consult by @mayssa_dev',
                style: TextStyle(color: Colors.grey, fontSize: 8),
              ),
            ])),
      ),
    );
  }
}
