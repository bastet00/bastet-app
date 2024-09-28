import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/navigation_helper.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());
  static FavCubit get() => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);

}
