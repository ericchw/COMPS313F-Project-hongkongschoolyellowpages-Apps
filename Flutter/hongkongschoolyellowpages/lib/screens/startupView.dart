import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hongkongschoolyellowpages/l10n/l10n.dart';

import 'package:hongkongschoolyellowpages/screens/tnc.dart';
import 'package:hongkongschoolyellowpages/screens/languageSetting.dart';
import 'package:shared_preferences/shared_preferences.dart';

//https://www.filledstacks.com/post/lottie-splash-screen-intro-in-flutter/

class StartupViewScreen extends StatefulWidget {
  @override
  _StartupViewState createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupViewScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    controller.addStatusListener(
      (status) async {
        if (status == AnimationStatus.completed) {
          Navigator.pop(context);
          controller.reset();
          Navigator.pushNamed(
            context,
            "Tnc",
          );
        }
      },
    );
  }

  void dispose() {
    super.dispose();
  }

  late AnimationController controller;

  void showDoneDialog() => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                'assets/lottie/done.json', //https://lottiefiles.com/69639-done
                repeat: false,
                controller: controller,
                onLoaded: (composition) {
                  controller.duration = composition.duration;
                  controller.forward();
                },
              ),
              Text(
                AppLocalizations.of(context)!.letsgo,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: Text(
          AppLocalizations.of(context)!.hongKongSchoolYellowPages,
          style:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Lottie.asset(
              'assets/lottie/startupView.json', //Lottie.network('https://assets3.lottiefiles.com/datafiles/MaKSoctsyXXTCDOpDktJYEcS3ws5SI6CLDo7iyMc/ex-splash.json'
              animate: true,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                  vertical: MediaQuery.of(context).size.height * 0.01,
                ),
                textStyle: const TextStyle(fontSize: 28),
                primary: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0),
                ),
              ),
              icon: const Icon(Icons.send),
              label: Text(AppLocalizations.of(context)!.start,
                  style: TextStyle(color: Colors.black)),
              onPressed: showDoneDialog,
            )
          ],
        ),
      ),
    );
  }
}
