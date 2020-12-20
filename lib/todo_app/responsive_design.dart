import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ResponsiveDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 850.9090909090909,
        allowFontScaling: true);
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RaisedButton(
          child: Text('change language'),
          onPressed: () {
            translator.setNewLanguage(
              context,
              newLanguage: translator.currentLanguage == 'ar' ? 'en' : 'ar',
              remember: true,
              restart: true,
            );
          },
        ),
        Row(
          children: [
            Text(translator.translate('name_label')),
            Text(translator.translate('name')),
          ],
        ),
        Row(
          children: [
            Text(translator.translate('address_label')),
            Text(translator.translate('city')),
          ],
        ),
        Row(
          children: [
            Text(translator.translate('un_label')),
            Text(translator.translate('unuversity')),
          ],
        )
      ],
    ));
  }
}
