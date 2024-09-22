import 'package:recruitfrontend/constant/custom_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recruitfrontend/constant/custom_texts.dart';
import 'package:recruitfrontend/model/extension/context_extension.dart';
import 'package:recruitfrontend/model/freezed/content/content_entity.dart';
import 'package:recruitfrontend/util/dev_log.dart';
import 'package:recruitfrontend/widget/component/title_logo.dart';
import 'package:recruitfrontend/widget/page/main/logic/get_all_content_provider.dart';
import 'package:recruitfrontend/widget/page/main/model/select_content_provider.dart';
import 'package:recruitfrontend/widget/page/main/view/body.dart';
import 'package:recruitfrontend/widget/page/main/view/content/bottom_area.dart';

import 'package:recruitfrontend/widget/page/main/view/side_menu.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentListState = ref.watch(getAllContentProvider);
    // selectContentProviderの変更を監視
    ref.listen<ContentEntity?>(selectContentProvider, (previous, next) {
      if (next != null) {
        ref.read(getAllContentProvider.notifier).putContent(next);
      }
    });

    bool isPortrait = context.orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: isPortrait
          ? AppBar(
              title: const TitleLogo(),
              backgroundColor: CustomColors.backgroundColor,
              leading: Builder(
                // Builderで正しいコンテキストを取得
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer(); // 左側にハンバーガーメニューを開く
                    },
                  );
                },
              ),
            )
          : null,
      drawer: isPortrait
          ? Drawer(
              backgroundColor: CustomColors.backgroundColor,
              child: contentListState.when(
                data: (data) => SideMenu(contentList: data), // ハンバーガーメニューの中身
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) {
                  devLog(stackTrace);
                  return Center(
                    child: Text(
                      'エラー: $error',
                      style: const TextStyle(color: CustomColors.mainColor),
                    ),
                  );
                },
              ),
            )
          : null, // 縦向きの場合にのみDrawerを表示
      body: contentListState.when(
        data: (data) {
          return isPortrait ? portraitView() : landscapeView(data);
        },
        error: (error, stackTrace) {
          devLog(stackTrace);
          return errorView(context, ref, error.toString());
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget portraitView() {
    return const Column(
      children: [
        Expanded(child: Body()),
        BottomArea(),
      ],
    );
  }

  Widget landscapeView(List<ContentEntity> data) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SideMenu(contentList: data),
        ),
        const Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(child: Body()),
                BottomArea(),
              ],
            ))
      ],
    );
  }

  Widget errorView(BuildContext context, WidgetRef ref, String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'エラー: $error',
            style: const TextStyle(color: CustomColors.mainColor),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: context.screen.height * 0.1,
            width: context.screen.width * 0.3,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.mainColor,
                ),
                onPressed: () {
                  // ignore: unused_result
                  ref.refresh(getAllContentProvider);
                },
                child: Text(
                  '再取得',
                  style: CustomTexts.bodyStyle
                      .copyWith(color: CustomColors.backgroundColor),
                )),
          ),
        ],
      ),
    );
  }
}
