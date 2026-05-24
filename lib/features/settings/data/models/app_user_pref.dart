import 'package:flutter/material.dart';

class AppUserPref {
  final String lang;
  final int langIndex;
  final ThemeMode theme;
  AppUserPref({
    required this.lang,
    required this.langIndex,
    required this.theme,
  });

  factory AppUserPref.standard() {
    return AppUserPref(lang: "ar", langIndex: 1, theme: ThemeMode.dark);
  }

  AppUserPref copyWith({
    String? lang,
    int? langIndex,
    ThemeMode? theme,
    bool? isFirstTime,
    bool? notificationsEnabled,
    bool? vibrationEnabled,
  }) {
    return AppUserPref(
      lang: lang ?? this.lang,
      langIndex: langIndex ?? this.langIndex,
      theme: theme ?? this.theme,
    );
  }

  factory AppUserPref.fromJson(Map<String, dynamic> json) {
    return AppUserPref(
      lang: json['lang'] as String,
      langIndex: json['langIndex'] as int? ?? 0,
      theme: ThemeMode.values[json['theme'] as int],
    );
  }

  Map<String, dynamic> toJson() {
    return {'lang': lang, 'langIndex': langIndex, 'theme': theme.index};
  }
}
