import 'dart:io';
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
import 'package:hongkongschoolyellowpages/widget/search_Widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(
        () {
          setState(() {});
        },
      );
    controller.repeat(reverse: true);
    super.initState();
    _getLanguage();
    _getSchoolInfo();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<Null> _refresh() async {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(
        () {
          setState(() {});
        },
      );
    controller.repeat(reverse: true);
    _isLoading = true;
    _schoolInfoList!.clear();
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

  bool _isLoading = true;
  bool _isEn = false;
  List? _schoolInfoList = [];
  late AnimationController controller;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _getSchoolInfo() async {
    _schoolInfoList = await SchoolInfoApi().getSchoolInfo();
    print(_schoolInfoList!.length);
    // List<String>? _schoolName_zh;
    // for (int i = 0; i < _schoolInfoList!.length; i++) {
    //   _schoolName_zh?.add(_schoolInfoList![i]["attributes"]["中文名稱"]);
    // }
    // print(_schoolName_zh!.length);
    setState(
      () {
        _isLoading = false;
      },
    );
    //print(_schoolInfoList![0]['attributes']['ENGLISH_NAME']);
  }

  void _getLanguage() async {
    final SharedPreferences prefs = await _prefs;
    String _language = prefs.getString('language') ?? "zh_Hant_TW";
    print("getLanguage: " + _language);
    switch (_language) {
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

  // Widget buildSearch() => SearchWidget(text: query, hintText: "searchSchoolHintText", onChanged:searchSchool,);
  // void searchSchool(String query) {final schoolName_zh = )

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Scaffold(
            backgroundColor: Colors.yellow,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.yellow,
              leading: const CircleAvatar(
                radius: 15.0,
                backgroundImage: NetworkImage(
                    "https://static.newmobilelife.com/wp-content/uploads/2018/07/macau1.jpg"),
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                _isLoading
                    ? AppLocalizations.of(context)!.loading
                    : AppLocalizations.of(context)!.hongKongSchoolYellowPages,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black),
              ),
            ),
            body: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment:
                  CrossAxisAlignment.center, //Center Row contents vertically,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment
                        .center, //Center Column contents horizontally,
                    children: <Widget>[
                      Text(AppLocalizations.of(context)!.loading,
                          style: Theme.of(context).textTheme.headline6),
                      CircularProgressIndicator(
                        value: controller.value,
                        semanticsLabel: 'Linear progress indicator',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.yellow,
              leading: const CircleAvatar(
                radius: 15.0,
                backgroundImage: NetworkImage(
                    "https://static.newmobilelife.com/wp-content/uploads/2018/07/macau1.jpg"),
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                _isLoading
                    ? AppLocalizations.of(context)!.loading
                    : AppLocalizations.of(context)!.hongKongSchoolYellowPages,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black),
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LanguageSettingScreen())).then(
                        (value) {
                          setState(
                            () {
                              // refresh state
                              _refresh();
                            },
                          );
                        },
                      );
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
              backgroundColor: Colors.yellow,
              color: Colors.green,
              onRefresh: _refresh,
              child: Card(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: _schoolInfoList!.length,
                  itemBuilder: (context, index) {
                    return _isEn
                        ? ListTile(
                            leading: Text(_schoolInfoList![index]['attributes']
                                    ['OBJECTID']
                                .toString()),
                            title: Text(
                              _schoolInfoList![index]['attributes']
                                  ['ENGLISH_NAME'],
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
                              _schoolInfoList![index]['attributes']
                                  ['ENGLISH_NAME'],
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
                                  "isEn": _isEn,
                                },
                              );
                              print(_isEn);
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
