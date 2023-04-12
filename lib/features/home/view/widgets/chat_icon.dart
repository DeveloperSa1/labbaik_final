import 'package:labbaik/features/messages/view/chat_list_view.dart';
import 'package:labbaik/imports.dart';
import 'package:labbaik/shared/constant/colors.dart';
import 'package:labbaik/shared/values/color_values.dart';

// ignore: must_be_immutable
class ChatIcon extends StatelessWidget {
  const ChatIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(const ChatListView());
      },
      child: Stack(children: <Widget>[
        Icon(FontAwesomeIcons.message, color: color1, size: 6.h),
        Positioned(
          top: 0.0,
          right: 0.0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: HexColor.fromHex("FF9B76")),
            child: Text('0',
                style: GoogleFonts.cairo(fontSize: 11, color: color1)),
          ),
        ),

        // style: blueText,
      ]),
    );
  }
}
