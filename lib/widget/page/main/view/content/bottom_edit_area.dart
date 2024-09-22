import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recruitfrontend/model/extension/context_extension.dart';
import 'package:recruitfrontend/model/freezed/content/add_content_entity.dart';
import 'package:recruitfrontend/widget/component/button/add_button.dart';
import 'package:recruitfrontend/widget/component/button/done_button.dart';
import 'package:recruitfrontend/widget/component/button/edit_button.dart';
import 'package:recruitfrontend/widget/page/main/logic/add_content_provider.dart';
import 'package:recruitfrontend/widget/page/main/logic/get_all_content_provider.dart';
import 'package:recruitfrontend/widget/page/main/model/is_edit_provider.dart';

class BottomEditArea extends ConsumerWidget {
  final ScrollController scrollController;

  const BottomEditArea({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEdit = ref.watch(isEditProvider);
    final isPortrait = context.orientation == Orientation.portrait;
    return SizedBox(
      height: context.screen.height * 0.15,
      child: !isEdit
          ? Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
              child: editOffButtonArea(
                context: context,
                ref: ref,
                isPortrait: isPortrait,
              ),
            )
          : Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
              child: editOnButtonArea(
                context: context,
                ref: ref,
                isPortrait: isPortrait,
              ),
            ),
    );
  }

  Widget editOffButtonArea(
      {required BuildContext context,
      required WidgetRef ref,
      required bool isPortrait}) {
    return EditButton(
      width:
          isPortrait ? context.screen.width * 0.3 : context.screen.width * 0.1,
      height: isPortrait
          ? context.screen.height * 0.1
          : context.screen.height * 0.15,
      onTap: () {
        ref.read(isEditProvider.notifier).state = true;
      },
    );
  }

  Widget editOnButtonArea({
    required BuildContext context,
    required WidgetRef ref,
    required bool isPortrait,
  }) {
    final addContentState = ref.watch(addContentProvider);
    final height =
        isPortrait ? context.screen.height * 0.1 : context.screen.height * 0.15;
    final width =
        isPortrait ? context.screen.width * 0.3 : context.screen.width * 0.1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (addContentState.isLoading) ...[
          // ローディング中の表示
          const CircularProgressIndicator(),
        ],
        if (!addContentState.isLoading) ...[
          AddButton(
            width: width,
            height: height,
            onTap: () async {
              final newContent = AddContentEntity(
                title: "new title ",
                body: " new body",
              );

              final content = await ref
                  .read(addContentProvider.notifier)
                  .addNewContent(newContent);
              if (content == null) {
                //ダイアログを表示
                showDialog(
                  // ignore: use_build_context_synchronously
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("エラー"),
                    content: const Text("コンテンツの追加に失敗しました"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("閉じる"),
                      ),
                    ],
                  ),
                );
                return;
              }
              ref.read(getAllContentProvider.notifier).addContent(content);
              //一番下にスクロール
              // ignore: use_build_context_synchronously
              scrollController.animateTo(
                scrollController.position.maxScrollExtent,
                duration: const Duration(seconds: 1),
                curve: Curves.bounceInOut,
              );
            },
          ),
        ],
        DoneButton(
          width: width,
          height: height,
          onTap: () {
            ref.read(isEditProvider.notifier).state = false;
          },
        ),
      ],
    );
  }
}
