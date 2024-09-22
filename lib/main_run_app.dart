import 'package:recruitfrontend/constant/const_info.dart';
import 'package:recruitfrontend/constant/custom_theme_datas.dart';
import 'package:recruitfrontend/constant/route.dart';
import 'package:recruitfrontend/util/easy_loading_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> mainRunApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLoadingUtil.initialize();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  var initialRoute = '/';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: initialRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
      title: ConstInfo.appName,
      theme: CustomThemeDatas.general,
      debugShowCheckedModeBanner: true,
    );
  }
}
