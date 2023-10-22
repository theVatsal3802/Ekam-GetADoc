// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class Package {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  Package({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
  });

  Package copyWith({
    String? id,
    String? title,
    String? description,
    IconData? icon,
  }) {
    return Package(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'icon': icon.codePoint,
    };
  }

  factory Package.fromMap(Map<String, dynamic> map) {
    return Package(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      icon: IconData(map['icon'] as int, fontFamily: 'MaterialIcons'),
    );
  }

  String toJson() => json.encode(toMap());

  factory Package.fromJson(String source) =>
      Package.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<Package> get packages => [
        Package(
          id: "1",
          title: "Messaging",
          description: "Chat with Doctor",
          icon: Icons.chat,
        ),
        Package(
          id: "2",
          title: "Voice Call",
          description: "Voice Call with Doctor",
          icon: Icons.call,
        ),
        Package(
          id: "3",
          title: "Video Call",
          description: "Video Call with Doctor",
          icon: Icons.videocam,
        ),
        Package(
          id: "4",
          title: "In Person",
          description: "In Person Visit with Doctor",
          icon: Icons.person,
        ),
      ];
}
