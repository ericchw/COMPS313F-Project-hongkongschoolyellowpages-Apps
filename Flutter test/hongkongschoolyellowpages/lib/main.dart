import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hongkongschoolyellowpages/provider/locale_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hongkongschoolyellowpages/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hongkongschoolyellowpages/screens/tnc.dart';
import 'package:hongkongschoolyellowpages/screens/home.dart';
import 'package:hongkongschoolyellowpages/screens/languageSetting.dart';
import 'package:hongkongschoolyellowpages/screens/details.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
  _getAcceptTnc();
  print("getAccept: " + _isAcceptTnc.toString());
}

bool _isAcceptTnc = false;

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

void _getAcceptTnc() async {
  final SharedPreferences prefs = await _prefs;
  String _acceptTnc = prefs.getString('acceptTnc') ?? "false";
  print("getAccept: " + _acceptTnc);
  switch (_acceptTnc) {
    case "acceptTnc":
      _isAcceptTnc = true;
      //print("_isAcceptTnc: true");
      break;
    default:
      _isAcceptTnc = false;
      //print("_isAcceptTnc: default false");
      break;
  }
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
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: L10n.all,
            locale: provider.locale,
            routes: {
              "Tnc": (context) => TncScreen(),
              "Home": (context) => HomeScreen(),
              "LanguageSetting": (context) => LanguageSettingScreen(),
              "Details": (context) => DetailsScreen(),
            },
            debugShowCheckedModeBanner: false,
            home: _isAcceptTnc ? HomeScreen() : TncScreen(),
          );
        },
      );
}
