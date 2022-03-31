import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hongkongschoolyellowpages/api/schoolInfoApi.dart';
// import 'package:hongkongschoolyellowpages/model/schoolInfo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hongkongschoolyellowpages/l10n/l10n.dart';
import 'package:hongkongschoolyellowpages/screens/languageSetting.dart';
import 'package:hongkongschoolyellowpages/provider/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _isloading = true;
    _getLanguage();
    _getSchoolInfo();
  }

  Future<Null> _refresh() async {
    _isloading = true;
    _getLanguage();
    _getSchoolInfo();
    return;
  }

  // final pages = [HomeScreen(), HomeScreen(), LanguageSettingScreen()];
  // int _selectedIndex = 1;
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  bool _isloading = true;
  bool _isEn = false;
  List? _schoolInfoList = [];

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _getSchoolInfo() async {
    _schoolInfoList = await SchoolInfoApi().getSchoolInfo();
    print(_schoolInfoList!.length);
    setState(() {
      _isloading = false;
    });
    //print(_schoolInfoList![0]['attributes']['ENGLISH_NAME']);
  }

  void _getLanguage() async {
    final SharedPreferences prefs = await _prefs;
    String language = prefs.getString('language') ?? null!;
    print("getLanguage: " + language);
    switch (language) {
      case "en":
        _isEn = true;
        print("getLanguage: bool en");
        break;
      case "zh_Hant_TW":
        _isEn = false;
        print("getLanguage: bool zh_Hant_TW");
        break;
      default:
        _isEn = false;
        print("getLanguage: bool default zh_Hant_TW");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: Text(
          _isloading
              ? AppLocalizations.of(context)!.loading
              : AppLocalizations.of(context)!.hongKongSchoolYellowPages,
          style:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LanguageSettingScreen()))
                    .then((value) {
                  setState(() {
                    // refresh state
                    _refresh();
                  });
                });
                //Navigator.pushNamed(context, 'LanguageSetting');
              },
              child: const Icon(
                Icons.public,
                color: Colors.black,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        color: Colors.white,
        onRefresh: _refresh,
        child: Card(
          child: ListView.builder(
            itemCount: _schoolInfoList!.length,
            itemBuilder: (context, index) {
              return _isEn
                  ? ListTile(
                      leading: Text(_schoolInfoList![index]['attributes']
                              ['OBJECTID']
                          .toString()),
                      title: Text(
                        _schoolInfoList![index]['attributes']['ENGLISH_NAME'],
                        style: const TextStyle(fontSize: 14),
                      ),
                      subtitle: Text(
                        _schoolInfoList![index]['attributes']['中文名稱'],
                        style: const TextStyle(fontSize: 12),
                      ),
                      isThreeLine: false,
                      dense: true,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "Details",
                          arguments: {
                            'index': _schoolInfoList![index],
                            "_isEn": _isEn
                          },
                        );
                      },
                    )
                  : ListTile(
                      leading: Text(_schoolInfoList![index]['attributes']
                              ['OBJECTID']
                          .toString()),
                      title: Text(
                        _schoolInfoList![index]['attributes']['中文名稱'],
                        style: const TextStyle(fontSize: 14),
                      ),
                      subtitle: Text(
                        _schoolInfoList![index]['attributes']['ENGLISH_NAME'],
                        style: const TextStyle(fontSize: 12),
                      ),
                      isThreeLine: false,
                      dense: true,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "Details",
                          arguments: {
                            'index': _schoolInfoList![index],
                            "_isEn": _isEn
                          },
                        );
                      },
                    );
            },
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.yellow,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: 'Search',
      //       backgroundColor: Colors.red,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //       backgroundColor: Colors.yellow,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.public),
      //       label: 'Lanugage',
      //       backgroundColor: Colors.blue,
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.amber[800],
      //   onTap: _onItemTapped,
      // ),
    );
  }
}
