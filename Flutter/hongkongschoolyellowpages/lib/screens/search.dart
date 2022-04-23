import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: Text(
          AppLocalizations.of(context)!.search,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: body(),
    );
  }

  Widget body() {
    final args = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    bool _isEn = args['isEn'] ?? false;
    List? _serachedSchoolList = args['index'];
    if (_serachedSchoolList!.length != 0) {
      return Column(
        children: <Widget>[
          Expanded(
            child: Card(
              child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: _serachedSchoolList.length,
                itemBuilder: (context, index) {
                  return _isEn
                      ? ListTile(
                          leading: Text(_serachedSchoolList[index]['attributes']
                                  ['OBJECTID']
                              .toString()),
                          title: Text(
                            _serachedSchoolList[index]['attributes']
                                ['ENGLISH_NAME'],
                            style: const TextStyle(fontSize: 14),
                          ),
                          subtitle: Text(
                            _serachedSchoolList[index]['attributes']['中文名稱'],
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
                                'index': _serachedSchoolList[index],
                                "_isEn": _isEn
                              },
                            );
                          },
                        )
                      : ListTile(
                          leading: Text(_serachedSchoolList[index]['attributes']
                                  ['OBJECTID']
                              .toString()),
                          title: Text(
                            _serachedSchoolList[index]['attributes']['中文名稱'],
                            style: const TextStyle(fontSize: 14),
                          ),
                          subtitle: Text(
                            _serachedSchoolList[index]['attributes']
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
                                'index': _serachedSchoolList[index],
                              },
                            );
                          },
                        );
                },
              ),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Expanded(
            child: EmptyWidget(
              image: null,
              packageImage: PackageImage.Image_2,
              title: AppLocalizations.of(context)!.noData,
              subTitle: AppLocalizations.of(context)!.noData,
              titleTextStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                color: const Color(0xff9da9c7),
                fontWeight: FontWeight.w500,
              ),
              subtitleTextStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.025,
                color: const Color(0xffabb8d6),
              ),
            ),
          ),
        ],
      );
    }
  }
}
