import 'package:The_Data_Fintastic_Whizbangerz_Group/base/extensions/responsiveContext.dart';
import 'package:The_Data_Fintastic_Whizbangerz_Group/base/extensions/themes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({super.key});

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    print(width);
    Widget avatar_circle() {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width / 50, vertical: height / 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: width / context.responsive(sm: 7, md: 12, lg: 16, xl: 20),
              backgroundColor: Colors.black26,
              foregroundColor: Colors.white,
              child: Text('Image'),
            ),
            Text('Name')
          ],
        ),
      );
    }

    Widget aboutus_tile() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'About Us',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
                'At LoanWise, we envision a future where accessing financial solutions is straightforward and empowering for everyone.'),
            Text(
                'Our mission is to provide users a seamless loan process experience, tailored to your needs, while priortising your data privacy and security.'),
            TextButton(
              onPressed: () {},
              child: Text('Get Started'),
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple[400]),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.pink[50]!,
                        Colors.purple[100]!,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.3, 0.7, 1],
                    ),
                  ),
                  child: aboutus_tile()),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Meet Our Team',
                      style: TextStyle(fontSize: 40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        avatar_circle(),
                        avatar_circle(),
                        avatar_circle(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        avatar_circle(),
                        avatar_circle(),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
