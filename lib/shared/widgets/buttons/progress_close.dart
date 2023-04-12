import 'package:labbaik/imports.dart';
import 'package:labbaik/shared/values/color_values.dart';

class ProgressCardCloseButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const ProgressCardCloseButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
              color: AppColors.primaryAccentColor, shape: BoxShape.circle),
          child:
              const Center(child: Icon(Icons.close, size: 20, color: Colors.white))),
    );
  }
}
