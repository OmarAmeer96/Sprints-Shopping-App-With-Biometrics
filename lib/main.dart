import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprint_shopping_app_with_bioetrics/core/di/dependency_injection.dart';
import 'package:sprint_shopping_app_with_bioetrics/core/helpers/constants.dart';
import 'package:sprint_shopping_app_with_bioetrics/core/helpers/extensions.dart';
import 'package:sprint_shopping_app_with_bioetrics/core/helpers/shared_pref_helper.dart';
import 'package:sprint_shopping_app_with_bioetrics/core/helpers/simple_bloc_observer.dart';
import 'package:sprint_shopping_app_with_bioetrics/core/routing/app_router.dart';
import 'package:sprint_shopping_app_with_bioetrics/pixels_app.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
  ));

  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  Bloc.observer = SimpleBlocObserver();
  await ScreenUtil.ensureScreenSize();

  // Check if the user is logged in or not
  await checkIfUserIsLoggedIn();

  runApp(
    PixelsApp(
      appRouter: AppRouter(),
    ),
  );
}

// Check if the user is logged in or not
Future<void> checkIfUserIsLoggedIn() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  debugPrint('User Token: $userToken');
  if (userToken.isNullOrEmpty()) {
    isUserLoggedIn = false;
  } else {
    isUserLoggedIn = true;
  }
  debugPrint('Is User Logged In: $isUserLoggedIn');
}
