import 'package:flutter/material.dart';
import 'package:asp/asp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/widgets/alert_notifier.dart';
import '../interactor/actions/login_actions.dart';
import '../interactor/atoms/login_atom.dart';
import '../interactor/selectors/login_selector.dart';

class LoginPage extends StatelessWidget with HookMixin {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    AlertNotifier.init(context);

    final loginState = useAtomState(loginSelector);
    final isLoading = loginState['isLoading'] as bool;

    AtomObserver.changes((status) {
      if (status.atom == loginSuccessAtom) {
        final loginSuccess = loginSuccessAtom.state;
        if (loginSuccess == true) {
          Modular.to.navigate('/home');
        }
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'Fake Store',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              onChanged: (value) => changeEmailAction(value),
              decoration: InputDecoration(
                hintText: 'E-mail',
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => changePasswordAction(value),
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Senha',
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () async {
                      await loginAction();
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Não tem uma conta? Cadastre-se',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
