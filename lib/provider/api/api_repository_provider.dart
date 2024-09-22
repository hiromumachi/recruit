import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recruitfrontend/data/repository/api_repository.dart';

final apiRepositoryProvider = Provider<ApiRepository>((ref) {
  return ApiRepository();
});
