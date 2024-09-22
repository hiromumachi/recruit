import 'package:recruitfrontend/data/usecase/content/content_usecase.dart';
import 'package:recruitfrontend/model/freezed/content/content_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recruitfrontend/widget/page/main/model/select_content_provider.dart';

final getAllContentProvider = StateNotifierProvider.autoDispose<
    GetAllContentProvider, AsyncValue<List<ContentEntity>>>((ref) {
  return GetAllContentProvider(ref);
});

class GetAllContentProvider
    extends StateNotifier<AsyncValue<List<ContentEntity>>> {
  GetAllContentProvider(this.ref) : super(const AsyncValue.loading()) {
    call();
  }

  final Ref ref;

  Future<void> call() async {
    state = await AsyncValue.guard(() async {
      return await ref.read(contentUsecaseProvider).getAllContent();
    });
  }

  // 新しいContentEntityを追加するメソッド
  void addContent(ContentEntity newContent) {
    if (state is AsyncData<List<ContentEntity>>) {
      final currentList = (state as AsyncData<List<ContentEntity>>).value;
      // 現在のリストに新しいContentEntityを追加
      state = AsyncData([...currentList, newContent]);
    }
  }

  void putContent(ContentEntity content) {
    if (state is AsyncData<List<ContentEntity>>) {
      final currentList = (state as AsyncData<List<ContentEntity>>).value;
      // 現在のリストからContentEntityを更新
      state = AsyncData(currentList
          .map((element) => element.id == content.id ? content : element)
          .toList());
    }
  }

  // ContentEntityを削除するメソッド
  void deleteContent(int contentId) {
    if (state is AsyncData<List<ContentEntity>>) {
      final currentList = (state as AsyncData<List<ContentEntity>>).value;
      // 現在のリストからContentEntityを削除
      state = AsyncData(
          currentList.where((element) => element.id != contentId).toList());
      final selectContent = ref.read(selectContentProvider);
      if (selectContent != null) {
        if (selectContent.id == contentId) {
          ref.read(selectContentProvider.notifier).selectContent(null);
        }
      }
    }
  }
}
