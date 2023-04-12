import 'package:labbaik/imports.dart';
import 'package:labbaik/shared/constant/colors.dart';

class Button3D extends StatelessWidget {
  final String? btnTxt;
  final VoidCallback? onPress;
  final Color? color;
  final double? width;
  final double? hieght;
  final double? fontS;
  const Button3D({super.key, this.btnTxt, this.onPress, this.color, this.width, this.hieght, this.fontS});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Center(
        child: Container(
            // color: Colors.grey.shade500,
            height: hieght ?? 50,
            width: width ?? 150,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: color ?? Colors.purple.shade100,
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(4, 4),
                  ),
                  BoxShadow(
                    color: color ?? Colors.purple.shade100,
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(-4, -4),
                  )
                ]),
            child: Center(
              child: Text(
                '$btnTxt',
                style: GoogleFonts.cairo(color: color1,
                fontSize: fontS ?? 12.sp,
                ),
              ),
            )),
      ),
    );
  }
}
