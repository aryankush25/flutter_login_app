import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user.dart';

const String base_url = 'https://lets-chat-server-app.herokuapp.com';

class UserRepository {
  Future<User> logIn({
    @required String email,
    @required String password,
  }) async {
    // final body = json.encode({
    //   'email': email,
    //   'password': password,
    // });

    // final response = await http.post(
    //   Uri.https(base_url, 'login'),
    //   body: body,
    // );

    // if (response.statusCode == 200) {
    //   return User.fromJson(
    //     json.decode(
    //       response.body,
    //     ),
    //   );
    // } else {
    //   throw Exception('Failed to load user');
    // }

    const headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$base_url/login'));

    request.body = json.encode({
      'email': email,
      'password': password,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    String responseString = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return User.fromJson(
        json.decode(
          responseString,
        ),
      );
    } else {
      throw Exception('Failed to load user');
    }
  }
}
