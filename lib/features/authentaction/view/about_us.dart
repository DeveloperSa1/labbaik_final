import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labbaik/shared/constant/colors.dart';
import 'package:labbaik/shared/constant/sizes.dart';
import 'package:labbaik/shared/widgets/logo_image.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: color1,
          title: Text('عن المركز',
          style: GoogleFonts.tajawal(
            color : white,
          ),),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              children: [
                sizedH40,
                const LogoImage(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpansionPanelList(
                    elevation: 3,
                    // Controlling the expansion behavior
                    expansionCallback: (index, isExpanded) {
                      setState(() {
                        itemData[index].expanded = !itemData[index].expanded;
                      });
                    },
                    animationDuration: const Duration(milliseconds: 600),
                    children: itemData
                        .map(
                          (item) => ExpansionPanel(
                            canTapOnHeader: true,
                            backgroundColor: item.expanded == true
                                ? Colors.indigo[100]
                                : Colors.white,
                            headerBuilder: (_, isExpanded) => Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 30),
                                child: Text(
                                  item.headerItem,
                                  style: const TextStyle(fontSize: 27),
                                )),
                            body: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 30),
                             
                                child: Container(
                                  child: item.discription,
                                )
                              
    
                                ),
                            isExpanded: item.expanded,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

  List<ItemModel> itemData = <ItemModel>[
    ItemModel(
      headerItem: 'اهدافنا',
      discription: // discription = النص
          Column(
        children: const [
          UnorderedList([
            "  1. تقييم الأفراد من مختلف الأعمار للتعريف على قدراتهم وإمكانياتهم باستخدام بطاريه اختبارات متنوعة وموثوقة.  ",
            "  2. تقديم خدمات الإرشاد والتوجيه المناسب لكل حالة.  ",
            "  3. تقديم خدمات العلاج التربوي عن طريق الجلسات الفردية والجماعية.  ",
            "  4. تقديم خدمات المتابعة للوالدين والمعلمين للتاكيد من استفادة الطلاب من التوصيات والبرامج العلاجية المقترحة.  ",
            "  5. التواصل مع المختصين في المدارس والمراكز الأخرى لتطبيق الإرشادات والتوصيات المقترحة في الخطط العلاجية.  "
          ]),
        ],
      ),
      colorsItem: Colors.lightBlueAccent,
      img: "assests/images/Labbaik.png",
    ),
    ItemModel(
      headerItem: 'رؤيتنا',
      discription: const Text(
        '  أن نكون الجهة التي يلجأ إليها الأفراد والأسر للتعامل مع مشكلات الحياة اليومية المعاصرة  ',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      colorsItem: Colors.lightBlueAccent,
      img: "assests/images/Labbaik.png",
    ),
    ItemModel(
      headerItem: 'رسالتنا',
      discription: const Text(
        '  نستمع إليكم ونلبي أحتياجاتكم ونتهرف على قدراتكم ونمضي معا نحو تحقيق الأهداف التعليمية والتربوية  ',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      colorsItem: Colors.lightBlueAccent,
      img: "assests/images/Labbaik.png",
    ),
    ItemModel(
      headerItem: 'عنواننا',
      discription: const Text(
        ''
        '  جدة/حي الفيصلية شارع الإمام عبدالعزيز بجوار مجمع الفيصلية السكني  ',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      colorsItem: Colors.lightBlueAccent,
      img: "assests/images/Labbaik.png",
    ),
  ];
}

class UnorderedList extends StatelessWidget {
  const UnorderedList(this.texts, {super.key});
  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in texts) {
      // Add list item
      widgetList.add(UnorderedListItem(text));
      // Add space between items
      widgetList.add(const SizedBox(height: 5.0));
    }

    return Column(children: widgetList);
  }
}

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //  Text("• "),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ItemModel {
  bool expanded;
  String headerItem;
  Widget discription;
  Color colorsItem;
  String img;

  ItemModel(
      {this.expanded = false,
      required this.headerItem,
      required this.discription,
      required this.colorsItem,
      required this.img});
}
