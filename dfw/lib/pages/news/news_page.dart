import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.purple[50],
          ),
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.all(15),
                      child: Center(
                          child: Text('Most Recent News',
                              style: TextStyle(color: Colors.black)))),
                  TextButton(
                    child: Center(
                        child: Text('Read More...',
                            style: TextStyle(color: Colors.black))),
                    onPressed: () {},
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Card(
                      margin: EdgeInsets.all(15),
                      child: Container(
                          height: 200,
                          width: 200,
                          child: Center(child: Text('NEWS'))),
                    ),
                    Card(
                      margin: EdgeInsets.all(15),
                      child: Container(
                          height: 200,
                          width: 200,
                          child: Center(child: Text('NEWS'))),
                    ),
                    Card(
                      margin: EdgeInsets.all(15),
                      child: Container(
                          height: 200,
                          width: 200,
                          child: Center(child: Text('NEWS'))),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
