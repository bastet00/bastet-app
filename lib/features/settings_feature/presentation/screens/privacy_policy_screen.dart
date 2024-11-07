import 'package:bastet_app/app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';


import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/loading.dart';
import '../presentation_logic_holder/settings_cubit/settings_cubit.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          title: 'سياسة الخصوصية', color: AppColors.primaryColor,),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsetsDirectional.all(16.r),
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return state is SettingsLoading
            ? const Loading ()
            : Center(
              child: HtmlWidget(
                SettingsCubit.get().privacyPolicy ?? 'غير موجود',
                textStyle: const TextStyle(
                  color: AppColors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
