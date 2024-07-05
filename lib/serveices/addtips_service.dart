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
      if (value.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tip added successfully')));
      } else {
        ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Failed')));
      }
    }).onError((error, stackTrace) {
      
      print(error.toString());
      
    });
    return false;
  }
}
