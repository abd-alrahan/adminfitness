// ignore_for_file: non_constant_identifier_names, avoid_print, deprecated_member_use

import 'package:adminfitness/api/dio_helper.dart';

class DeleteTipService {
  Future<void> deleteTip(int id) async {
    try {
      var response = await DioHelper.deletetip(id);
      print('IN DELETE TIP SERVICE________');
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        print('Tip deleted successfully');
      } else {
        throw Exception('Failed to delete tip');
      }
    } catch (error) {
      print('Error deleting tip: $error');
      throw Exception('Error deleting tip');
    }
  }
}
