import 'package:flutter/material.dart';

import 'package:hongkongschoolyellowpages/model/schoolInfo.dart';
import 'package:hongkongschoolyellowpages/api/schoolInfoApi.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';
import 'package:maps_launcher/maps_launcher.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    // _getSchoolInfoByIndex(0);
  }

  Map<String, dynamic>? attributes = {};
  bool? _isEn;
  // Map<dynamic, dynamic>? _schoolInfo = {};
  // Future<void> _getSchoolInfoByIndex(int id) async {
  //   _schoolInfo = await SchoolInfoApi().getSchoolInfoByIndex(id);
  //   //print(_schoolInfoList![0]['attributes']['ENGLISH_NAME']);
  //   print(_schoolInfo!['OBJECTID']);
  // }

  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    _isEn = args['isEn'];
    attributes = args['index']['attributes'];

    //print(attributes);
    //print(attributes!['OBJECTID']);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          AppLocalizations.of(context)!.hongKongSchoolYellowPages,
          style:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(AppLocalizations.of(context)!.id +
                attributes!['OBJECTID'].toString()),
            const SizedBox(height: 10),
            Text(AppLocalizations.of(context)!.no +
                attributes!['SCHOOL_NO_'].toString()),
            const SizedBox(height: 10),
            Text("中文類別: " + attributes!['中文類別'].toString()),
            const SizedBox(height: 10),
            Text("中文名稱: " + attributes!['中文名稱'].toString()),
            const SizedBox(height: 10),
            Text(AppLocalizations.of(context)!.address +
                attributes!['中文地址'].toString()),
            const SizedBox(height: 10),
            Text(AppLocalizations.of(context)!.studentGender +
                attributes!['就讀學生性別'].toString()),
            const SizedBox(height: 10),
            Text(AppLocalizations.of(context)!.session +
                attributes!['學校授課時間'].toString()),
            const SizedBox(height: 10),
            Text(AppLocalizations.of(context)!.district +
                attributes!['分區'].toString()),
            const SizedBox(height: 10),
            Text(AppLocalizations.of(context)!.financeType +
                attributes!['資助種類'].toString()),
            const SizedBox(height: 10),
            Row(children: <Widget>[
              Text(AppLocalizations.of(context)!.telephone +
                  attributes!['聯絡電話'].toString() +
                  " "),
              ElevatedButton(
                child: Text(AppLocalizations.of(context)!.call),
                onPressed: () async {
                  FlutterPhoneDirectCaller.callNumber(
                          attributes!['聯絡電話'].toString())
                      .toString();
                },
              ),
            ]),
            const SizedBox(height: 10),
            Text(AppLocalizations.of(context)!.faxNumber +
                attributes!['傳真號碼'].toString()),
            const SizedBox(height: 10),
            Text(AppLocalizations.of(context)!.religon +
                attributes!['宗教'].toString()),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                Text(AppLocalizations.of(context)!.website),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: attributes!['網頁'].toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
                Link(
                  uri: Uri.parse(attributes!['網頁'].toString()),
                  target: LinkTarget.blank,
                  builder: (BuildContext ctx, FollowLink? openLink) {
                    return TextButton.icon(
                      onPressed: openLink,
                      label: Text(AppLocalizations.of(context)!.openLink),
                      icon: const Icon(Icons.read_more),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => MapsLauncher.launchQuery(attributes!['中文地址']),
              child: const Text('LAUNCH QUERY'),
            ),
            ElevatedButton(
              onPressed: () => MapsLauncher.launchCoordinates(
                  attributes!['緯度'],
                  attributes!['經度'],
                  attributes!['緯度'] + ", " + attributes!['經度']),
              child: const Text('LAUNCH COORDINATES'),
            ),
          ],
        ),
      ),
    );
  }
}
