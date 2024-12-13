import 'package:asp/asp.dart';

final emailAtom = atom<String>(
  key: 'emailAtom',
  '',
);

final passwordAtom = atom<String>(
  key: 'passwordAtom',
  '',
);

final isLoadingAtom = atom<bool>(
  key: 'isLoadingAtom',
  false,
);

final loginSuccessAtom = atom<bool?>(
  key: 'loginSuccessAtom',
  false,
);
