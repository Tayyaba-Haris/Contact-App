import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeSreen extends StatefulWidget {
  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  //fetch data dynamic from network request
  var contacts = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      getuserdata();
    });
  }

  Future<void> getuserdata() async {
    try {
      http.Response resp = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      //print(jsonDecode(resp.body)[1]['name']);
      setState(() {
        contacts = jsonDecode(resp.body);
      });
    } catch (err) {
      print(err.toString());
    }

    // .then((res) => print(jsonDecode(res.body)[0]['name']))
    // .catchError((err) {
//                print(err.toString());
    //}
    //);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact App"),
      ),
      body: contacts.length > 0
          ? ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    onTap: () {
                      // print("tapped");
                      Navigator.pushNamed(context, '/about',
                          arguments: contacts[index]);
                    },
                    title: Text(
                      contacts[index]['name'],
                    ),
                  ),
                  elevation: 3,
                );
              },
              itemCount: contacts.length)
          : Center(child: const CircularProgressIndicator()),
    );
  }
}
