// ignore_for_file: non_constant_identifier_names, avoid_web_libraries_in_flutter

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
  final int? id;

  TipsModel({required this.description, required this.category_id, this.id});

  factory TipsModel.fromJson(Map<String, dynamic> jsondata) {
    return TipsModel(
      description: jsondata['description'],
      category_id: jsondata['category_id'],
      id: jsondata['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'description': description, 'category_id': category_id, 'id': id};
  }
}

class DeitsModel {
  final String time;
  final int day_id;
  final String description;
  final dynamic image;
  final int? id;

  DeitsModel(
      {required this.time,
      required this.day_id,
      required this.description,
      required this.image,
      this.id});

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'day_id': day_id,
      'description': description,
      'image': image,
      'id': id
    };
  }

  factory DeitsModel.fromJson(Map<String, dynamic> json) {
    return DeitsModel(
        time: json['time'],
        day_id: json['day_id'],
        description: json['description'],
        image: json['image'],
        id: json['id']);
  }
}

class ExerciseModel {
  final String name;
  final int time;
  final String description;
  final dynamic json;
  final int? exerciseId;

  ExerciseModel(
      {required this.time,
      required this.name,
      required this.description,
      required this.json,
      this.exerciseId});

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'name': name,
      'description': description,
      'json': json,
      'exerciseId': exerciseId
    };
  }

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
        time: json['time'],
        name: json['name'],
        description: json['description'],
        json: json['json'],
        exerciseId: json['exerciseId']);
  }
}

class CategoryExerciseModel {
  final int exerciseId;
  final int categoryId;

  CategoryExerciseModel(
      {required this.exerciseId,
      required this.categoryId,});

  Map<String, dynamic> toJson() {
    return {
      'exerciseId': exerciseId,
      'categoryId': categoryId,
    };
  }

  factory CategoryExerciseModel.fromJson(Map<String, dynamic> json) {
    return CategoryExerciseModel(
        exerciseId: json['exerciseId'],
        categoryId: json['categoryId'],);
  }
}

class DayExerciseModel {
  final int exerciseId;
  final int dayId;

  DayExerciseModel(
      {required this.exerciseId,
      required this.dayId,});

  Map<String, dynamic> toJson() {
    return {
      'exerciseId': exerciseId,
      'dayId': dayId,
    };
  }

  factory DayExerciseModel.fromJson(Map<String, dynamic> json) {
    return DayExerciseModel(
        exerciseId: json['exerciseId'],
        dayId: json['dayId'],);
  }
}

class UserModel {
  final int id;
  final String name;
  final String age;
  final String email;
  final String gender;
  final String tall;
  final String weight;

  UserModel(
      {required this.id,
      required this.name,
      required this.age,
      required this.email,
      required this.gender,
      required this.tall,
      required this.weight});

  factory UserModel.fromJson(Map<String, dynamic> jsondata) {
    return UserModel(
      id: jsondata['id'],
      name: jsondata['name'],
      age: jsondata['age'],
      email: jsondata['email'],
      gender: jsondata['gender'],
      tall: jsondata['tall'],
      weight: jsondata['weight'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'email': email,
      'gender': gender,
      'tall': tall,
      'weight': weight,
    };
  }
}

class NumuserModel {
  final int count;

  NumuserModel({required this.count});

  factory NumuserModel.fromJson(Map<String, dynamic> jsondata) {
    return NumuserModel(
      count: jsondata['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
    };
  }
}
