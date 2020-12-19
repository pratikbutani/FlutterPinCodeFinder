import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'postoffice.dart';

class PostOfficeAPI {
  Future<PostalModel> fetchPincode(http.Client client, String value) async {
    print('Passing Area: $value');
    var finalUrl = 'https://api.postalpincode.in/postoffice/$value';
    print('Passing Area: $value and $finalUrl');
    final response = await client.get(finalUrl);

    // Use the compute function to run parsePhotos in a separate isolate.
    return compute(parsePostalPincode, response.body);
  }
}

// A function that converts a response body into a List.
PostalModel parsePostalPincode(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  PostalModel postalModel = PostalModel.fromJson(parsed[0]);
  return postalModel;
}
