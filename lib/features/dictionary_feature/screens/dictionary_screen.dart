import 'package:flutter/material.dart';

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
    // Load the initial category data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        DictionaryCubit.get().getCategoryWords(selectedCategory);
      }
    });
  }

  void _onCategorySelected(String categoryId) {
    setState(() {
      selectedCategory = categoryId;
    });

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
