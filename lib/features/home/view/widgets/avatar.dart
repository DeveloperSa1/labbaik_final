import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:labbaik/features/authentaction/viewModel/auth.dart';

class ProfileUI extends GetView<AuthVM> {
  final double? scale;
  final String? image;
  final Color? color;
  const ProfileUI({Key? key, this.scale = 1.2, required this.color, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.logOut();
      },
      child: Container(
          width: 40 * scale!,
          height: 40 * scale!,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: ClipOval(
              child: Image(
            fit: (scale == 1.2) ? BoxFit.cover : BoxFit.contain,
            image: NetworkImage(
              controller.appUser.value.image!,
            ),
          ))),
    );
  }
}
