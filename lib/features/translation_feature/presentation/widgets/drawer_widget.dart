import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                    onTap: () {},
                  ),
                  ListTileWidget(
                    leadingUrl: AppAssets.rate,
                    title: 'قيم التطبيق',
                    onTap: () {},
                  ),
                  ListTileWidget(
                    leadingUrl: AppAssets.privacy,
                    title: 'سياسة الخصوصية',
                    onTap: () {},
                  ),
                  ListTileWidget(
                    leadingUrl: AppAssets.idea,
                    title: 'اقترح فكرتك',
                    onTap: () {},
                  ),
                  ListTileWidget(
                    leadingUrl: AppAssets.contact,
                    title: 'اتصل بنا',
                    onTap: () {},
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
