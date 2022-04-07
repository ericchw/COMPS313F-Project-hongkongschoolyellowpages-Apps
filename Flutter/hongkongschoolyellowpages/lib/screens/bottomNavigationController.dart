// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:hongkongschoolyellowpages/screens/home.dart';
// import 'package:hongkongschoolyellowpages/screens/languageSetting.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class BottomNavigationController extends StatefulWidget {
//   @override
//   _BottomNavigationControllerState createState() =>
//       _BottomNavigationControllerState();
// }

// class _BottomNavigationControllerState
//     extends State<BottomNavigationController> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   int _currentIndex = 1;
//   final pages = [HomeScreen(), HomeScreen(), LanguageSettingScreen()];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Theme(
//         data: Theme.of(context).copyWith(
//             // sets the background color of the `BottomNavigationBar`
//             canvasColor: Colors.yellow,
//             // sets the active color of the `BottomNavigationBar` if `Brightness` is light
//             primaryColor: Colors.yellow,
//             textTheme: Theme.of(context)
//                 .textTheme
//                 .copyWith(caption: new TextStyle(color: Colors.yellow))),
//         child: BottomNavigationBar(
//             items: <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.search),
//                 label: AppLocalizations.of(context)!.search,
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: AppLocalizations.of(context)!.home,
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.public),
//                 label: AppLocalizations.of(context)!.language,
//               ),
//             ],
//             selectedItemColor: Colors.blue[800],
//             type: BottomNavigationBarType.fixed,
//             currentIndex: _currentIndex,
//             onTap: _onItemClick),
//       ),
//       resizeToAvoidBottomInset: false,
//       body: pages[_currentIndex],
//     );
//   }

//   void _onItemClick(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
// }
