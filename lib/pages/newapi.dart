import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_connect.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Newapi extends StatefulWidget {
  const Newapi({super.key});

  @override
  State<Newapi> createState() => _NewapiState();
}

class _NewapiState extends State<Newapi> {
  List data = [];
  List sour = [];

  Future<void> fetch() async {
    final resp = await http.get(Uri.parse(
        'https://datausa.io/api/data?drilldowns=Nation&measures=Population'));
    print(resp.body);

    setState(() {
      data = json.decode(resp.body)['data'];
      sour = json.decode(resp.body)['source'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height: size.height * 0.12,
                      width: size.width * 0.08,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNZJ_RBD0IDHxbtkzIIksOye4ypSvPMFgXlg&s'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(2, 2),
                              blurRadius: 2,
                              spreadRadius: 0.5),
                        ],
                      ),
                    ),
                    Gap(20),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: size.height * 0.12,
                            width: size.width * 0.70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(2, 2),
                                    blurRadius: 2,
                                    spreadRadius: 0.5),
                              ],
                              color: Colors.deepPurple,
                            ),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 23.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      data[index]['Nation'],
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    Gap(10),
                                    Text(
                                      data[index]['Year'].toString(),
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),Container(
                      height: size.height * 0.12,
                      width: size.width * 0.08)
                  ],
                ),
              );
            }),
      ),
    );
  }
}
