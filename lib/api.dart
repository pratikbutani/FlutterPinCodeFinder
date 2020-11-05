import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'postoffice.dart';

class PostOfficeAPI {
  Future<PostalModel> fetchPhotos(http.Client client, String value) async {
    final response =
        await client.get('https://api.postalpincode.in/postoffice/$value');

    // Use the compute function to run parsePhotos in a separate isolate.
    return compute(parsePostalPincode, response.body);
  }

// A function that converts a response body into a List.
  PostalModel parsePostalPincode(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    print('Parsed : $parsed[0]'); //Getting Log OUTPUT
    PostalModel postalModel = PostalModel.fromJson(parsed[0]);
    print('Postal Model : $postalModel'); //Getting Log OUTPUT
    return postalModel;
  }
}
