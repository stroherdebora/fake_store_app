import 'package:fake_store_app/app/features/home/ui/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  List<ModularRoute> getRoutes() {
    return [
      ChildRoute(
        '/home',
        child: (context) => const HomePage(),
      ),
    ];
  }
}
