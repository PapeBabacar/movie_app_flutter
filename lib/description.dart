import 'package:flutter/material.dart';
import 'package:test_app_flutter/utils/text.dart';

class Description extends StatelessWidget {
  final String ? name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {Key ?key,
      this.name,
      this.description,
      this.bannerurl,
      this.posterurl,
      this.vote,
      this.launch_on})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Container(
        child: ListView(children: [
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              name ?? 'Not Loaded',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            height: 200,
            width: 100,
            child: Image.network(posterurl!),
          ),
          Container(
              color: Colors.grey,
              padding: EdgeInsets.only(left: 10, top: 20, bottom: 20),
              child: Center(
                  child: modified_text(
                      text: launch_on, size: 14, color: Colors.black))),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              "Synopsis",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            
          ),
          Container(
              padding: EdgeInsets.all(20),
              child: modified_text(
                  text: description, color: Colors.black, size: 16)),
          
        ]),
      ),
    );
  }
}
