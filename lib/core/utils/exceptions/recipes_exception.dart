/// Custom exception class for handling errors in the Recipes feature.
class RecipesException implements Exception {
  final String message;
  final String? additionalInfo;

  static const String _noCategoriesFound = 'No categories found';
  static const String _networkError = 'Network/API error';
  static const String _fetchFailed = 'Failed to fetch recipes';

  const RecipesException._(this.message, [this.additionalInfo]);

  factory RecipesException.noCategoriesFound([String? info]) =>
      RecipesException._(_noCategoriesFound, info);

  factory RecipesException.networkError([String? info]) =>
      RecipesException._(_networkError, info);

  factory RecipesException.fetchFailed([String? info]) =>
      RecipesException._(_fetchFailed, info);

  @override
  String toString() =>
      '[RecipesRepositoryException] ${additionalInfo == null ? message : '$message: $additionalInfo'}';
}
