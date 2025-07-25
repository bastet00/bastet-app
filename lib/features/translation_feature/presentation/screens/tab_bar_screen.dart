import 'package:bastet_app/features/dictionary_feature/screens/dictionary_screen.dart';
import 'package:bastet_app/features/fav_feature/presentation/presentation_logic_holder/fav_cubit/fav_cubit.dart';
import 'package:bastet_app/features/fav_feature/presentation/screens/fav_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/ui_helpers.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../settings_feature/presentation/widgets/drawer_widget.dart';
import 'translation_screen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 3,
      vsync: this,
    );
    tabController.addListener(_removeKeyboard);
    FavCubit.get().getFavorites();
  }

  void _removeKeyboard() {
    if (tabController.indexIsChanging) {
      UIHelpers.removeKeyboard();
    }
  }

  @override
  void dispose() {
    tabController.removeListener(_removeKeyboard);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C2924),
        actions: [
          if (context.locale.languageCode == "ar") ...[
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  icon: const Icon(
                    Icons.menu,
                  ),
                  isSelected: true,
                  selectedIcon: ImageWidget(
                    imageUrl: AppAssets.drawer,
                    width: 32.w,
                    height: 32.h,
                  ),
                );
              },
            ),
          ],
        ],
        leading: context.locale.languageCode == "en"
            ? Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Icon(
                      Icons.menu,
                    ),
                    isSelected: true,
                    selectedIcon: ImageWidget(
                      imageUrl: AppAssets.drawer,
                      width: 32.w,
                      height: 32.h,
                    ),
                  );
                },
              )
            : null,
        bottom: TabBar(
          controller: tabController,
          indicatorColor: AppColors.secondaryColor,
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          tabs: [
            Tab(
              child: ImageWidget(
                imageUrl: AppAssets.translate,
                width: 32.w,
                height: 32.h,
              ),
            ),
            Tab(
              child: ImageWidget(
                imageUrl: AppAssets.dictionary,
                width: 30.w,
                height: 30.h,
              ),
            ),
            Tab(
              child: ImageWidget(
                imageUrl: AppAssets.fav,
                width: 32.w,
                height: 32.h,
              ),
            ),
          ],
        ),
      ),
      endDrawer:
          context.locale.languageCode == "ar" ? const DrawerWidget() : null,
      drawer: context.locale.languageCode == "en" ? const DrawerWidget() : null,
      body: TabBarView(
        controller: tabController,
        children: const [
          TranslationScreen(),
          DictionaryScreen(),
          FavScreen(),
        ],
      ),
    );
  }
}
