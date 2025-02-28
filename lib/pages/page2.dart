// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
List data = [];
Future<void> fetchdata()async{
  final res = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
  print(res.body.toString());

  setState(() {
    data = json.decode(res.body)['data'];
  });
}

@override
  void initState() {
   
    super.initState();
    fetchdata();
  }

  @override
  Widget build(BuildContext context) {
        var size = MediaQuery.sizeOf(context);
    return Scaffold(
       backgroundColor: Colors.black,
      appBar: AppBar(
        //  actions: [IconButton(onPressed: (){

          
        //  }, icon: Icon(Icons.light_mode_outlined,color: Colors.red,))],
        backgroundColor: Colors.white,
        title: const Text('Person data'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,index){
        return  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.height*0.15,
                  width: size.width*0.90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  //  boxShadow: [BoxShadow(blurRadius: 5,spreadRadius: 3,color: Colors.white10)]
                  ),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  CircleAvatar(backgroundImage: NetworkImage(data[index]['avatar']),),
                  //  Gap(5),
                    
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text(data[index]['first_name'].toString(),style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),),
                       Text((data[index]['email'].toString()) ,style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black),)
                      ]
                    ),
                    const Icon(Icons.person_2_outlined)
                   ],),
                  
                ),
              );
      }),
    );
  }
}