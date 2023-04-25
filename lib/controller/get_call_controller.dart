import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/lesson_model.dart';
import '../model/program_model.dart';

class GetCallController {
  Future<ProgramModel?> getProgram() async {
    try {
      final response = await http.get(
        Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/programs'),
      );
      return ProgramModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<LessonModel?> getLessons() async {
    try {
      final response = await http.get(
        Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/lessons'),
      );
      return LessonModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
