// ignore_for_file: non_constant_identifier_names

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
