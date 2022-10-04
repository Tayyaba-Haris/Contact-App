import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //another way of passing data through arguments pass data to a named route
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final name = args['name'];
    final phone = args['phone'];
    final email = args['email'];

    return Scaffold(
      appBar: AppBar(
        title: Text("$name"),
      ),
      body: Container(
        //to cover full width we use double.infinity
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 20,
          ),
          Text(' $phone '),
          const SizedBox(
            height: 20,
          ),
          Text('$email'),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Uri _url = Uri.parse('tel:$phone');

          if (!await launchUrl(_url)) {
            throw 'Could not launch $_url';
          }
        },
        child: Icon(Icons.phone),
      ),
    );
  }
}
