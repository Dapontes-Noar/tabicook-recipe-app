abstract interface class HiveBoxDataSource {
  Future<Set<dynamic>> getAll();

  Future<void> putValue(String id);

  Future<dynamic> getValue(String id);

  Future<void> deleteValue(String id);

  bool exists(String id);
}
