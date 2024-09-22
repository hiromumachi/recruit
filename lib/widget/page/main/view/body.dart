import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recruitfrontend/constant/custom_colors.dart';
import 'package:recruitfrontend/constant/custom_texts.dart';
import 'package:recruitfrontend/model/extension/context_extension.dart';
import 'package:recruitfrontend/model/freezed/content/content_entity.dart';
import 'package:recruitfrontend/model/freezed/content/put_content_entity.dart';
import 'package:recruitfrontend/widget/component/button/cancel_button.dart';
import 'package:recruitfrontend/widget/component/button/edit_button.dart';
import 'package:recruitfrontend/widget/component/button/save_button.dart';
import 'package:recruitfrontend/widget/component/textfield/custom_text_formfield.dart';
import 'package:recruitfrontend/widget/page/main/logic/put_content_provider.dart';
import 'package:recruitfrontend/widget/page/main/model/select_content_provider.dart';

class Body extends ConsumerStatefulWidget {
  const Body({super.key});

  @override
  BodyState createState() => BodyState();
}

class BodyState extends ConsumerState<Body> {
  bool titleEdit = false;
  bool bodyEdit = false;
  late TextEditingController _titleController;
  late TextEditingController _bodyController;
  ContentEntity? _previousContent;

  Future<void> titleSaveAction(ContentEntity selectContent) async {
    final putContent = PutContentEntity(
      id: selectContent.id,
      title: _titleController.text,
      body: selectContent.body,
    );
    try {
      await ref.read(putContentProvider.notifier).putContent(putContent);

      ref
          .read(selectContentProvider.notifier)
          .titleChange(_titleController.text);
    } catch (e) {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("エラー"),
          content: const Text("保存に失敗しました"),
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
        titleEdit = false;
      });
    }
  }

  void titleEditAction() {
    setState(() {
      titleEdit = true;
    });
  }

  void titleCancelAction() {
    setState(() {
      titleEdit = false;
    });
  }

  Future<void> bodySaveAction(ContentEntity selectContent) async {
    final putContent = PutContentEntity(
      id: selectContent.id,
      title: selectContent.title,
      body: _bodyController.text,
    );
    try {
      await ref.read(putContentProvider.notifier).putContent(putContent);

      ref.read(selectContentProvider.notifier).bodyChange(_bodyController.text);
    } catch (e) {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("エラー"),
          content: const Text("保存に失敗しました"),
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
        bodyEdit = false;
      });
    }
  }

  void bodyEditAction() {
    setState(() {
      bodyEdit = true;
    });
  }

  void bodyCancelAction() {
    setState(() {
      bodyEdit = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(); // TextEditingControllerを初期化
    _bodyController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectContent = ref.watch(selectContentProvider);
    ref.watch(putContentProvider);
    // selectContentが変更された場合にTextFormFieldの値を更新
    // 新しいコンテンツが選択された場合にのみTextFormFieldを更新
    if (selectContent != null && selectContent != _previousContent) {
      _previousContent = selectContent;
      _titleController.text = selectContent.title;
      _bodyController.text = selectContent.body;
    }

    final isPortrait = context.orientation == Orientation.portrait;
    return Container(
      padding: const EdgeInsets.all(10),
      child: selectContent == null
          ? Center(
              child: Text(
                'コンテンツを選択してください',
                style: CustomTexts.captionStyle
                    .copyWith(color: CustomColors.textColorRegular),
              ),
            )
          : bodyContent(
              selectContent: selectContent,
              isPortrait: isPortrait,
            ),
    );
  }

  Widget bodyContent(
      {required ContentEntity selectContent, required bool isPortrait}) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
        color: CustomColors.backgroundColorLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleArea(selectContent: selectContent, isPortrait: isPortrait),
          Expanded(
            child:
                bodyArea(selectContent: selectContent, isPortrait: isPortrait),
          ),
        ],
      ),
    );
  }

  Widget titleArea(
      {required ContentEntity selectContent, required bool isPortrait}) {
    return Container(
      height: isPortrait
          ? context.screen.height * 0.2
          : context.screen.height * 0.3,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              child: CustomTextFormField(
                controller: _titleController,
                onChanged: (value) {},
                readOnly: !titleEdit,
                isTitle: true,
              ),
            ),
          ),
          SizedBox(
            width: context.screen.width * 0.15,
            child: Align(
              alignment: Alignment.topCenter,
              child: titleEdit
                  ? onEditButtonArea(
                      selectContent: selectContent,
                      isPortrait: isPortrait,
                      saveAction: () => titleSaveAction(selectContent),
                      cancelAction: () => titleCancelAction(),
                    )
                  : offEditButtonArea(editOnAction: titleEditAction),
            ),
          ),
        ],
      ),
    );
  }

  Widget bodyArea(
      {required ContentEntity selectContent, required bool isPortrait}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(30, 0, 30, 5),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: CustomColors.backgroundColor,
              child: CustomTextFormField(
                controller: _bodyController,
                onChanged: (value) {},
                readOnly: !bodyEdit,
                isTitle: false,
              ),
            ),
          ),
          SizedBox(
            width: context.screen.width * 0.15,
            child: Align(
              alignment: Alignment.topCenter,
              child: bodyEdit
                  ? onEditButtonArea(
                      selectContent: selectContent,
                      isPortrait: isPortrait,
                      saveAction: () => bodySaveAction(selectContent),
                      cancelAction: () => bodyCancelAction(),
                    )
                  : offEditButtonArea(editOnAction: bodyEditAction),
            ),
          ),
        ],
      ),
    );
  }

  Widget offEditButtonArea({required VoidCallback editOnAction}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: EditButton(
        height: 40,
        width: context.screen.width * 0.15,
        onTap: editOnAction,
      ),
    );
  }

  Widget onEditButtonArea({
    required ContentEntity selectContent,
    required bool isPortrait,
    required VoidCallback? saveAction,
    required VoidCallback? cancelAction,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: isPortrait
          ? Column(children: [
              SaveButton(
                width: 40,
                height: 40,
                onTap: saveAction,
              ),
              const SizedBox(height: 5),
              CancelButton(
                width: 40,
                height: 40,
                onTap: cancelAction,
              ),
            ])
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CancelButton(
                  width: 40,
                  height: 40,
                  onTap: cancelAction,
                ),
                const SizedBox(width: 5),
                SaveButton(
                  width: 40,
                  height: 40,
                  onTap: saveAction,
                ),
              ],
            ),
    );
  }
}
