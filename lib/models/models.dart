// ignore_for_file: non_constant_identifier_names

import 'dart:typed_data';

class LogInModel {
  final String email;
  final String password;

  LogInModel({required this.email, required this.password});

  factory LogInModel.fromJson(Map<String, dynamic> jsondata) {
    return LogInModel(
      email: jsondata['email'],
      password: jsondata['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class TipsModel {
  final String description;
  final int category_id;

  TipsModel({required this.description, required this.category_id});

  factory TipsModel.fromJson(Map<String, dynamic> jsondata) {
    return TipsModel(
      description: jsondata['description'],
      category_id: jsondata['category_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'category_id': category_id,
    };
  }
}

class DeitsModel {
  final String time;
  final int day_id;
  final String description;
  final Uint8List image;

  DeitsModel(
      {required this.time,
      required this.day_id,
      required this.description,
      required this.image});

  factory DeitsModel.fromJson(Map<String, dynamic> jsondata) {
    return DeitsModel(
      time: jsondata['time'],
      day_id: jsondata['day_id'],
      description: jsondata['description'],
      image: jsondata['image'], // Ensure your backend can handle this
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'day_id': day_id,
      'description': description,
      'image': image, // Ensure your backend can handle this
    };
  }
}
