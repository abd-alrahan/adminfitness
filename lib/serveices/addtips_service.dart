import 'package:adminfitness/api/dio_helper.dart';
import 'package:adminfitness/models/models.dart';
import 'package:flutter/material.dart';

class AddtipsService {
  bool tips(TipsModel tipsModel, context) {
    DioHelper.tips(
            description: tipsModel.description,
            category_id: tipsModel.category_id)
        .then((value) {
      print(value.data);
      print(value.statusCode);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tip added successfully')));
      //const SnackBar(content: Text('Tip added successfully'), );
      return value.statusCode == 200;
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed')));
      print(error.toString());
      return false;
    });
    return false;
  }
}
