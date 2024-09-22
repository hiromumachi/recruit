import 'package:recruitfrontend/data/usecase/content/content_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recruitfrontend/model/freezed/content/put_content_entity.dart';

final putContentProvider =
    StateNotifierProvider.autoDispose<PutContentProvider, AsyncValue<void>>(
        (ref) {
  return PutContentProvider(ref);
});

class PutContentProvider extends StateNotifier<AsyncValue<void>> {
  PutContentProvider(this.ref) : super(const AsyncValue.data(null));

  final Ref ref;

  Future<void> putContent(PutContentEntity content) async {
    state = const AsyncValue.loading(); // ローディング状態に変更
    try {
      await ref.read(contentUsecaseProvider).putContent(content);
      state = const AsyncValue.data(null);
    } catch (e, stackTrace) {
      // エラーが発生した場合はエラーメッセージとともにstateを更新
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
