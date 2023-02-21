import 'package:flutter/material.dart';

class WidgetStudyBasic extends StatelessWidget {
  const WidgetStudyBasic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('テキスト!'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black),
              child: const Image(
                image: NetworkImage(
                  "https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png",
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                // child: Row(
                //   children: [
                //     Text(
                //       "data",
                //       style: TextStyle(fontWeight: FontWeight.bold),
                //     )
                //   ],
                // ),
              ),
            ],
          )
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
