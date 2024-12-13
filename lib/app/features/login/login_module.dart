import 'package:fake_store_app/app/features/login/ui/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  List<ModularRoute> getRoutes() {
    return [
      ChildRoute(
        '/login',
        child: (context) => const LoginPage(),
      ),
    ];
  }
}
