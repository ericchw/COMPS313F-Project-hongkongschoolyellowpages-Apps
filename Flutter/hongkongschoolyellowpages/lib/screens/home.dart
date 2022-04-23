import 'package:flutter/material.dart';
import 'package:hongkongschoolyellowpages/api/schoolInfoApi.dart';
import 'package:hongkongschoolyellowpages/model/schoolInfo.dart';
import 'package:hongkongschoolyellowpages/screens/search.dart';
import 'package:hongkongschoolyellowpages/widget/search_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hongkongschoolyellowpages/l10n/l10n.dart';
import 'package:hongkongschoolyellowpages/screens/languageSetting.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lottie/lottie.dart';

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

  void _orderByObjectIdAscend() async {
    _schoolInfoList!.sort(
      (a, b) =>
          a['attributes']['OBJECTID'].compareTo(b['attributes']['OBJECTID']),
    );
    setState(() {});
  }

  void _orderByObjectIdDescend() async {
    _schoolInfoList!.sort(
      (a, b) =>
          b['attributes']['OBJECTID'].compareTo(a['attributes']['OBJECTID']),
    );
    setState(() {});
  }

  void _orderByNameAscend() async {
    _isEn
        ? _schoolInfoList!.sort(
            (a, b) => a['attributes']['ENGLISH_NAME'].toLowerCase().compareTo(
                  b['attributes']['ENGLISH_NAME'].toLowerCase(),
                ),
          )
        : _schoolInfoList!.sort(
            (a, b) => a['attributes']['中文名稱'].toLowerCase().compareTo(
                  b['attributes']['中文名稱'].toLowerCase(),
                ),
          );

    setState(() {});
  }

  void _orderByNameDescend() async {
    _isEn
        ? _schoolInfoList!.sort(
            (a, b) => b['attributes']['ENGLISH_NAME']
                .toLowerCase()
                .compareTo(a['attributes']['ENGLISH_NAME'].toLowerCase()),
          )
        : _schoolInfoList!.sort(
            (a, b) => b['attributes']['中文名稱']
                .toLowerCase()
                .compareTo(a['attributes']['中文名稱'].toLowerCase()),
          );
    setState(() {});
  }

  Future<Null> _refresh() async {
    _getLanguage();
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

  @override
  //https://medium.flutterdevs.com/custom-animated-bottomnavigation-bar-in-flutter-65293e231e4a
  bool _isLoading = true;
  bool _isEn = false;
  List? _schoolInfoList = <SchoolInfo>[];
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

  searchMethod(String value) async {
    List serachedSchoolList = [];
    for (int i = 0; i < _schoolInfoList!.length; i++) {
      if (_schoolInfoList![i]['attributes']['ENGLISH_NAME']
              .toLowerCase()
              .contains(value.toLowerCase()) ||
          _schoolInfoList![i]['attributes']['中文名稱'].contains(value)) {
        serachedSchoolList.add(_schoolInfoList![i]);
      }
    }
    Navigator.pushNamed(
      context,
      "Search",
      arguments: {
        'isEn': _isEn,
        'index': serachedSchoolList,
      },
    );
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

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return _isLoading
        ? Scaffold(
            backgroundColor:
                isDark ? Theme.of(context).backgroundColor : Colors.yellow,
            // appBar: AppBar(
            //   centerTitle: true,
            //   backgroundColor: Colors.yellow,
            //   leading: const CircleAvatar(
            //     radius: 15.0,
            //     backgroundImage: AssetImage("assets/logos/logo.png"),
            //     backgroundColor: Colors.transparent,
            //   ),
            //   title: Text(
            //     AppLocalizations.of(context)!.loading,
            //     style: const TextStyle(
            //         fontWeight: FontWeight.w500, color: Colors.black),
            //   ),
            // ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(AppLocalizations.of(context)!.loading,
                      style: Theme.of(context).textTheme.headline6),
                  CircularProgressIndicator(
                    value: controller.value,
                    semanticsLabel: 'Linear progress indicator',
                  ),
                  Lottie.asset(
                    'assets/lottie/load.json', //Lottie.network('https://assets3.lottiefiles.com/datafiles/MaKSoctsyXXTCDOpDktJYEcS3ws5SI6CLDo7iyMc/ex-splash.json', //or assets
                    animate: true,
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.yellow,
              leading: const Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                // child: GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => LanguageSettingScreen()))
                //         .then(
                //       (value) {
                //         setState(
                //           () {
                //             // refresh state
                //             _refresh();
                //           },
                //         );
                //       },
                //     );
                //   },
                //   child: const Icon(
                //     Icons.public,
                //     color: Colors.black,
                //     size: 26.0,
                //   ),
                // ),
              ),
              title: Text(
                _isLoading
                    ? AppLocalizations.of(context)!.loading
                    : AppLocalizations.of(context)!.hongKongSchoolYellowPages,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black),
              ),
              actions: <Widget>[
                // IconButton(
                //   icon: const Icon(
                //     Icons.manage_search,
                //     color: Colors.black,
                //   ),
                //   onPressed: () {
                //     //print(_isEn);
                //     Navigator.pushNamed(
                //       context,
                //       "Filter",
                //       arguments: {
                //         'isEn': _isEn,
                //         'schoolList': _schoolInfoList!,
                //       },
                //     );
                //   },
                // ),
                PopupMenuButton(
                  icon: const Icon(
                    Icons.segment_sharp,
                    color: Colors.black,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 4,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_upward,
                          ),
                          TextButton(
                            onPressed: () => {(_orderByObjectIdAscend())},
                            child: Text(
                              AppLocalizations.of(context)!
                                  .orderByObjectIdAscend,
                              style: const TextStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_downward,
                          ),
                          TextButton(
                            onPressed: () => {_orderByObjectIdDescend()},
                            child: Text(
                              AppLocalizations.of(context)!
                                  .orderByObjectIdDescend,
                              style: const TextStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 5,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_upward,
                          ),
                          TextButton(
                            onPressed: () => {_orderByNameAscend()},
                            child: Text(
                              AppLocalizations.of(context)!.orderByNameAscend,
                              style: const TextStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 6,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_downward,
                          ),
                          TextButton(
                            onPressed: () => {_orderByNameDescend()},
                            child: Text(
                              AppLocalizations.of(context)!.orderByNameDescend,
                              style: const TextStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LanguageSettingScreen(),
                        ),
                      ).then(
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
              color: Colors.black,
              onRefresh: _refresh,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.symmetric(vertical: 1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: TextField(
                            //  controller: _filter,
                            onSubmitted: (value) {
                              searchMethod(value);
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              hintText:
                                  AppLocalizations.of(context)!.searchHintText,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: _schoolInfoList!.length,
                          itemBuilder: (context, index) {
                            return _isEn
                                ? ListTile(
                                    leading: Text(_schoolInfoList![index]
                                            ['attributes']['OBJECTID']
                                        .toString()),
                                    title: Text(
                                      _schoolInfoList![index]['attributes']
                                          ['ENGLISH_NAME'],
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    subtitle: Text(
                                      _schoolInfoList![index]['attributes']
                                          ['中文名稱'],
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    isThreeLine: false,
                                    dense: true,
                                    onTap: () {
                                      //print(_isEn);
                                      Navigator.pushNamed(
                                        context,
                                        "Details",
                                        arguments: {
                                          'isEn': _isEn,
                                          'index': _schoolInfoList![index],
                                        },
                                      );
                                    },
                                  )
                                : ListTile(
                                    leading: Text(_schoolInfoList![index]
                                            ['attributes']['OBJECTID']
                                        .toString()),
                                    title: Text(
                                      _schoolInfoList![index]['attributes']
                                          ['中文名稱'],
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
                                      //print(_isEn);
                                      Navigator.pushNamed(
                                        context,
                                        "Details",
                                        arguments: {
                                          'isEn': _isEn,
                                          'index': _schoolInfoList![index],
                                        },
                                      );
                                    },
                                  );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
