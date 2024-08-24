import 'package:dio/dio.dart';
import 'package:flutter_breaking/constants/strings.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get("character");

      // Log the entire response for debugging purposes
      print("Response Data: ${response.data}");

      // Check if the response data is a map and contains the 'results' key
      if (response.data is Map<String, dynamic> &&
          (response.data as Map<String, dynamic>).containsKey('results')) {
        
        // Extract the 'results' list safely
        var results = (response.data as Map<String, dynamic>)['results'];
        
        // Check if 'results' is a List<dynamic>
        if (results is List<dynamic>) {
          return results;
        } else {
          throw Exception("The 'results' field is not a list.");
        }
      } else {
        throw Exception("Unexpected response format. Missing 'results' field.");
      }
    } catch (e) {
      print("Error in getAllCharacters: $e");
      return [];
    }
  }
}




// import 'package:dio/dio.dart';
// import 'package:flutter_breaking/constants/strings.dart';

// class CharactersWebServices {


//   late Dio dio;

//   CharactersWebServices()
//   {
//     BaseOptions options = BaseOptions(
//       baseUrl: baseUrl,
//       receiveDataWhenStatusError: true,
//       connectTimeout: Duration(seconds: 60,),
//       receiveTimeout: Duration(seconds: 60,),
//     );

//     dio = Dio(options);
//   }


//   Future<List<dynamic>> getAllCharacters() async{
    
//     try{
//   Response response = await dio.get("character");
//     print(response.data.toString());
//     return response.data;
  
//     }
//     catch(e){
//       print(e.toString());
//       return [];
//     }
    
//   }


// }