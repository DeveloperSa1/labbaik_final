
import 'package:labbaik/imports.dart';
import 'package:labbaik/shared/constant/colors.dart';

class TimelineAddButton extends StatelessWidget {
  final VoidCallback? iconTapped;
  const TimelineAddButton({
    Key? key,
    this.iconTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: iconTapped,
      child: Container(
          width: 50,
          height: 50,
          decoration:
              const BoxDecoration(color: LightColors.kBlue, shape: BoxShape.circle),
          child: const Icon(Icons.add, color: Colors.white)),
    );
  }
}

class DashboardAddButton extends StatelessWidget {
  final VoidCallback? iconTapped;
  const DashboardAddButton({
    Key? key,
    this.iconTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: iconTapped,
      child: Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(color: white, shape: BoxShape.circle),
          child: Icon(FontAwesomeIcons.message,
              color: kBlueDark.withOpacity(0.9))),
    );
  }
}
