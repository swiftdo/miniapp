import 'package:flutter/material.dart';
import 'package:miniapp/core/provider/provider.dart';

import 'router.dart';
import 'locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'db.dart';
import 'providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DB.setupDB();
  setupLocator();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: globalProviders(),
      builder: (context, child) => ScreenUtilInit(
        builder: () => OKToast(
          textPadding: EdgeInsets.all(30),
          child: MaterialApp(
            title: 'miniapp',
            debugShowCheckedModeBanner: false,
            navigatorKey: GetX.config.navigatorKey,
            theme: ThemeData.light(),
            initialRoute: RouterPath.root.name,
            onGenerateRoute: GetX.router.onGenerateRoute,
          ),
        ),
      ),
    );
  }
}
