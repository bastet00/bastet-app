import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/list_tile_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            45.verticalSpace,
            ImageWidget(
              imageUrl: AppAssets.logo,
              width: 60.w,
              height: 100.h,
            ),
            45.verticalSpace,
            const Divider(),
            30.verticalSpace,
            Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: Column(
                children: [
                  ListTileWidget(
                    leadingUrl: AppAssets.share,
                    title: 'شارك التطبيق',
                    onTap: () {
                      // TODO: Add App Link
                      const String appLink = 'App Link here';
                      Clipboard.setData(const ClipboardData(text: appLink));
                      Share.share(appLink);
                    },
                  ),
                  ListTileWidget(
                    leadingUrl: AppAssets.rate,
                    title: 'قيم التطبيق',
                    onTap: () async {
                      // TODO: Add App Link
                      if (!await launchUrl(Uri.parse(
                          "https://play.google.com/store/apps/details?id=com.google.android.apps.translate"))) {
                        throw Exception('Could not launch url');
                      }
                    },
                  ),
                  ListTileWidget(
                    leadingUrl: AppAssets.privacy,
                    title: 'سياسة الخصوصية',
                    onTap: () {},
                  ),
                  ListTileWidget(
                    leadingUrl: AppAssets.idea,
                    title: 'اقترح فكرتك',
                    onTap: () async {
                      // email
                      if (!await launchUrl(Uri.parse(
                      "mailto:contact@bastet-app.com"))) {
                      throw Exception('Could not launch url');
                      }
                    },
                  ),
                  ListTileWidget(
                    leadingUrl: AppAssets.contact,
                    title: 'اتصل بنا',
                    onTap: () async {
                      // email
                      if (!await launchUrl(Uri.parse(
                      "mailto:contact@bastet-app.com"))) {
                      throw Exception('Could not launch url');
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
