import 'package:cat_management/data/others/main_list_notifier.dart';
import 'package:cat_management/data/services/home_page_services.dart';
import 'package:cat_management/utils/utils.dart';
import 'package:cat_management/views/pages/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await HomePageServices.appInitialization();
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=>MainListNotifier(), child: CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: HexColor.fromHex("#FF6F43"),
        barBackgroundColor: HexColor.fromHex("#FBE9E7"),
        scaffoldBackgroundColor: CupertinoColors.black,
        textTheme: const CupertinoTextThemeData(
          primaryColor: CupertinoColors.black,
          textStyle:
          TextStyle(color: CupertinoColors.black, fontFamily: 'Montserrat'),
        ),
      ),
      title: 'Cat Management App',
      home: const MainPage(),
    ),);
  }
}
