import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hongkongschoolyellowpages/api/schoolInfoApi.dart';
// import 'package:hongkongschoolyellowpages/model/schoolInfo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hongkongschoolyellowpages/l10n/l10n.dart';
import 'package:hongkongschoolyellowpages/screens/languageSetting.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _isloading = true;
    _getSchoolInfo();
  }

  final pages = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    LanguageSettingScreen()
  ];
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Search',
      style: optionStyle,
    ),
    Text(
      'Index 1: Home',
      style: optionStyle,
    ),
    Text(
      'Index 2: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool _isloading = true;
  List? _schoolInfoList = [];
  String? language;

  Future<void> _getSchoolInfo() async {
    _schoolInfoList = await SchoolInfoApi().getSchoolInfo();
    print(_schoolInfoList!.length);
    setState(() {
      _isloading = false;
    });
    //print(_schoolInfoList![0]['attributes']['ENGLISH_NAME']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          _isloading
              ? AppLocalizations.of(context)!.loading
              : AppLocalizations.of(context)!.hongKongSchoolYellowPages,
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Card(
          child: ListView.builder(
            itemCount: _schoolInfoList!.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(_schoolInfoList![index]['attributes']['OBJECTID']
                    .toString()),
                title: Text(
                  _schoolInfoList![index]['attributes']['中文名稱'],
                  style: TextStyle(),
                ),
                subtitle: Text(
                  _schoolInfoList![index]['attributes']['ENGLISH_NAME'],
                ),
                isThreeLine: false,
                dense: true,
                onTap: () {
                  Navigator.pushNamed(context, "Details",
                      arguments: {'index': _schoolInfoList![index]});
                },
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cancel),
            label: 'Cancel',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
