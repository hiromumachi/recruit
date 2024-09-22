import 'package:recruitfrontend/data/usecase/content/content_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteContentProvider =
    StateNotifierProvider.autoDispose<DeleteContentProvider, AsyncValue<void>>(
        (ref) {
  return DeleteContentProvider(ref);
});

class DeleteContentProvider extends StateNotifier<AsyncValue<void>> {
  DeleteContentProvider(this.ref) : super(const AsyncValue.data(null));

  final Ref ref;

  Future<void> deleteContent(int contentId) async {
    state = const AsyncValue.loading(); // ローディング状態に変更
    try {
      await ref.read(contentUsecaseProvider).deleteContent(contentId);
      state = const AsyncValue.data(null);
    } catch (e, stackTrace) {
      // エラーが発生した場合はエラーメッセージとともにstateを更新
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
