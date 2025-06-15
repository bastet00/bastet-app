import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../../app/utils/consts.dart';
import '../../../../../app/utils/get_it_injection.dart';
import '../../../../../app/utils/navigation_helper.dart';
import '../../../../../app/widgets/flutter_toast.dart';
import '../../../../translation_feature/data/model/translation.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());
  static FavCubit get() => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);

  var box = Hive.box<Translation>(kFavoritesBox);
  Set<String> favoriteIds = {};
  List<Translation> favoriteTranslations = [];
  List<Translation> filteredTranslations = [];
  final searchController  = TextEditingController();

  // Load favorites from Hive box into the Set
  void getFavorites() {
    // Add all IDs of favorite translations to the Set
    favoriteIds = box.values.map((translation) => translation.id!).toSet();
    favoriteTranslations = box.values.toList();
    filteredTranslations = favoriteTranslations;
  }

  bool isFavorite(Translation translation) {
    return favoriteIds.contains(translation.id);
  }

  void toggleFav({required Translation translation, bool isFav = false}) async {
    emit(FavLoading());
    if(isFav) {
      // Remove from fav logic
      await box.delete(translation.id);
      favoriteIds.remove(translation.id);
      favoriteTranslations.remove(translation);
      showToast(msg: 'تم الحذف من المفضلة');
    } else {
      // Add to fav logic
      await box.put(translation.id, translation);
      favoriteIds.add(translation.id!);
      favoriteTranslations.add(translation);
      showToast(msg: 'تم الإضافة إلى المفضلة');
    }
    emit(FavInitial());
  }

  void filterFavorites() {
    filteredTranslations = favoriteTranslations.where((translation) {
      final egyptianSymbolUnicode  = int.parse(translation.egyptian?[0].symbol?? '', radix: 16);
      final egyptian = '${translation.egyptian?[0].word?? ''} ${String.fromCharCode(egyptianSymbolUnicode)}';
      final egyptianEnglish = translation.egyptian?[0].transliteration ?? '';
      final egyptianEnglishWithSymbol = '$egyptianEnglish ${String.fromCharCode(egyptianSymbolUnicode)}';
      final searchText = searchController.text.trim();
      
      return egyptian.contains(searchText) || 
             egyptianEnglishWithSymbol.contains(searchText);
    }).toList();
    emit(FavLoading());
    emit(FavInitial());
  }

}
