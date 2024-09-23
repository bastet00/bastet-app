import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/get_it_injection.dart';

class CacheService {
  final _prefs = getIt<SharedPreferences>();

  Future<bool> setOnBoarding() async {
    try {
      return await _prefs.setString("onBoarding", "onBoarding");
    } catch (e) {
      debugPrint("Error setting onBoarding: $e");
      return false;
    }
  }

  String? getOnBoarding() {
    try {
      final String? onBoarding = _prefs.getString("onBoarding");
      debugPrint("Getting onBoarding: $onBoarding");
      return onBoarding;
    } catch (e) {
      debugPrint("Error getting onBoarding: $e");
      return null;
    }
  }

  Future<bool> clear() async {
    try {
      return await _prefs.clear();
    } catch (e) {
      debugPrint("Error clearing SharedPreferences: $e");
      return false;
    }
  }
}
