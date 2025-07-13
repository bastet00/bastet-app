import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app/utils/consts.dart';
import '../presentation/dictionary_cubit.dart';
import '../presentation/widgets/category_selector_widget.dart';
import '../presentation/widgets/dictionary_content_widget.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  String selectedCategory = "gods";

  @override
  void initState() {
    super.initState();
    _loadSelectedCategory();
  }

  Future<void> _loadSelectedCategory() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCategory = prefs.getString(kSelectedDictionaryCategory);

    if (savedCategory != null) {
      setState(() {
        selectedCategory = savedCategory;
      });
    }

    // Load the category data
    if (mounted) {
      DictionaryCubit.get().getCategoryWords(selectedCategory);
    }
  }

  Future<void> _onCategorySelected(String categoryId) async {
    setState(() {
      selectedCategory = categoryId;
    });

    // Save the selected category
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(kSelectedDictionaryCategory, categoryId);

    // Load the category data
    DictionaryCubit.get().getCategoryWords(categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategorySelectorWidget(
          selectedCategory: selectedCategory,
          onCategorySelected: _onCategorySelected,
        ),
        const Expanded(
          child: DictionaryContentWidget(),
        ),
      ],
    );
  }
}
