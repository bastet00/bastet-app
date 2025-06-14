import 'package:bastet_app/app/utils/app_colors.dart';
import 'package:bastet_app/app/utils/helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_strings.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/list_tile_widget.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../screens/privacy_policy_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            45.verticalSpace,
            Center(
              child: ImageWidget(
                imageUrl: AppAssets.logo,
                width: 60.w,
                height: 100.h,
              ),
            ),
            45.verticalSpace,
            const Divider(),
            30.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  ListTileWidget(
                    leadingUrl: AppAssets.share,
                    title: AppStrings.shareApp.tr(),
                    onTap: () {
                      const String appLink =
                          'https://play.google.com/store/apps/details?id=com.bastet.bastet_app';
                      Clipboard.setData(const ClipboardData(text: appLink));
                      Share.share(appLink);
                    },
                  ),
                  ListTileWidget(
                    leadingUrl: AppAssets.rate,
                    title: AppStrings.rateApp.tr(),
                    onTap: () async {
                      if (!await launchUrl(Uri.parse(
                          "https://play.google.com/store/apps/details?id=com.bastet.bastet_app"))) {
                        throw Exception('Could not launch url');
                      }
                    },
                  ),
                  ListTileWidget(
                    leadingUrl: AppAssets.privacy,
                    title: AppStrings.privacyPolicy.tr(),
                    onTap: () => navigateTo(const PrivacyPolicyScreen()),
                  ),
                  ListTileWidget(
                    leadingUrl: AppAssets.idea,
                    title: AppStrings.suggestIdea.tr(),
                    onTap: () async {
                      // email
                      if (!await launchUrl(Uri.parse(
                          "mailto:contact@bastet-app.com?subject=اقتراح فكرة"
                          "&body=للتواصل مع  باستيت 𓃠\nالموضوع:\n\nرقم الهاتف:\n\nالاسم:"))) {
                        throw Exception('Could not launch url');
                      }
                    },
                  ),
                  ListTileWidget(
                    leadingUrl: AppAssets.contact,
                    title: AppStrings.contactUs.tr(),
                    onTap: () async {
                      // email
                      if (!await launchUrl(Uri.parse(
                          "mailto:contact@bastet-app.com?subject=تواصل مع الفريق"
                          "&body=للتواصل مع  باستيت 𓃠\nالموضوع:\n\nرقم الهاتف:\n\nالاسم:"))) {
                        throw Exception('Could not launch url');
                      }
                    },
                  ),
                  ListTileWidget(
                    leadingUrl: AppAssets.donation,
                    title: AppStrings.donate.tr(),
                    onTap: () async {
                      if (!await launchUrl(Uri.parse(
                          "https://www.paypal.com/donate/?hosted_button_id=AV9XQGBF9CQMW"))) {
                        throw Exception('Could not launch url');
                      }
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 10.h,
              ),
              child: CustomTextButton(
                onPressed: () {
                  context.locale.languageCode=="en"
                  ? context.setLocale(const Locale('ar'))
                  : context.setLocale(const Locale('en'));
                  goBack();
                },
                title: context.locale.languageCode=="en"
                  ? AppStrings.arabic : AppStrings.english,
                titleColor: AppColors.white,
                color: AppColors.white,
                borderRadius: 8.r,
                outlined: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
