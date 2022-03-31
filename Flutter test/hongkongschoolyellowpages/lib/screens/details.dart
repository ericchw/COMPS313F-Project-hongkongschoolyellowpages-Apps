import 'package:flutter/material.dart';
import 'package:hongkongschoolyellowpages/api/schoolInfoApi.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  // Map<dynamic, dynamic>? _schoolInfo = {};
  // Future<void> _getSchoolInfoByIndex(int id) async {
  //   _schoolInfo = await SchoolInfoApi().getSchoolInfoByIndex(id);
  //   //print(_schoolInfoList![0]['attributes']['ENGLISH_NAME']);
  //   print(_schoolInfo!['OBJECTID']);
  // }

  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    attributes = args['index']['attributes'];
    print(attributes);
    print(attributes!['OBJECTID']);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          "AppLocalizations.of(context)!.hongKongSchoolYellowPages",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("ID: " + attributes!['OBJECTID'].toString()),
            SizedBox(height: 10),
            Text("學校編號: " + attributes!['SCHOOL_NO_'].toString()),
            SizedBox(height: 10),
            Text("中文類別: " + attributes!['中文類別'].toString()),
            SizedBox(height: 10),
            Text("中文名稱: " + attributes!['中文名稱'].toString()),
            SizedBox(height: 10),
            Text("中文地址: " + attributes!['中文地址'].toString()),
            SizedBox(height: 10),
            Text("就讀學生性別: " + attributes!['就讀學生性別'].toString()),
            SizedBox(height: 10),
            Text("學校授課時間: " + attributes!['學校授課時間'].toString()),
            SizedBox(height: 10),
            Text("分區: " + attributes!['分區'].toString()),
            SizedBox(height: 10),
            Text("資助種類: " + attributes!['資助種類'].toString()),
            SizedBox(height: 10),
            Text("聯絡電話: " + attributes!['聯絡電話'].toString()),
            SizedBox(height: 10),
            Text("傳真號碼: " + attributes!['傳真號碼'].toString()),
            SizedBox(height: 10),
            Text("宗教: " + attributes!['宗教'].toString()),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Text("網頁:"),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: attributes!['網頁'].toString(),
                        style: TextStyle(
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
                      label: const Text('打開'),
                      icon: const Icon(Icons.read_more),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () =>
                  MapsLauncher.launchQuery(attributes!['中文地址'].toString()),
              child: Text('LAUNCH QUERY'),
            ),
            ElevatedButton(
              onPressed: () => MapsLauncher.launchCoordinates(
                  attributes!['緯度'],
                  attributes!['經度'],
                  attributes!['緯度'].toString() +
                      ", " +
                      attributes!['經度'].toString()),
              child: Text('LAUNCH COORDINATES'),
            ),
          ],
        ),
      ),
    );
  }
}
