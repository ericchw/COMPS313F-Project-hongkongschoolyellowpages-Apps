import 'package:flutter/material.dart';
import 'package:hongkongschoolyellowpages/provider/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LanguageSettingScreen extends StatefulWidget {
  const LanguageSettingScreen({Key? key}) : super(key: key);

  @override
  _LanguageSettingState createState() => _LanguageSettingState();
}

class _LanguageSettingState extends State<LanguageSettingScreen> {
  @override
  void initState() {
    super.initState();
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void _setLanguage(var language) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('language', language.toString());
    //print(language.toString());
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;

    var localeModel = Provider.of<LocaleProvider>(context);

    //var gm = GmLocalizations.of(context);

    Widget _buildLanguageItem(String lan, value) {
      //print(localeModel.locale);
      return ListTile(
        title: Text(
          lan,
          style: TextStyle(color: localeModel.locale == value ? color : null),
        ),
        trailing:
            localeModel.locale == value ? Icon(Icons.done, color: color) : null,
        onTap: () {
          // print(value);
          localeModel.setLocale(value);
          _setLanguage(value.toString());
          Navigator.pop(context);
          //print(value.toString());
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.yellow,
          title: Text(
            AppLocalizations.of(context)!.language,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              _buildLanguageItem(
                "繁體中文",
                const Locale.fromSubtags(
                    languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'),
              ),
              _buildLanguageItem("English", const Locale('en')),
            ],
          ),
        ));
  }
}
