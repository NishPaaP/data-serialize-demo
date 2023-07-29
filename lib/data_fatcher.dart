import 'package:api_modelling/connection_helper.dart';
import 'package:api_modelling/constant.dart';
import 'package:api_modelling/modelClass.dart';
import 'package:dio/dio.dart';

class DataFatcher{
    Future<Demo?> fetch_ApprovedTripDetails() async {
      ConnectionHelper _connectionHelper = ConnectionHelper();
    Demo? _demo;
    String url = ApiList.apiURL;
    
    try {
      Response<dynamic>? respose =  await _connectionHelper.getApprovedTripDetailsList(url);
      print(
          "This is the response of approved trips requestes  :  ------ > ${respose!.data} and ${respose.statusCode}");

      if (respose != null) {
        if (respose.statusCode == 200) {
          var resData = respose.data;
          _demo = Demo(
            id: resData['id'],
             uid: resData['uid'], 
             password: resData['password'], 
             firstName: resData['first_name'], 
             lastName: resData['last_name'], 
             username: resData['username'], 
             email: resData['email'],
             avatar: resData['avatar'],
             gender: resData['gender'],
             phoneNumber: resData['phone_number'],
             socialInsuranceNumber: resData['social_insurance_number'],
             
             );
          
          }else {
          print(
              "Server response error  :    ----- > Status Code  : ${respose.statusCode} and ${respose.statusMessage}");
        }
      }
    } catch (error, subTrace) {
      print(
          "Error found while fetching approved trip requests  : ------ >   $error and Subtrace : ----> $subTrace");
    }
    return _demo;
  }


}