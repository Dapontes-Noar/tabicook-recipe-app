class HiveException implements Exception {
  final String message;

  HiveException(this.message);

  static const String _boxNotFound = 'Hive box not found';
  static const String _getAllFailed = 'Failed to get all values from Hive box';
  static const String _getValueFailed = 'Failed to get value from Hive box';
  static const String _putValueFailed = 'Failed to put value into Hive box';
  static const String _deleteValueFailed =
      'Failed to delete value from Hive box';
  static const String _existsCheckFailed =
      'Failed to check existence in Hive box';

  factory HiveException.boxNotFound([String? info]) =>
      HiveException(info == null ? _boxNotFound : '$_boxNotFound: $info');

  factory HiveException.getAllFailed([String? info]) =>
      HiveException(info == null ? _getAllFailed : '$_getAllFailed: $info');

  factory HiveException.getValueFailed([String? info]) =>
      HiveException(info == null ? _getValueFailed : '$_getValueFailed: $info');

  factory HiveException.putValueFailed([String? info]) =>
      HiveException(info == null ? _putValueFailed : '$_putValueFailed: $info');

  factory HiveException.deleteValueFailed([String? info]) => HiveException(
    info == null ? _deleteValueFailed : '$_deleteValueFailed: $info',
  );

  factory HiveException.existsCheckFailed([String? info]) => HiveException(
    info == null ? _existsCheckFailed : '$_existsCheckFailed: $info',
  );

  @override
  String toString() => 'HiveException: $message';
}
