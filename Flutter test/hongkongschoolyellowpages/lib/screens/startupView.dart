// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:stacked/stacked.dart';
// import 'package:lottie/lottie.dart';
// //https://www.filledstacks.com/post/lottie-splash-screen-intro-in-flutter/

// class StartupViewScreen extends StatefulWidget {
//   @override
//   _StartupViewState createState() => _StartupViewState();
// }

// class _StartupViewState extends State<StartupViewScreen>{
//   @override
//   void initState() {}

//   // Widget buildSearch() => SearchWidget(text: query, hintText: "searchSchoolHintText", onChanged:searchSchool,);
//   // void searchSchool(String query) {final schoolName_zh = )

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<StartupViewModel>.reactive(
//       builder: (context, model, child) => Scaffold(
//         backgroundColor: kcPrimaryColor,
//         body: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               // Image
//               Image.asset(
//                 'assets/logo/logo.png',
//                 height: screenHeightFraction(context, dividedBy: 4),
//               ),
//               verticalSpaceMedium,
//               // Loading indicator
//               CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation(Colors.white),
//               )
//             ],
//           ),
//         ),
//       ),
//       onModelReady: (model) => SchedulerBinding.instance
//           .addPostFrameCallback((_) => model.initialise()),
//       viewModelBuilder: () => StartupViewModel(),
//     );
//   }
// }
// }
