import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/themes/get_theme.dart';
import 'app/utils/bloc_observer.dart';
import 'app/utils/get_it_injection.dart';
import 'app/utils/language_manager.dart';
import 'app/utils/navigation_helper.dart';
import 'features/intro_feature/presentation/screens/splash_screen.dart';
import 'features/translation_feature/presentation/presentation_logic_holder/translation_cubit/translation_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TranslationCubit>(
          create: (BuildContext context) => TranslationCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        englishLocal,
        arabicLocal,
      ],
      saveLocale: true,
      startLocale: arabicLocal,
      path: assetsPathLocalisations,
      fallbackLocale: arabicLocal,
      //
      //* ScreenUtilInit
      //
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        //
        //* MaterialApp
        //
        builder: (context, child) => MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'BASTET',
          theme: appTheme(),
          debugShowCheckedModeBanner: false,
          navigatorKey: getIt<NavHelper>().navigatorKey,
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: widget!,
            );
          },
          home: const SplashScreen(),
        ),
      ),
    );
  }
}