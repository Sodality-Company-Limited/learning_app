import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './routers/go_router_provider.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:app_links/app_links.dart';
import 'package:flutter/services.dart';
import 'dart:async';
// import 'package:firebase_core/firebase_core.dart';

Future<String?> startUri() async {
  const MethodChannel channel = MethodChannel('myapp/deeplink');
  try {
    return await channel.invokeMethod('initialLink');
  } on PlatformException catch (e) {
    return "Failed to Invoke: '${e.message}'.";
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Hive.initFlutter();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  StreamSubscription<Uri?>? _sub;
  String gQueryString = "";
  bool gIsOpenAppDeeplink = false;
  bool gIsDeeplink = false;
  // Uri? _initialUri;
  // Uri? _currentUri;
  // Object? _err;
  // late AppLinks _appLinks;

  void lineSDKInit() async {
    await LineSDK.instance.setup("2006066473").then((_) {
      print('lineSDKInit');
    });
  }

  @override
  void initState() {
    lineSDKInit();
    super.initState();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
    );
  }
}
