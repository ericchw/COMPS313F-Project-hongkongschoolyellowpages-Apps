import 'dart:convert';
import 'package:dio/dio.dart';
//import 'package:http/http.dart' as http;
//import 'package:hongkongschoolyellowpages/model/schoolInfo.dart';

class SchoolInfoApi {
  Future<List?> getSchoolInfo() async {
    try {
      final response = await Dio().get(
          'https://services3.arcgis.com/6j1KwZfY2fZrfNMR/arcgis/rest/services/Hong_Kong_School_Location_and_Information/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json');
      List<dynamic> features = response.data['features'];
      //for (int i = 0; i < features.length; i++) {}
      //print(features[1]['attributes']['ENGLISH_NAME']);
      //print(features.length);
      return features;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    }
  }

  Future<Map?> getSchoolInfoByIndex(int id) async {
    try {
      final response = await Dio().get(
          'https://services3.arcgis.com/6j1KwZfY2fZrfNMR/arcgis/rest/services/Hong_Kong_School_Location_and_Information/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json');
      List<dynamic>? features = response.data['features'];
      Map<String, dynamic>? attributes = features![id]['attributes'];
      //print(features[id]['OBJECTID']);
      return attributes;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    }
  }
}
