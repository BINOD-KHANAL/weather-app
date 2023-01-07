//
//
//
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:untitled/model/weatherModel.dart';
// import 'package:untitled/services/weatherServices.dart';
//
//
// // final newsProvider =StateNotifierProvider.family<GetQueryNews,List<News>,String>((ref,String query) => GetQueryNews(query: query));
// //
// // class GetQueryNews extends StateNotifier<List<News>>{
// //
// //   GetQueryNews({required this.query}):super([]){
// //     getQuery();
// //   }
// //   final String query;
// //   //future halda bitikoi async ra await use garney
// //   Future<void> getQuery()async{
// //     final response = await NewsServices.getNewsQuery(query);
// //     state=response;
// //
// //
// //   }
//
//
// // final searchNewsProvider =StateNotifierProvider<SearchNewsProvider,List<News>>((ref) => SearchNewsProvider());
// // class SearchNewsProvider extends StateNotifier<List<News>>{
// //   SearchNewsProvider():super([]){
// //     getData();
// //   }
// //   Future<void>getData() async{
// //
// //     await Future.delayed(Duration(seconds:7));
// //     final response = await NewsServices.getDefaultNews();
// //     state=response!;
//
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/weatherModel.dart';
import '../services/weatherServices.dart';


final weatherProvider=StateNotifierProvider.family<GetWeather,List<WeatherModel>,String>((ref,String city) => GetWeather(city: city));

class GetWeather extends StateNotifier<List<WeatherModel>>{

  GetWeather({required this.city}):super([]){
    getData();

  }
  final String city;
  Future<void>getData()async{

    final weatherProvider = await WeatherServices.getLocation(city);
    state= weatherProvider;

  }


}

final searchNewsProvider =StateNotifierProvider<SearchNewsProvider,List<WeatherModel>>((ref) => SearchNewsProvider());
class SearchNewsProvider extends StateNotifier<List<WeatherModel>>{
  SearchNewsProvider():super([]){
    getData();
  }
  Future<void>getData() async{

    await Future.delayed(Duration(seconds:7));
    final response = await WeatherServices.getWeather();
    state=response!;
  }
  Future<void> getQuery(String query)async{
    state=[];
    final response = await WeatherServices.getLocation(query);
    state=response;


  }




}





