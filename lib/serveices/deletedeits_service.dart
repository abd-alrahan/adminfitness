// ignore_for_file: non_constant_identifier_names, avoid_print, deprecated_member_use

import 'package:adminfitness/api/dio_helper.dart';

class DeleteDeitService {
  Future<void> deleteDiet(int dayId , int id) async {
    try {
      var response = await DioHelper.delete_deits(dayId: dayId , id: id);
      print('IN DELETE DIET SERVICE________');
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        print('Diet deleted successfully');
      } else {
        throw Exception('Failed to delete diet');
      }
    } catch (error) {
      print('Error deleting diet: $error');
      throw Exception('Error deleting diet');
    }
  }
}
