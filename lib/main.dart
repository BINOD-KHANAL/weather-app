
import 'package:flutter/material.dart';
import 'package:untitled/model/weatherModel.dart';
import 'package:untitled/services/weatherServices.dart';

void main(){

  runApp(MyApp());

}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('WeatherApp'),
        ),

        body: Column(
          children: [
            TextFormField(
              controller: controller,
            ),
            ElevatedButton(onPressed:()async{

              WeatherModel a= await WeatherServices.getLocation(controller.text);
              print(a.name);
              print(a.main?.temp);
            }, child: Text('Search'))


          ],
        ),
      ),
    );
  }
}
