import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:hongkongschoolyellowpages/widget/groupButton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<FilterScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<bool> isSelected = [false, true, false];
  String selectedSchoolLevel = "ALL";
  String selectedStudentsGender = "ALL";
  List<String> schoolLevelList = [
    "ALL",
    "KINDERGARTEN-CUM-CHILD CARE CENTRES",
    "PRIMARY",
    "SECONDARY",
  ];
  List<String> studentsGenderList = [
    "ALL",
    "CO-ED",
    "BOYS",
    "GIRLS",
  ];
  Widget filterType(typeName) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 10.0, .0, .0),
      child: Text(
        typeName,
        style: const TextStyle(fontSize: 18.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.yellow,
          title: const Text(
            "filter",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
          child: Flex(
            crossAxisAlignment: CrossAxisAlignment.start,
            direction: Axis.vertical,
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(),
                    child: ListView(children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            filterType("School Level"),
                            GroupButtonWidget(
                                buttons: schoolLevelList,
                                onSelected: (
                                  index,
                                  isSelected,
                                ) {
                                  selectedSchoolLevel = schoolLevelList[index];
                                }),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(5.0, 20.0, .0, .0),
                              child: Text(
                                "Students Gender",
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                            GroupButtonWidget(
                                buttons: studentsGenderList,
                                onSelected: (
                                  index,
                                  isSelected,
                                ) {
                                  selectedStudentsGender =
                                      studentsGenderList[index];
                                }),
                          ])
                    ])),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextButton(
                          child: const Text('Reset'),
                          onPressed: () {
                            setState(
                              () {
                                initState(); // refresh state
                              },
                            );
                          },
                          style: TextButton.styleFrom(
                              primary: Colors.yellow,
                              backgroundColor: Colors.red,
                              textStyle: const TextStyle(
                                  fontSize: 18, fontStyle: FontStyle.italic)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextButton(
                          child: Text(AppLocalizations.of(context)!.confirm),
                          onPressed: () {
                            print(selectedSchoolLevel);
                          },
                          style: TextButton.styleFrom(
                              primary: Colors.yellow,
                              backgroundColor: Colors.green,
                              textStyle: const TextStyle(
                                  fontSize: 18, fontStyle: FontStyle.italic)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ));
  }
}
