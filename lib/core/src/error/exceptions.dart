class CacheException implements Exception {
  final String message;

  CacheException({this.message = 'Erro no armazenamento interno'});
}