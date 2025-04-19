import 'dart:convert';

import 'package:http/http.dart';
import 'package:slave_app/models/task.dart';

const String baseUri = "https://bored.api.lewagon.com/api/activity";

Future<dynamic> downloadTask (String? params) async {
  var uriStr = baseUri;
  if (params != null) {
    uriStr += params;
  }
  final uri = Uri.parse(uriStr);
  try {
    final response = await get(uri);
    if (response.statusCode == 200) {
      final dynamic jsonData = jsonDecode(response.body);
      return jsonData;
    }
  } catch (error) {
    return null;
  }
  return null;
}

Future<Task?> getTasks(TaskCategory category) async {
  final params = "?type=${category != TaskCategory.random? category.name.toString() : null}";
  final rawData = await downloadTask(params);
  if (rawData != null) {
    return Task.fromJson(rawData);
  }
  return null;
}
