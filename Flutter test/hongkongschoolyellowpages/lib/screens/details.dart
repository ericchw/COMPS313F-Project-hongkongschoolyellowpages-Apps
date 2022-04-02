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

  Future<Null> _refresh() async {
    initState();
    return;
  }

  Map<String, dynamic>? _attributes = {};
  // Map<dynamic, dynamic>? _schoolInfo = {};
  // Future<void> _getSchoolInfoByIndex(int id) async {
  //   _schoolInfo = await SchoolInfoApi().getSchoolInfoByIndex(id);
  //   //print(_schoolInfoList![0]['attributes']['ENGLISH_NAME']);
  //   print(_schoolInfo!['OBJECTID']);
  // }

  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    bool _isEn = args['isEn'] ?? true;
    _attributes = args['index']['attributes'];
    // bool _isEn = args['isEn'];
    // if (_isEn == true) {
    //   print("2nd is en");
    // } else {
    //   print("2nd not en");
    // }

    //print(attributes);
    //print(attributes!['OBJECTID']);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.yellow,
        title: Text(
          AppLocalizations.of(context)!.details,
          style:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        // child: Card(
        //   child: ListView.builder(
        //     shrinkWrap: true,
        //     physics: ScrollPhysics(),
        //     itemCount: _attributes!.length,
        //     itemBuilder: (BuildContext context, int index) {
        //       String key = _attributes!.keys.elementAt(index);
        //       return new Column(
        //         children: <Widget>[
        //           new ListTile(
        //             title: new Text("$key"),
        //             subtitle: new Text("${_attributes![key]}"),
        //           ),
        //           new Divider(
        //             height: 2.0,
        //           ),
        //         ],
        //       );
        //     },
        //   ),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                _isEn
                    ? Text(
                        AppLocalizations.of(context)!.id +
                            _attributes!['OBJECTID'].toString(),
                      )
                    : Text(
                        AppLocalizations.of(context)!.id +
                            _attributes!['OBJECTID'].toString(),
                      ),
              ],
            ),
            const SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                _isEn
                    ? Text(AppLocalizations.of(context)!.no +
                        _attributes!['SCHOOL_NO_'].toString())
                    : Text(AppLocalizations.of(context)!.no +
                        _attributes!['SCHOOL_NO_'].toString())
              ],
            ),
            const SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                _isEn
                    ? Text(AppLocalizations.of(context)!.category +
                        _attributes!['ENGLISH_CATEGORY'].toString())
                    : Text(AppLocalizations.of(context)!.category +
                        _attributes!['中文類別'].toString()),
              ],
            ),
            const SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                _isEn
                    ? Text(AppLocalizations.of(context)!.name +
                        _attributes!['ENGLISH_NAME'].toString())
                    : Text(AppLocalizations.of(context)!.name +
                        _attributes!['中文名稱'].toString()),
              ],
            ),
            const SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                _isEn
                    ? Text(AppLocalizations.of(context)!.address +
                        _attributes!['ENGLISH_ADDRESS'].toString())
                    : Text(AppLocalizations.of(context)!.address +
                        _attributes!['中文地址'].toString()),
              ],
            ),
            const SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                _isEn
                    ? Text(AppLocalizations.of(context)!.studentGender +
                        _attributes!['STUDENTS_GENDER'].toString())
                    : Text(AppLocalizations.of(context)!.studentGender +
                        _attributes!['就讀學生性別'].toString()),
              ],
            ),
            const SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                _isEn
                    ? Text(AppLocalizations.of(context)!.session +
                        _attributes!['SESSION'].toString())
                    : Text(AppLocalizations.of(context)!.session +
                        _attributes!['學校授課時間'].toString()),
              ],
            ),
            const SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                _isEn
                    ? Text(AppLocalizations.of(context)!.district +
                        _attributes!['DISTRICT'].toString())
                    : Text(AppLocalizations.of(context)!.district +
                        _attributes!['分區'].toString()),
              ],
            ),
            const SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                _isEn
                    ? Text(AppLocalizations.of(context)!.financeType +
                        _attributes!['FINANCE_TYPE'].toString())
                    : Text(AppLocalizations.of(context)!.financeType +
                        _attributes!['資助種類'].toString()),
              ],
            ),
            const SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                _isEn
                    ? Text(AppLocalizations.of(context)!.level +
                        _attributes!['SCHOOL_LEVEL'].toString())
                    : Text(AppLocalizations.of(context)!.level +
                        _attributes!['資助學校類型種類'].toString()),
              ],
            ),
            const SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                _isEn
                    ? Text(AppLocalizations.of(context)!.telephone +
                        _attributes!['TELEPHONE'].toString())
                    : Text(AppLocalizations.of(context)!.telephone +
                        _attributes!['聯絡電話'].toString()),
                ElevatedButton(
                  child: Text(AppLocalizations.of(context)!.call),
                  onPressed: () async {
                    FlutterPhoneDirectCaller.callNumber(_isEn
                            ? _attributes!['TELEPHONE'].toString()
                            : _attributes!['聯絡電話'].toString())
                        .toString();
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                _isEn
                    ? Text(AppLocalizations.of(context)!.faxNumber +
                        _attributes!['FAX_NUMBER'].toString())
                    : Text(AppLocalizations.of(context)!.faxNumber +
                        _attributes!['傳真號碼'].toString()),
              ],
            ),
            const SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                _isEn
                    ? Text(AppLocalizations.of(context)!.religon +
                        _attributes!['RELIGION'].toString())
                    : Text(AppLocalizations.of(context)!.religon +
                        _attributes!['宗教'].toString()),
              ],
            ),
            const SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                _isEn
                    ? Text(AppLocalizations.of(context)!.website)
                    : Text(AppLocalizations.of(context)!.website),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: _isEn
                            ? _attributes!['WEBSITE'].toString()
                            : _attributes!['網頁'].toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
                Link(
                  uri: Uri.parse(_isEn
                      ? _attributes!['WEBSITE'].toString()
                      : _attributes!['網頁'].toString()),
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
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                // ElevatedButton(
                //   onPressed: () =>
                //       MapsLauncher.launchQuery(_attributes!['中文地址']),
                //   child: const Text('LAUNCH QUERY'),
                // ),
                ElevatedButton(
                  onPressed: () => MapsLauncher.launchCoordinates(
                      _attributes!['緯度'],
                      _attributes!['經度'],
                      _attributes!['緯度'].toString() +
                          ", " +
                          _attributes!['經度'].toString()),
                  child: Text(AppLocalizations.of(context)!.openMap),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
