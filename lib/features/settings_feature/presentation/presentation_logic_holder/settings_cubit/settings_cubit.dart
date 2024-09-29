import 'package:bastet_app/app/usecase/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/utils/get_it_injection.dart';
import '../../../../../app/utils/handlers/error_state_handler.dart';
import '../../../../../app/utils/navigation_helper.dart';
import '../../../domain/usecases/privacy_policy_use_case.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
  static SettingsCubit get() => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);
  String? privacyPolicy;

  void getPrivacyPolicy() async {
    emit(SettingsLoading());
    final response = await getIt<GetPrivacyPolicyUseCase>()(NoParams());
    response.fold(
      errorStateHandler,
      (r) {
        privacyPolicy = r;
      },
    );
    emit(SettingsInitial());
  }
}
