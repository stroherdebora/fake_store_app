import 'package:flutter_modular/flutter_modular.dart';

import 'splash_screen';

class SplashModule extends Module {
  List<ModularRoute> getRoutes() {
    return [
      ChildRoute(
        '/',
        child: (context) => const SplashScreen(),
      ),
    ];
  }
}
