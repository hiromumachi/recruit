import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recruitfrontend/constant/custom_colors.dart';
import 'package:recruitfrontend/constant/custom_texts.dart';
import 'package:recruitfrontend/model/extension/context_extension.dart';
import 'package:recruitfrontend/model/freezed/content/content_entity.dart';
import 'package:recruitfrontend/util/dev_log.dart';
import 'package:recruitfrontend/widget/component/button/delete_button.dart';
import 'package:recruitfrontend/widget/component/title_logo.dart';
import 'package:recruitfrontend/widget/page/main/logic/delete_content_provider.dart';
import 'package:recruitfrontend/widget/page/main/logic/get_all_content_provider.dart';
import 'package:recruitfrontend/widget/page/main/model/is_edit_provider.dart';
import 'package:recruitfrontend/widget/page/main/model/select_content_provider.dart';
import 'package:recruitfrontend/widget/page/main/view/content/bottom_edit_area.dart';

class SideMenu extends ConsumerStatefulWidget {
  final List<ContentEntity> contentList;
  const SideMenu({super.key, required this.contentList});

  @override
  ConsumerState<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends ConsumerState<SideMenu> {
  // content.idごとのローディング状態を管理
  final Map<int, bool> _isLoadingMap = {};

  @override
  Widget build(BuildContext context) {
    final isEdit = ref.watch(isEditProvider);
    ref.watch(deleteContentProvider);
    final selectContent = ref.watch(selectContentProvider);
    final scrollController = ScrollController();

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: CustomColors.backgroundColorLight,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: Column(
        children: [
          if (context.orientation != Orientation.portrait) ...[
            const TitleLogo(),
            const SizedBox(height: 10),
          ],
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: widget.contentList.length,
              itemBuilder: (context, index) {
                final content = widget.contentList[index];
                final isSelect = selectContent == content;

                return contentArea(
                    content: content, isSelect: isSelect, isEdit: isEdit);
              },
            ),
          ),
          BottomEditArea(scrollController: scrollController),
        ],
      ),
    );
  }

  Widget deleteButtonArea({
    required ContentEntity content,
    required BuildContext context,
  }) {
    final isLoading = _isLoadingMap[content.id] ?? false;

    return Container(
      child: isLoading
          ? const CircularProgressIndicator()
          : DeleteButton(
              width: 30,
              height: 30,
              onTap: () async {
                setState(() {
                  _isLoadingMap[content.id] = true; // ローディング状態を開始
                });

                try {
                  await ref
                      .read(deleteContentProvider.notifier)
                      .deleteContent(content.id);
                  // リストから削除
                  ref
                      .read(getAllContentProvider.notifier)
                      .deleteContent(content.id);
                } catch (e) {
                  devLog('deleteButtonArea: $e');
                  showDialog(
                    // ignore: use_build_context_synchronously
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("エラー"),
                      content: const Text("削除に失敗しました。"),
                      actions: [
                        TextButton(
                          onPressed: Navigator.of(context).pop,
                          child: const Text("閉じる"),
                        ),
                      ],
                    ),
                  );
                } finally {
                  setState(() {
                    _isLoadingMap[content.id] = false; // ローディング終了
                  });
                }
              },
            ),
    );
  }

  Widget contentArea(
      {required ContentEntity content,
      required bool isSelect,
      required bool isEdit}) {
    return Container(
      decoration: isSelect
          ? BoxDecoration(
              color: CustomColors.backgroundColorLight,
              borderRadius: BorderRadius.circular(4),
            )
          : null,
      child: ListTile(
        title: Text(
          content.title,
          style: isSelect
              ? CustomTexts.bodyStyleBold.copyWith(
                  color: CustomColors.blueBoldColor,
                )
              : CustomTexts.bodyStyle.copyWith(
                  color: CustomColors.textColorRegular,
                ),
        ),
        onTap: () {
          ref.read(selectContentProvider.notifier).selectContent(content);
          if (context.orientation == Orientation.portrait &&
              Scaffold.of(context).isDrawerOpen) {
            Navigator.of(context).pop(); // ドロワーを閉じる
          }
        },
        trailing: isEdit
            ? deleteButtonArea(
                content: content,
                context: context,
              )
            : null,
      ),
    );
  }
}
