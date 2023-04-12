// ignore_for_file: must_be_immutable

import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:labbaik/features/authentaction/viewModel/auth.dart';
import 'package:labbaik/imports.dart';
import 'package:labbaik/shared/constant/colors.dart';
import 'package:labbaik/shared/constant/sizes.dart';
import 'package:labbaik/shared/constant/texts_styles.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:labbaik/shared/enums/user_type.dart';
import 'package:labbaik/shared/widgets/button_gradient.dart';

class LoginCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final UserType uType;

  LoginCard(
      {super.key,
      required this.color,
      required this.title,
      required this.icon,
      required this.uType});

  AuthVM controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: dialog,
      child: Card(
        elevation: 10,
        child: GlassContainer(
          height: 12.h,
          width: 13.h,
          gradient: gradient1,
          borderGradient: borderGradient1,
          isFrostedGlass: true,
          child: Column(
            children: [
              sizedH10,
              Icon(
                icon,
                color: color,
              ),
              sizedH10,
              Text(
                title,
                style: GoogleFonts.cairo(
                  color: color,
                ),
              ),
              sizedH10,
            ],
          ),
        ),
      ),
    );
  }

  void dialog() async {
    controller.userType = uType.obs;
    controller.update();
    PhoneNumber number = PhoneNumber(
      phoneNumber: controller.phone.value,
      dialCode: "966",
      isoCode: 'SA',
    );

    return Get.defaultDialog(
        title: UserTypeHelper.getChoosenAccountTitle(controller.userType.value),
        titleStyle: smallBlueText,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Directionality(
              textDirection: TextDirection.ltr,
              child: InternationalPhoneNumberInput(
                scrollPadding: const EdgeInsets.all(5),
              inputDecoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
                hintText: 'رقم الجوال',
                locale: 'EN',
                // countries: ['+966'],
                onInputChanged: (PhoneNumber number) async {
                  controller.phone.value = number.phoneNumber!;
                },
            
                onInputValidated: (bool value) {},
                // spaceBetweenSelectorAndTextField: 4,
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: const TextStyle(color: Colors.black),
                initialValue: number,
                // textFieldController: controller,
                formatInput: true,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputBorder: const OutlineInputBorder(),
                // onSaved: (PhoneNumber number) {
                //   String parsableNumber = number.parseNumber();
                //   controller.phone.value = parsableNumber;
                // },
              ),
            ),
            sizedH40,
            Button3D(
              btnTxt: 'تسجيل الدخول',
              onPress: () {
                print(controller.phone.value);
                print(controller.userType.value.toString());
                print(
                  '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
                );
                controller.phoneLogin();
              },
            )
          ],
        ),
        radius: 10.0);
  }
}
