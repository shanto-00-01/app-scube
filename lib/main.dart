import 'package:app_scube/core/helper/all_routes.dart';
import 'package:app_scube/core/helper/navigation_service.dart';
import 'package:app_scube/core/helper/rotation_setup.dart';
import 'package:app_scube/core/helper/theme.dart';
import 'package:app_scube/scube/view/auth/login_screen.dart';
import 'package:app_scube/scube/view/dashboard/dashboard_screen.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  rotation();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return AnimateIfVisibleWrapper(
          showItemInterval: const Duration(milliseconds: 150),
          child: PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, _) async {},
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                unselectedWidgetColor: Colors.white,
                primaryColor: CustomTheme.kToDark,
                useMaterial3: false,
                scaffoldBackgroundColor: const Color(0xFFD9E4F1),
                appBarTheme: const AppBarTheme(
                  elevation: 0,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              builder: (_, child) {
                return MediaQuery(data: MediaQuery.of(context), child: child!);
              },
              navigatorKey: NavigationService.navigatorKey,
              onGenerateRoute: RouteGenerator.generateRoute,
              home: DashboardScreen(),
            ),
          ),
        );
      },
      
    );
  }
}
