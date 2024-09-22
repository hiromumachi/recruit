import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recruitfrontend/model/freezed/content/add_content_entity.dart';
import 'package:recruitfrontend/model/freezed/content/content_entity.dart';
import 'package:recruitfrontend/model/freezed/content/put_content_entity.dart';
import 'package:recruitfrontend/provider/api/api_repository_provider.dart';

final contentUsecaseProvider = Provider<ContentUsecase>((ref) {
  return ContentUsecase(ref);
});

class ContentUsecase {
  final ProviderRef ref;
  ContentUsecase(this.ref);
  Future<List<ContentEntity>> getAllContent() async {
    return await ref.read(apiRepositoryProvider).getAllContent();
  }

  Future<ContentEntity> addContent(AddContentEntity contentEntity) async {
    return await ref.read(apiRepositoryProvider).addContent(contentEntity);
  }

  Future<void> putContent(PutContentEntity contentEntity) async {
    return await ref.read(apiRepositoryProvider).putContent(contentEntity);
  }

  Future<void> deleteContent(int id) async {
    return await ref.read(apiRepositoryProvider).deleteContent(id.toString());
  }
}
