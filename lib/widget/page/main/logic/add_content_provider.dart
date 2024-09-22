import 'package:recruitfrontend/data/usecase/content/content_usecase.dart';
import 'package:recruitfrontend/model/freezed/content/add_content_entity.dart';
import 'package:recruitfrontend/model/freezed/content/content_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addContentProvider = StateNotifierProvider.autoDispose<AddContentProvider,
    AsyncValue<ContentEntity?>>((ref) {
  return AddContentProvider(ref);
});

class AddContentProvider extends StateNotifier<AsyncValue<ContentEntity?>> {
  AddContentProvider(this.ref) : super(const AsyncValue.data(null));

  final Ref ref;

  // 新しいContentを受け取って追加するメソッド
  Future<ContentEntity?> addNewContent(AddContentEntity newContent) async {
    state = const AsyncValue.loading(); // ローディング状態に変更
    try {
      final addedContent =
          await ref.read(contentUsecaseProvider).addContent(newContent);
      state = AsyncValue.data(addedContent); // 追加されたコンテンツをstateにセット
      return addedContent; // 追加されたContentEntityを返却
    } catch (e, stackTrace) {
      // エラーが発生した場合はエラーメッセージとともにstateを更新
      state = AsyncValue.error(e, stackTrace);
      return null; // エラー時はnullを返す
    }
  }
}
