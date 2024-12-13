import 'dart:developer';

import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/exceptions/app_exceptions.dart';
import '../../../../core/widgets/alert_notifier.dart';
import '../../data/services/i_firebase_auth_service.dart';
import '../atoms/login_atom.dart';

final changeEmailAction = atomAction1<String>(
  key: 'changeEmailAction',
  (set, email) {
    set(emailAtom, email);
  },
);

final changePasswordAction = atomAction1<String>(
  key: 'changePasswordAction',
  (set, password) {
    set(passwordAtom, password);
  },
);

final loginAction = atomAction(
  key: 'loginAction',
  (set) async {
    set(isLoadingAtom, true);

    try {
      final email = emailAtom.state;
      final password = passwordAtom.state;

      final authService = Modular.get<IAuthService>();
      final user = await authService.signInWithEmailAndPassword(email, password);

      if (user != null) {
        set(loginSuccessAtom, true);
      } else {
        throw AppExceptions('Usuário ou senha inválidos.');
      }
    } on AppExceptions catch (e) {
      log(e.toString());
      set(loginSuccessAtom, false);
      AlertNotifier.showSnackbar(
        message: e.message,
        backgroundColor: Colors.orange,
      );
    } on Exception catch (e) {
      log(e.toString());
      set(loginSuccessAtom, false);
      AlertNotifier.showSnackbar(
        message: 'Usuário ou senha inválidos.',
      );
    } finally {
      set(isLoadingAtom, false);
    }
  },
);
