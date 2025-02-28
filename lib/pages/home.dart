// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data = [];

  Future<void> getdata() async {
    // Initialize an HTTP client
    var client = http.Client();

    try {
      // Making the GET request to the API endpoint
      final getd = await client.get(
        Uri.parse("https://api.nationalize.io/?name=nathaniel"),
      );

      // Checking the status code of the response
      print(getd.statusCode);

      if (getd.statusCode == 200) {
        // If the status code is 200 (OK), parse the body to JSONr
        print(getd.body);

        // Parsing the response body as JSON
        var data = json.decode(getd.body)['country'];

        // Updating the state with the fetched data
        setState(() {
          this.data = data; // Assuming 'data' is a variable in your state
        });
      } else {
        // If the status code is not 200, print an error
        print('Failed to load data: ${getd.statusCode}');
      }
    } catch (e) {
      // Catching any errors in the request process
      print('Error occurred: $e');
    } finally {
      // Close the client after the request is complete to release resources
      client.close();
    }
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Api Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: data.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height * 0.15,
                width: size.width * 0.90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 5, spreadRadius: 3, color: Colors.white10)
                    ]),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSC10aIGcrdtvbwpYkeboJsf9YXZ0K6cwbOMw&s'),
                  ),
                  subtitle: Text(data[index]['probability'].toString()),
                  title: Text(data[index]['country_id'].toString()),
                  trailing: const Icon(
                    Icons.maps_home_work,
                    color: Colors.red,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
