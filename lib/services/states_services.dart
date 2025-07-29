import 'package:api_login_signup_app/model/world_states_model.dart';
import 'package:api_login_signup_app/services/utilities/app_url.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/countries_data_model.dart';

class StatesServices {
  Future<WorldStatesModel> fetchWorldStatesRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStateApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<CountryData>> countriesListApi() async {
    try {
      final response = await http.get(Uri.parse(AppUrl.countriesList));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        if (kDebugMode) {
          print(json);
        }
        return data.map((json) => CountryData.fromJson(json)).toList();
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception('Error $e');
    }
  }
}
