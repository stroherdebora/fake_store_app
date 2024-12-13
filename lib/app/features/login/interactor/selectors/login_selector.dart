import 'package:asp/asp.dart';

import '../atoms/login_atom.dart';

final loginSelector = selector<Map<String, dynamic>>(
  key: 'loginSelector',
  (get) {
    return {
      'email': get(emailAtom),
      'password': get(passwordAtom),
      'isLoading': get(isLoadingAtom),
      'loginSuccess': get(loginSuccessAtom),
    };
  },
);
