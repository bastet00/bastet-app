import 'package:bastet_app/features/translation_feature/presentation/widgets/translation_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/loading.dart';
import '../presentation/dictionary_cubit.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  String selectedCategory = "gods";

  final List<Map<String, dynamic>> categories = [
    {"id": "gods", "arabic": "آلهة", "english": "gods"},
    {"id": "numbers", "arabic": "أرقام", "english": "numbers"},
    {"id": "family", "arabic": "عائلة", "english": "family"},
    {"id": "animals", "arabic": "حيوانات", "english": "animals"},
    {"id": "colors", "arabic": "ألوان", "english": "colors"},
    {"id": "food", "arabic": "طعام", "english": "food"},
    {"id": "body", "arabic": "جسم", "english": "body"},
    {"id": "symbols", "arabic": "رموز", "english": "symbols"},
    {"id": "greetings", "arabic": "تحيات", "english": "greetings"},
    {"id": "time", "arabic": "وقت", "english": "time"},
    {"id": "nature", "arabic": "طبيعة", "english": "nature"},
    {"id": "emotions", "arabic": "مشاعر", "english": "emotions"},
    {"id": "clothes", "arabic": "ملابس", "english": "clothes"},
    {"id": "music", "arabic": "موسيقى", "english": "music"},
    {"id": "home", "arabic": "منزل", "english": "home"},
    {"id": "stones", "arabic": "أحجار", "english": "stones"},
    {"id": "temples", "arabic": "معابد", "english": "temples"},
    {"id": "jobs", "arabic": "وظائف", "english": "jobs"},
    {"id": "adjective", "arabic": "صفات", "english": "adjective"},
    {"id": "verb", "arabic": "افعال", "english": "verb"},
    {
      "id": "words_in_egyptian_dialect",
      "arabic": "كلمات في العامية",
      "english": "words in egyptians dialect"
    },
    {"id": "prepositions", "arabic": "حروف الجر", "english": "prepositions"},
    {"id": "insects", "arabic": "حشرات", "english": "insects"},
    {"id": "measurements", "arabic": "قياسات", "english": "measurements"},
    {"id": "countries", "arabic": "دول", "english": "countries"},
    {
      "id": "egyptian_cities_provinces",
      "arabic": "مدن و محافظات",
      "english": "cities and provinces"
    },
    {
      "id": "fruits_vegetables",
      "arabic": "فواكه و خضراوات",
      "english": "fruits and vegetables"
    },
    {"id": "plants", "arabic": "نباتات", "english": "plants"},
    {"id": "cosmos", "arabic": "الكون", "english": "cosmos"},
    {"id": "female_names", "arabic": "أسماء إناث", "english": "female names"},
    {"id": "male_names", "arabic": "أسماء ذكور", "english": "male names"},
    {
      "id": "kings_queens",
      "arabic": "ملوك و ملكات",
      "english": "kings and queens"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DictionaryCubit, DictionaryState>(
      builder: (context, state) {
        final cubit = DictionaryCubit.get();

        // Load category words when the screen is first built
        if (cubit.categoryTranslations.isEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            cubit.getCategoryWords(selectedCategory);
          });
        }

        return Column(
          children: [
            // Category Selection
            Container(
              height: 50.h,
              margin: EdgeInsets.symmetric(vertical: 16.h),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected = selectedCategory == category["id"];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category["id"]!;
                      });
                      cubit.getCategoryWords(selectedCategory);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 12.w),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3D3525),
                        borderRadius: BorderRadius.circular(25.r),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFFE0B85B)
                              : Colors.transparent,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          context.locale.languageCode == "ar"
                              ? category["arabic"]
                              : category["english"],
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFB1975C),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Content
            Expanded(
              child: state is DictionaryLoading
                  ? const Loading()
                  : cubit.categoryTranslations.isEmpty
                      ? Center(
                          child: Text(
                            'لا توجد ترجمات لهذه الفئة',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return TranslationWidget(
                                translation: cubit.categoryTranslations[index],
                              );
                            },
                            itemCount: cubit.categoryTranslations.length,
                            separatorBuilder: (context, index) =>
                                10.verticalSpace,
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.only(bottom: 20.h),
                          ),
                        ),
            ),
          ],
        );
      },
    );
  }
}
