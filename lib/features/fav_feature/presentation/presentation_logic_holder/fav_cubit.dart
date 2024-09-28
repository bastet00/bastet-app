import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../app/utils/consts.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/navigation_helper.dart';
import '../../../../app/widgets/flutter_toast.dart';
import '../../../translation_feature/data/model/translation.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());
  static FavCubit get() => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);

  var box = Hive.box<Translation>(kFavoritesBox);
  Set<String> favoriteIds = {};
  List<Translation> favoriteTranslations = [];

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

}
