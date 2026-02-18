
import 'package:flutter/material.dart';
import 'package:water_consumer/home_screen.dart';

void main(){
  
  runApp(WaterConsumer());
}
class WaterConsumer extends StatelessWidget {
  const WaterConsumer({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: HomeScreen(),

      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.blue
        )
      ),
    );
  }
}
