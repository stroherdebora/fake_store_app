import 'package:fake_store_app/app/features/home/ui/home_page.dart';
import 'package:fake_store_app/app/features/login/ui/login_page.dart';
import 'package:fake_store_app/app/features/splash/splash_screen';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/features/home/data/repositories/i_product_repository.dart';
import 'app/features/home/data/repositories/product_repository.dart';
import 'app/features/login/data/services/firebase_auth_service.dart';
import 'app/features/login/data/services/i_firebase_auth_service.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<IProductRepository>(ProductRepository.new);
    i.addSingleton<IAuthService>(FirebaseAuthService.new);

    super.binds(i);
  }

  @override
  void routes(r) {
    r.child(
      ''
      '/',
      child: (context) => const SplashScreen(),
      transition: TransitionType.downToUp,
    );
    r.child(
      '/login',
      child: (context) => const LoginPage(),
    );
    r.child(
      '/home',
      child: (context) => const HomePage(),
    );
  }
}
