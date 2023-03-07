import 'package:michele_s_application8/presentation/splash_screen_one_screen/splash_screen_one_screen.dart';
import 'package:michele_s_application8/presentation/splash_screen_one_screen/binding/splash_screen_one_binding.dart';
import 'package:michele_s_application8/presentation/login_screen/login_screen.dart';
import 'package:michele_s_application8/presentation/login_screen/binding/login_binding.dart';
import 'package:michele_s_application8/presentation/abilita_disabilita_classe_two_screen/abilita_disabilita_classe_two_screen.dart';
import 'package:michele_s_application8/presentation/abilita_disabilita_classe_two_screen/binding/abilita_disabilita_classe_two_binding.dart';
import 'package:michele_s_application8/presentation/abilita_disabilita_classe_screen/abilita_disabilita_classe_screen.dart';
import 'package:michele_s_application8/presentation/abilita_disabilita_classe_screen/binding/abilita_disabilita_classe_binding.dart';
import 'package:michele_s_application8/presentation/abilita_disabilita_classe_one_screen/abilita_disabilita_classe_one_screen.dart';
import 'package:michele_s_application8/presentation/abilita_disabilita_classe_one_screen/binding/abilita_disabilita_classe_one_binding.dart';
import 'package:michele_s_application8/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:michele_s_application8/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreenOneScreen = '/splash_screen_one_screen';

  static const String loginScreen = '/login_screen';

  static const String abilitaDisabilitaClasseTwoScreen =
      '/abilita_disabilita_classe_two_screen';

  static const String abilitaDisabilitaClasseScreen =
      '/abilita_disabilita_classe_screen';

  static const String abilitaDisabilitaClasseOneScreen =
      '/abilita_disabilita_classe_one_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreenOneScreen,
      page: () => SplashScreenOneScreen(),
      bindings: [
        SplashScreenOneBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: abilitaDisabilitaClasseTwoScreen,
      page: () => AbilitaDisabilitaClasseTwoScreen(),
      bindings: [
        AbilitaDisabilitaClasseTwoBinding(),
      ],
    ),
    GetPage(
      name: abilitaDisabilitaClasseScreen,
      page: () => AbilitaDisabilitaClasseScreen(),
      bindings: [
        AbilitaDisabilitaClasseBinding(),
      ],
    ),
    GetPage(
      name: abilitaDisabilitaClasseOneScreen,
      page: () => AbilitaDisabilitaClasseOneScreen(),
      bindings: [
        AbilitaDisabilitaClasseOneBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreenOneScreen(),
      bindings: [
        SplashScreenOneBinding(),
      ],
    )
  ];
}
