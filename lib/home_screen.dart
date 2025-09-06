import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  TextEditingController _waterCountInputControler=new TextEditingController();
  int count=0;

  List<WaterConsume> waterConsumeList=[];


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        foregroundColor: Colors.white,

      ),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text("Water Consumer",style: TextStyle(
              fontSize: 30,
              color: Colors.black
            ),),

            Padding(
              padding: const EdgeInsets.all(24),
              child: TextField(

                controller: _waterCountInputControler,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText:'Enter Count',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.blue
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2
                    )
                  ),
                  border: OutlineInputBorder(

                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                      width: 3
                    ),
                    borderRadius: BorderRadius.circular(8)
                  ),
                ),
              ),
            ),


            GestureDetector(
              onTap: _waterConsumeCount,
              child: Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blue
                ),
              
                child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.water_drop,size: 80,color: Colors.white,),
                      Text("Tap Here",style: TextStyle(
                        fontSize: 22,
                        color: Colors.white
                      ),),
                    ],
                  ),
              
              ),
            ),




            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: const Text("History",style: TextStyle(
                fontSize: 18,
                color: Colors.black
              ),),
            ),

 
            Expanded(child: ListView.builder(
              itemCount: waterConsumeList.length,
                primary: false,
                shrinkWrap: true,

                itemBuilder:(context,index){

                return ListTile(
                  leading: CircleAvatar(
                    child: Text("${index+1}"),
                  ),
                  title: Text(DateFormat.yMEd().add_jms().format(waterConsumeList[index].dateTime)),
                  trailing: Text(waterConsumeList[index].waterCount.toString(),style: TextStyle(
                    fontSize: 18
                  ),),
                  
                );


                }

            )
            )







          ],
        ),
      ),

    );
  }



  void _waterConsumeCount(){
    final int glassCount=int.tryParse(_waterCountInputControler.text)?? 0;
    WaterConsume waterConsume=new WaterConsume(dateTime: DateTime.now(), waterCount: glassCount);
    waterConsumeList.add(waterConsume);
    _waterCountInputControler.clear();
    setState(() {});

  }




}// Write Method on top




class WaterConsume{

  final DateTime dateTime;
  final int waterCount;
  WaterConsume({ required this.dateTime, required this.waterCount});

}







