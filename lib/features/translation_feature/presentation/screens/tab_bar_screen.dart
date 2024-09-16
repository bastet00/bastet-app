import 'package:bastet_app/features/translation_feature/presentation/screens/fav_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/image_widget.dart';
import '../widgets/drawer_widget.dart';
import 'translation_body.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> with SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C2924),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              padding: EdgeInsets.all(15.r),
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(
                Icons.menu,
              ),
              isSelected: true,
              selectedIcon: const ImageWidget(
                imageUrl: AppAssets.drawer,
              ),
            );
          },
        ),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: AppColors.secondaryColor,
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          tabs: [
            Tab(
              child: ImageWidget(
                imageUrl: AppAssets.fav,
                width: 32.w,
                height: 32.h,
              ),
            ),
            Tab(
              child: ImageWidget(
                imageUrl: AppAssets.translate,
                width: 32.w,
                height: 32.h,
              ),
            ),
          ],
        ),
      ),
      drawer: const DrawerWidget(),
      body: TabBarView(
        controller: tabController,
        children: const [
          FavBody(),
          TranslationBody(),
        ],
      ),
    );
  }
}
