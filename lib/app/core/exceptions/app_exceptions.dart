class AppExceptions implements Exception {
  final String message;
  AppExceptions(this.message);

  @override
  String toString() => 'AppExceptions: $message';
}
