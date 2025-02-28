// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Capi extends StatefulWidget {
  const Capi({super.key});

  @override
  State<Capi> createState() => _CapiState();
}

class _CapiState extends State<Capi> {
  List data = [];

  Future<void> fetc() async {
    final get = await http.get(Uri.parse('https://api.zippopotam.us/us/33162'));
    print(get.body);
    if (get.statusCode == 200) {
      print(get.statusCode);
      print(get.body.toString());
    }
    setState(() {
      data = json.decode(get.body)['places'];
    });
  }

  @override
  void initState() {
    super.initState();
    fetc();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Data Page',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.red)),
          backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Center(
                child: Container(
                  height: size.height * 0.30,
                  width: size.width * 0.80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: const [BoxShadow(spreadRadius: 1, blurRadius: 5)]),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: size.height * 0.18,
                          width: size.width * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://static.vecteezy.com/system/resources/thumbnails/038/516/357/small/ai-generated-eagle-logo-design-in-black-style-on-transparant-background-png.png'),
                                  fit: BoxFit.cover)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index]['place name'].toString(),
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.red),
                            ),
                            Text(data[index]['latitude'].toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blueGrey)),
                            Text(data[index]['state'].toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue)),
                            Text(data[index]['longitude'].toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
