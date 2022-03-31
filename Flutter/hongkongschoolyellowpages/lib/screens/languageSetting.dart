import 'package:flutter/material.dart';
import '../../provider/locale_provider.dart';
import 'package:provider/provider.dart';

class LanguageSettingScreen extends StatefulWidget {
  @override
  _LanguageSettingState createState() => _LanguageSettingState();
}

class _LanguageSettingState extends State<LanguageSettingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;

    var localeModel = Provider.of<LocaleProvider>(context);

    //var gm = GmLocalizations.of(context);

    Widget _buildLanguageItem(String lan, value) {
      print(localeModel.locale);
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
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Language Setting",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              _buildLanguageItem(
                "繁體中文",
                Locale.fromSubtags(
                    languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'),
              ),
              _buildLanguageItem("English", Locale('en')),
            ],
          ),
        ));
  }
}
