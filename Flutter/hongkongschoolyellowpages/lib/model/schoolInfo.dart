import 'dart:convert';

//part 'schoolInfo.g.dart';
class SchoolInfo {
  List? _features;
  List? get features => this._features;

  set features(List? value) => this._features = value;

  SchoolInfo(this._features);
}

class Attributes {
  int? _objectId;
  int? _schoolNo;
  String? _categoryEn;
  String? _categoryZh;
  String? _nameEn;
  String? _nameZh;
  String? _addressEn;
  String? _addressZh;
  double? _longitudeEn;
  double? _longitudeZh;
  double? _latitudeEn;
  double? _latitudeZh;
  double? _eastingEn;
  double? _eastingZh;
  double? _northingEn;
  double? _northingZh;
  String? _studentsGenderEn;
  String? _studentsGenderZh;
  String? _sessionEn;
  String? _sessionZh;
  String? _districtEn;
  String? _districtZh;
  String? _financeTypeEn;
  String? _financeTypeZh;
  String? _schoolLevelEn;
  String? _schoolLevelZh;
  int? _telephoneEn;
  int? _telephoneZh;
  int? _faxNumberEn;
  int? _faxNumberZh;
  String? _websiteEn;
  String? _websiteZh;
  String? _religionEn;
  String? _religionZh;

  get objectId => this._objectId;

  set objectId(value) => this._objectId = value;

  get schoolNo => this._schoolNo;

  set schoolNo(value) => this._schoolNo = value;

  get categoryEn => this._categoryEn;

  set categoryEn(value) => this._categoryEn = value;

  get categoryZh => this._categoryZh;

  set categoryZh(value) => this._categoryZh = value;

  get nameEn => this._nameEn;

  set nameEn(value) => this._nameEn = value;

  get nameZh => this._nameZh;

  set nameZh(value) => this._nameZh = value;

  get addressEn => this._addressEn;

  set addressEn(value) => this._addressEn = value;

  get addressZh => this._addressZh;

  set addressZh(value) => this._addressZh = value;

  get longitudeEn => this._longitudeEn;

  set longitudeEn(value) => this._longitudeEn = value;

  get longitudeZh => this._longitudeZh;

  set longitudeZh(value) => this._longitudeZh = value;

  get latitudeEn => this._latitudeEn;

  set latitudeEn(value) => this._latitudeEn = value;

  get latitudeZh => this._latitudeZh;

  set latitudeZh(value) => this._latitudeZh = value;

  get eastingEn => this._eastingEn;

  set eastingEn(value) => this._eastingEn = value;

  get eastingZh => this._eastingZh;

  set eastingZh(value) => this._eastingZh = value;

  get northingEn => this._northingEn;

  set northingEn(value) => this._northingEn = value;

  get northingZh => this._northingZh;

  set northingZh(value) => this._northingZh = value;

  get studentsGenderEn => this._studentsGenderEn;

  set studentsGenderEn(value) => this._studentsGenderEn = value;

  get studentsGenderZh => this._studentsGenderZh;

  set studentsGenderZh(value) => this._studentsGenderZh = value;

  get sessionEn => this._sessionEn;

  set sessionEn(value) => this._sessionEn = value;

  get sessionZh => this._sessionZh;

  set sessionZh(value) => this._sessionZh = value;

  get districtEn => this._districtEn;

  set districtEn(value) => this._districtEn = value;

  get districtZh => this._districtZh;

  set districtZh(value) => this._districtZh = value;

  get financeTypeEn => this._financeTypeEn;

  set financeTypeEn(value) => this._financeTypeEn = value;

  get financeTypeZh => this._financeTypeZh;

  set financeTypeZh(value) => this._financeTypeZh = value;

  get schoolLevelEn => this._schoolLevelEn;

  set schoolLevelEn(value) => this._schoolLevelEn = value;

  get schoolLevelZh => this._schoolLevelZh;

  set schoolLevelZh(value) => this._schoolLevelZh = value;

  get telephoneEn => this._telephoneEn;

  set telephoneEn(value) => this._telephoneEn = value;

  get telephoneZh => this._telephoneZh;

  set telephoneZh(value) => this._telephoneZh = value;

  get faxNumberEn => this._faxNumberEn;

  set faxNumberEn(value) => this._faxNumberEn = value;

  get faxNumberZh => this._faxNumberZh;

  set faxNumberZh(value) => this._faxNumberZh = value;

  get websiteEn => this._websiteEn;

  set websiteEn(value) => this._websiteEn = value;

  get websiteZh => this._websiteZh;

  set websiteZh(value) => this._websiteZh = value;

  get religionEn => this._religionEn;

  set religionEn(value) => this._religionEn = value;

  get religionZh => this._religionZh;

  set religionZh(value) => this._religionZh = value;

  Attributes(
    this._objectId,
    this._schoolNo,
    this._categoryEn,
    this._categoryZh,
    this._nameEn,
    this._nameZh,
    this._addressEn,
    this._addressZh,
    this._longitudeEn,
    this._longitudeZh,
    this._latitudeEn,
    this._latitudeZh,
    this._eastingEn,
    this._eastingZh,
    this._northingEn,
    this._northingZh,
    this._studentsGenderEn,
    this._studentsGenderZh,
    this._sessionEn,
    this._sessionZh,
    this._districtEn,
    this._districtZh,
    this._financeTypeEn,
    this._financeTypeZh,
    this._schoolLevelEn,
    this._schoolLevelZh,
    this._telephoneEn,
    this._telephoneZh,
    this._faxNumberEn,
    this._faxNumberZh,
    this._websiteEn,
    this._websiteZh,
    this._religionEn,
    this._religionZh,
  );

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      json['OBJECTID'],
      json['SCHOOL_NO_'],
      json['ENGLISH_CATEGORY'],
      json['中文類別'],
      json['ENGLISH_NAME'],
      json['中文名稱'],
      json['ENGLISH_ADDRESS'],
      json['中文地址'],
      json['LONGITUDE'],
      json['經度'],
      json['LATITUDE'],
      json['緯度'],
      json['EASTING'],
      json['坐標東'],
      json['NORTHING'],
      json['坐標北'],
      json['STUDENTS_GENDER'],
      json['就讀學生性別'],
      json['SESSION'],
      json['學校授課時間'],
      json['DISTRICT'],
      json['分區'],
      json['FINANCE_TYPE'],
      json['資助種類'],
      json['SCHOOL_LEVEL'],
      json['學校類型'],
      json['TELEPHONE'],
      json['聯絡電話'],
      json['FAX_NUMBER'],
      json['傳真號碼'],
      json['WEBSITE'],
      json['網頁'],
      json['RELIGION'],
      json['宗教'],
    );
  }
}
