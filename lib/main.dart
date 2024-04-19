import 'dart:js';

import 'package:bloc/bloc.dart';
import 'package:fatem_owner/Features/Splash/Presentation/Views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Core/bloc_observer/bloc_observer.dart';
import 'generated/l10n.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [
       // BlocProvider<>(create: (context , state)=> )
      ],
      child: const FatemOwner()));
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

}

class FatemOwner extends StatelessWidget {
  const FatemOwner({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , _){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,

          home: const SplashView(),
        );
      },
    );
  }
}


