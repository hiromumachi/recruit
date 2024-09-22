import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recruitfrontend/model/freezed/content/content_entity.dart';

final selectContentProvider =
    StateNotifierProvider<SelectContentProvider, ContentEntity?>((ref) {
  return SelectContentProvider();
});

class SelectContentProvider extends StateNotifier<ContentEntity?> {
  SelectContentProvider() : super(null);

  void selectContent(ContentEntity? content) {
    state = content;
  }

  void titleChange(String title) {
    state = state!.copyWith(title: title);
  }

  void bodyChange(String body) {
    state = state!.copyWith(body: body);
  }
}
