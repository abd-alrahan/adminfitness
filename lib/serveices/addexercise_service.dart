import 'package:adminfitness/api/dio_helper.dart';
import 'package:adminfitness/models/models.dart';

// class AddExerciseService {
//   Future<void> add_exercise({
//     required String name,
//     required int time,
//     required String description,
//     required dynamic json,
//     required int categoryId,
//     required int dayId,
//   }) async {
//     try {
//       // Add exercise
//       final response1 = await DioHelper.add_exercise(
//         name: name,
//         time: time,
//         description: description,
//         json: json,
//       );

//       print('IN ADD EXECISE SERVICE');
//       print('IN ADD EXERCISE');
//       print(response1.data);
//       print(response1.statusCode);

//       if (response1.statusCode == 200) {
//         final exerciseId = response1.data['exerciseId'];

//         final response2 = await DioHelper.assign_categoryExercise(
//           exerciseId: exerciseId,
//           categoryId: categoryId,
//         );

//         print('IN ASSIGN CATEGORY TO EXERCISE');
//         print(response2.data);
//         print(response2.statusCode);

//         if (response2.statusCode == 200) {
//           final response3 = await DioHelper.assign_dayExercise(
//             exerciseId: exerciseId,
//             dayId: dayId,
//           );
//         print('IN ASSIGN DAY TO EXERCISE');
//         print(response3.data);
//         print(response3.statusCode);

//           if (response3.statusCode == 200) {
//             print('Exercise added and assigned successfully');
//           } else {
//             print('Failed to assign exercise to day');
//           }
//         } else {
//           print('Failed to assign exercise to category');
//         }
//       } else {
//         print('Failed to add exercise');
//       }
//     } catch (e) {
//       print('Error during exercise creation and assignment: $e');
//     }
//   }
// }

class AddExerciseService {
  Future<bool> addExerciseWithAssignments({
    required ExerciseModel exerciseModel,
    required int categoryId,
    required int dayId,
  }) async {
    try {
      // Step 1: Add Exercise
      var exerciseResponse = await DioHelper.add_exercise(
        name: exerciseModel.name,
        time: exerciseModel.time,
        description: exerciseModel.description,
        json: exerciseModel.json,
      );

      print('IN SERVICE_______________');
      print('IN ADD EXERCISE');
      print(exerciseModel.name);
      print(exerciseModel.time);
      print(exerciseModel.exerciseId);
      print(exerciseModel.description);
      print(exerciseResponse.statusCode);
      print('Response data: ${exerciseResponse.data}');

      if (exerciseResponse.statusCode == 200) {
        // Extract exercise ID from the response
        final responsedata = exerciseResponse.data['data'];
        final exerciseId = responsedata['id'];
        print(exerciseId);
        // Step 2: Assign Category
        var categoryResponse = await DioHelper.assign_categoryExercise(
          exerciseId: exerciseId!,
          categoryId: categoryId,
        );

        print('IN ASSIGN CATEGORY TO EXERCISE');
        print(exerciseId);
        print(categoryId);
        print(categoryResponse.statusCode);
        print('Response data: ${categoryResponse.data}');

        if (categoryResponse.statusCode == 200) {
          // Step 3: Assign Day
          var dayResponse = await DioHelper.assign_dayExercise(
            exerciseId: exerciseId!,
            dayId: dayId,
          );

          print('IN ASSIGN DAY TO EXERCISE');
          print(exerciseId);
          print(dayId);
          print(dayResponse.statusCode);
          print('Response data: ${dayResponse.data}');

          if (dayResponse.statusCode == 200) {
            print('Exercise added and assigned successfully');
            return true;
          } else {
            print('Failed to assign exercise to day');
            return false;
          }
        } else {
          print('Failed to assign exercise to category');
          return false;
        }
      } else {
        print('Failed to add exercise');
        return false;
      }
    } catch (error) {
      print('Service error: $error');
      return false;
    }
  }
}
