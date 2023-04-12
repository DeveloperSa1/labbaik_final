import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:gsform/gs_form/core/form_style.dart';
import 'package:gsform/gs_form/enums/field_status.dart';
import 'package:gsform/gs_form/model/data_model/date_data_model.dart';
import 'package:gsform/gs_form/model/data_model/spinner_data_model.dart';
import 'package:gsform/gs_form/widget/field.dart';
import 'package:gsform/gs_form/widget/form.dart';
import 'package:labbaik/features/authentaction/view/splash.dart';
import 'package:labbaik/features/home/viewModel/home.dart';
import 'package:labbaik/imports.dart';
import 'package:labbaik/shared/constant/colors.dart';
import 'package:labbaik/shared/constant/sizes.dart';
import 'package:labbaik/shared/constant/texts_styles.dart';
import 'package:labbaik/shared/enums/user_type.dart';
import 'package:labbaik/shared/helpers/sizes_extension.dart';
import 'package:labbaik/shared/widgets/button_gradient.dart';
import 'package:labbaik/shared/widgets/gradient_text.dart';
import 'package:select_card/select_card.dart';

class AddDialog extends StatelessWidget {
  final homeCtrl = Get.find<HomeVM>();
  AddDialog({super.key});
  @override
  Widget build(BuildContext context) {
    late GSForm form;
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(
        () => Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                body: Form(
                    child: ListView(children: [
              sizedH10,
              BackButton(
                onPressed: () {
                  Get.offAll(() => SplashScreen());
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                child: EasyStepper(
                  enableStepTapping: false,
                  activeStep: homeCtrl.activeIndex.value,
                  lineLength: 30,
                  lineDotRadius: 3,
                  lineSpace: 0,
                  lineType: LineType.normal,
                  defaultLineColor: Colors.indigo.shade300,
                  borderThickness: 10,
                  internalPadding: 15,
                  textDirection: TextDirection.rtl,
                  // loadingAnimation: 'assets/loading_circle.json',
                  steps: [
                    EasyStep(
                      customTitle: GradientText(
                          style: GoogleFonts.cairo(
                              fontSize: 9, fontWeight: FontWeight.bold),
                          'حدد المستخدم   ',
                          gradient: gradient3),
                      icon: const Icon(FontAwesomeIcons.userGroup),
                      title: 'نوع المستخدم',
                      lineText: '',
                    ),
                    EasyStep(
                      customTitle: GradientText(
                          style: GoogleFonts.cairo(
                              fontSize: 9, fontWeight: FontWeight.bold),
                          'بيانات المستخدم  ',
                          gradient: gradient3),
                      icon: const Icon(FontAwesomeIcons.filePen),
                      lineText: '',
                    ),
                    EasyStep(
                      customTitle: GradientText(
                          style: GoogleFonts.cairo(
                              fontSize: 9, fontWeight: FontWeight.bold),
                          ' تم اضافه بنجاح',
                          gradient: gradient3),
                      icon: const Icon(FontAwesomeIcons.userCheck),
                      lineText: '',
                    ),
                  ],
                  onStepReached: (index) {
                    if (homeCtrl.changeStepIndex(index)) {
                      homeCtrl.changeStepIndex(index);
                    } else {
                      EasyLoading.showError('اكمل الخطوه السابقه اولاَ');
                    }
                  },
                ),
              ),
              homeCtrl.activeIndex.value == 0
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 23.0, vertical: 24),
                        child: SelectGroupCard(context,
                            titles: const ['طالب', 'إخصائية', 'معلمة'],
                            radius: 1,
                            cardBackgroundColor: white,
                            cardSelectedColor: color1,
                            titleTextColor: Colors.blue.shade900,
                            contentTextColor: Colors.black87, onTap: (title) {
                          homeCtrl.updateForm(title);
                          homeCtrl.changeStepIndex(1);
                          debugPrint(title);
                        }),
                      ),
                    )
                  : _buildHeader(),
              homeCtrl.userType.value == UserType.undefiend
                  ? Column(children: [
                      Image.asset('assets/images/Labbaik.png',
                          fit: BoxFit.cover, width: 65.0.wp),
                      Text(
                        'لم يتم تحديد مستخدم',
                        style: GoogleFonts.changa(
                            fontWeight: FontWeight.bold, fontSize: 16.0.sp),
                      ),
                    ])
                  : form = GSForm.singleSection(context,
                      style: style(),
                      fields: homeCtrl.userType.value == UserType.guardian
                          ? studentFields()
                          : _buildListForms(context)),
              _buildButton(() {
                bool v = form.isValid();
                print(v);
                Map<String, dynamic> newData = form.onSubmit();
                homeCtrl.updateData(newData);
                print(newData.toString());
                homeCtrl.changeStepIndex(2);
              }),
              sizedH10,
            ])))),
      ),
    );
  }

  Widget _buildHeader() {
    String title = homeCtrl.userType.value == UserType.guardian
        ? 'تسجيل طالب جديد '
        : homeCtrl.userType.value == UserType.specialest
            ? 'تسجيل الاخصائيه'
            : 'تسجيل المعلمة';
    return Center(
      child: GlassContainer(
        height: 10.h,
        width: 50.h,
        isFrostedGlass: true,
        frostedOpacity: 0.3,
        gradient: gradient1,
        borderGradient: gradient3,
        borderRadius: BorderRadius.circular(10),
        child: Align(
          alignment: Alignment.center,
          child: GradientText('$title',
              style: GoogleFonts.changa(
                fontSize: 16.sp,
              ),
              gradient: greyGradient),
        ),
      ),
    );
  }

  Widget _buildButton(VoidCallback onSubmit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        sizedW10,
        Button3D(
          btnTxt: 'تغيير المستخدم',
          onPress: () {},
          width: 80,
          fontS: 7.sp,
        ),
        Button3D(
          btnTxt: 'اكمال',
          onPress: onSubmit,
          width: 70,
          fontS: 9.sp,
        ),
        sizedW10,
      ],
    );
  }

  List<Widget> _buildListForms(context) {
    // ignore: unused_local_variable
    late GSForm form;

    return [
      GSField.text(
        status: GSFieldStatusEnum.normal,
        tag: '',
        title: 'الأسم الأول',
        minLine: 1,
        maxLine: 1,
        weight: 6,
        hint: 'الاسم الاول',
        value: homeCtrl.firstName.value,
        required: true,
        errorMessage: 'الاسم الاول مطلوب',
      ),
      GSField.text(
        status: GSFieldStatusEnum.normal,
        tag: '',
        title: 'العائلة',
        minLine: 1,
        maxLine: 1,
        weight: 6,
        // hint: 'الاسم الثاني',
        value: homeCtrl.lastName.text,
        required: true,
        errorMessage: 'الاسم الثاني مطلوب',
      ),
      GSField.mobile(
        tag: 'رقم الجوال',
        errorMessage: 'خطاء',
        // hint: 'رقم الجوال',
        helpMessage: 'help message',
        title: 'رقم الجوال',
        maxLength: 11,
        postfixWidget: const Icon(Icons.mobile_friendly),
        // prefixWidget: widget,
        // validateRegEx: regex,
        weight: 12,
        required: true,
      ),
      sizedH10,
      GSField.number(
        tag: 'الخبره',
        title: 'سنوات الخبره',
        weight: 12,
        maxLength: 11,
        required: true,
        errorMessage: 'خطاء',
        helpMessage: 'اقل من 10',
      ),

      // GSField.datePicker(
      //   tag: 'licenceExpireDate',
      //   title: 'Birth Date',
      //   weight: 12,
      //   required: true,
      //   postfixWidget: const Icon(
      //     Icons.calendar_month,
      //     color: Color(0xff676767),
      //   ),
      //   displayDateType: GSDateFormatType.numeric,
      //   calendarType: GSCalendarType.gregorian,
      // ),
      // GSField.spinner(
      //   tag: 'customer_type',
      //   required: false,
      //   weight: 12,
      //   title: 'Gender',
      //   items: [
      //     SpinnerDataModel(
      //       name: 'man',
      //       id: 1,
      //     ),
      //     SpinnerDataModel(
      //       name: 'woman',
      //       id: 2,
      //     ),
      //   ],
      // ),
      // GSField.checkList(
      //   hint: 'CheckBox List',
      //   tag: 'check',
      //   showScrollBar: true,
      //   scrollBarColor: Colors.red,
      //   height: 200,
      //   scrollable: true,
      //   requiredCheckListEnum: RequiredCheckListEnum.none,
      //   weight: 12,
      //   title: 'Size number',
      //   searchable: true,
      //   searchHint: 'Search...',
      //   searchIcon: const Icon(Icons.search),
      //   searchBoxDecoration: BoxDecoration(
      //     border: Border.all(
      //       color: Colors.blue,
      //       width: 1,
      //     ),
      //     borderRadius: BorderRadius.circular(8),
      //   ),
      //   items: [
      //     CheckDataModel(title: 'checkbox  ', isSelected: true),
      //     CheckDataModel(title: 'ipsum', isSelected: false),
      //     CheckDataModel(title: 'item', isSelected: true),
      //     CheckDataModel(title: 'size', isSelected: false),
      //     CheckDataModel(title: 'size 1', isSelected: false),
      //     CheckDataModel(title: 'size 2', isSelected: false),
      //     CheckDataModel(title: 'sample 1', isSelected: false),
      //     CheckDataModel(title: 'Sample 2', isSelected: false),
      //     CheckDataModel(title: 'Radio', isSelected: false),
      //     CheckDataModel(title: 'Tv', isSelected: false),
      //     CheckDataModel(title: 'data 1', isSelected: false),
      //     CheckDataModel(title: 'data 2', isSelected: false),
      //   ],
      //   callBack: (data) {},
      // ),

      GSField.textPlain(
        tag: 'explain',
        title: 'اخرى',
        weight: 12,
        maxLength: 150,
        required: false,
      ),
      // GSField.imagePicker(
      //   tag: 'multi',
      //   required: false,
      //   title: 'إضافه صورة ',
      //   iconWidget: const Icon(Icons.add),
      //   showCropper: false,

      //   onErrorSizeItem: () {
      //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //       content: Text("maximum size exception"),
      //     ));
      //   },
      // ),
    ];
  }

  List<Widget> studentFields() {
    return [
      GSField.text(
        status: GSFieldStatusEnum.normal,
        tag: '',
        title: 'الأسم الأول',
        minLine: 1,
        maxLine: 1,
        weight: 6,
        hint: 'الاسم الاول',
        value: homeCtrl.firstName.value,
        required: true,
        errorMessage: 'الاسم الاول مطلوب',
      ),

      GSField.text(
        status: GSFieldStatusEnum.normal,
        tag: '',
        title: 'العائلة',
        minLine: 1,
        maxLine: 1,
        weight: 6,
        // hint: 'الاسم الثاني',
        value: homeCtrl.lastName.text,
        required: true,
        errorMessage: 'الاسم الثاني مطلوب',
      ),
      GSField.text(
        status: GSFieldStatusEnum.normal,
        tag: 'diagnose',
        title: 'التشخيص',
        minLine: 1,
        maxLine: 1,
        weight: 6,
        // hint: 'الاسم الثاني',
        value: homeCtrl.lastName.text,
        required: true,
        // errorMessage: 'الاسم الثاني مطلوب',
      ),
      GSField.spinner(
        tag: '',
        required: false,
        weight: 10,
        title: 'جنس الطالب',
        items: [
          SpinnerDataModel(
            name: 'ذكر',
            id: 1,
          ),
          SpinnerDataModel(
            name: 'انثى',
            id: 2,
          ),
        ],
      ),
      GSField.datePicker(
        calendarType: GSCalendarType.gregorian,
        tag: 'licenceExpireDate',
        title: 'تاريخ الميلاد',
        weight: 12,
        required: true,
        postfixWidget: const Icon(
          Icons.calendar_month,
          color: Color(0xff676767),
        ),
        displayDateType: GSDateFormatType.numeric,
      ),

      GSField.text(
        status: GSFieldStatusEnum.normal,
        tag: '',
        title: 'اسم ولي الامر',
        minLine: 1,
        maxLine: 1,
        weight: 6,
        hint: 'الاسم الاول',
        value: homeCtrl.firstName.value,
        required: true,
        errorMessage: 'الاسم الاول مطلوب',
      ),
      GSField.text(
        status: GSFieldStatusEnum.normal,
        tag: '',
        title: 'العائلة',
        minLine: 1,
        maxLine: 1,
        weight: 6,
        // hint: 'الاسم الثاني',
        value: homeCtrl.lastName.text,
        required: true,
        errorMessage: 'الاسم الثاني مطلوب',
      ),
      GSField.mobile(
        tag: 'رقم الجوال',
        errorMessage: 'خطاء',
        // hint: 'رقم الجوال',
        helpMessage: 'help message',
        title: 'رقم الجوال',
        maxLength: 11,
        postfixWidget: const Icon(Icons.mobile_friendly),
        // prefixWidget: widget,
        // validateRegEx: regex,
        weight: 12,
        required: true,
      ),

      // GSField.datePicker(
      //   tag: 'licenceExpireDate',
      //   title: 'Birth Date',
      //   weight: 12,
      //   required: true,
      //   postfixWidget: const Icon(
      //     Icons.calendar_month,
      //     color: Color(0xff676767),
      //   ),
      //   displayDateType: GSDateFormatType.numeric,
      //   calendarType: GSCalendarType.gregorian,
      // ),
      // GSField.spinner(
      //   tag: 'customer_type',
      //   required: false,
      //   weight: 12,
      //   title: 'Gender',
      //   items: [
      //     SpinnerDataModel(
      //       name: 'man',
      //       id: 1,
      //     ),
      //     SpinnerDataModel(
      //       name: 'woman',
      //       id: 2,
      //     ),
      //   ],
      // ),
      // GSField.checkList(
      //   hint: 'CheckBox List',
      //   tag: 'check',
      //   showScrollBar: true,
      //   scrollBarColor: Colors.red,
      //   height: 200,
      //   scrollable: true,
      //   requiredCheckListEnum: RequiredCheckListEnum.none,
      //   weight: 12,
      //   title: 'Size number',
      //   searchable: true,
      //   searchHint: 'Search...',
      //   searchIcon: const Icon(Icons.search),
      //   searchBoxDecoration: BoxDecoration(
      //     border: Border.all(
      //       color: Colors.blue,
      //       width: 1,
      //     ),
      //     borderRadius: BorderRadius.circular(8),
      //   ),
      //   items: [
      //     CheckDataModel(title: 'checkbox  ', isSelected: true),
      //     CheckDataModel(title: 'ipsum', isSelected: false),
      //     CheckDataModel(title: 'item', isSelected: true),
      //     CheckDataModel(title: 'size', isSelected: false),
      //     CheckDataModel(title: 'size 1', isSelected: false),
      //     CheckDataModel(title: 'size 2', isSelected: false),
      //     CheckDataModel(title: 'sample 1', isSelected: false),
      //     CheckDataModel(title: 'Sample 2', isSelected: false),
      //     CheckDataModel(title: 'Radio', isSelected: false),
      //     CheckDataModel(title: 'Tv', isSelected: false),
      //     CheckDataModel(title: 'data 1', isSelected: false),
      //     CheckDataModel(title: 'data 2', isSelected: false),
      //   ],
      //   callBack: (data) {},
      // ),
      //
      //    //

      GSField.textPlain(
        tag: 'explain',
        title: 'ملاحضات اخرى ',
        weight: 12,
        maxLength: 150,
        required: false,
      ),
      // GSField.imagePicker(
      //   tag: 'multi',
      //   required: false,
      //   title: 'إضافه صورة ',
      //   iconWidget: const Icon(Icons.add),
      //   showCropper: false,

      //   onErrorSizeItem: () {
      //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //       content: Text("maximum size exception"),
      //     ));
      //   },
      // ),
    ];
  }

  GSFormStyle style() {
    return GSFormStyle(
        backgroundFieldColor: kBlueLight,
        backgroundSectionColor: kBlueDark,
        sectionCardElevation: 0,
        titleStyle: GoogleFonts.changa(
          color: black,
        ),
        fieldHintStyle: grayText,
        fieldTextStyle: blackText,
        sectionRadius: 10.0,
        errorTextStyle: grayText,
        fieldRadius: 5,
        helpTextStyle: grayText,
        // requiredText: GSFieldRequireTypeEnum, //text, star
        sectionCardPadding: 8.0,
        requiredText: '(مطلوب)');
  }
}
