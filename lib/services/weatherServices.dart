
import 'package:dio/dio.dart';
import 'package:untitled/api.dart';
import 'package:untitled/model/weatherModel.dart';

class WeatherServices{

  static Future getLocation( String $city) async{
    final dio =Dio();

    try{
      final response= await dio.get(Api.baseUrl,
          queryParameters: {
            'q':$city,
            'appid':'c202340ac2898ad0762d96b861730f16'
          }
      );
      WeatherModel weatherModel =WeatherModel.fromJson(response.data);

      return weatherModel;



    }on DioError catch(err){
      print(err);

    }
  }





}