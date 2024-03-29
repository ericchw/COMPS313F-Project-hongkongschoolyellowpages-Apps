import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hongkongschoolyellowpages/provider/locale_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hongkongschoolyellowpages/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hongkongschoolyellowpages/screens/startupView.dart';
import 'package:hongkongschoolyellowpages/screens/tnc.dart';
// import 'package:hongkongschoolyellowpages/screens/bottomNavigationController.dart';
import 'package:hongkongschoolyellowpages/screens/search.dart';
import 'package:hongkongschoolyellowpages/screens/filter.dart';
import 'package:hongkongschoolyellowpages/screens/home.dart';
import 'package:hongkongschoolyellowpages/screens/languageSetting.dart';
import 'package:hongkongschoolyellowpages/screens/details.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
  _getAcceptTnc();
}

bool _isAcceptTnc = false;

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

void _getAcceptTnc() async {
  final SharedPreferences prefs = await _prefs;
  _isAcceptTnc = prefs.getBool('acceptTnc') ?? false;
}

//import everyScreen for Nagvation

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
        builder: (context, child) {
          final provider = Provider.of<LocaleProvider>(context);
          return MaterialApp(
            theme: ThemeData(
              brightness: Brightness.light,
              /* light theme settings */
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              /* dark theme settings */
            ),
            themeMode: ThemeMode.system,
            /* ThemeMode.system to follow system theme,
            ThemeMode.light for light theme, 
            ThemeMode.dark for dark theme
            */
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: L10n.all,
            locale: provider.locale,
            routes: {
              "StartupView": (context) => StartupViewScreen(),
              "Tnc": (context) => TncScreen(),
              // "BottomNavigationController": (context) =>
              //     BottomNavigationController(),
              "Home": (context) => HomeScreen(),
              "Search": (context) => SearchScreen(),
              "Filter": (context) => FilterScreen(),
              "LanguageSetting": (context) => LanguageSettingScreen(),
              "Details": (context) => DetailsScreen(),
            },
            home: _isAcceptTnc ? HomeScreen() : StartupViewScreen(),
          );
        },
      );
}
