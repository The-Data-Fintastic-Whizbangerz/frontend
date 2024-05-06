import 'package:The_Data_Fintastic_Whizbangerz_Group/base/extensions/responsiveContext.dart';
import 'package:The_Data_Fintastic_Whizbangerz_Group/base/extensions/themes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({super.key});

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

List<Map<String, dynamic>> profiles = [
  {'image': 'images/avatar-1.jpg', 'name': 'Tammie Chua'},
  {'image': 'images/avatar-2.jpg', 'name': 'Colette Ford'},
  {'image': 'images/avatar-3.jpg', 'name': 'Legie Grieve'},
  {'image': 'images/avatar-4.jpg', 'name': 'Tune Nguyen'},
  {'image': 'images/avatar-5.jpg', 'name': 'Joshua Udemezue'},
];

class _AboutWidgetState extends State<AboutWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Widget avatar_circle({required String image, required String name}) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: width / context.responsive(xs: 9, sm: 12, md: 18, lg: 24),
            backgroundColor: Colors.black26,
            foregroundColor: Colors.white,
            backgroundImage: AssetImage(image),
          ),
          Container(margin: EdgeInsets.all(10), child: Text(name))
        ],
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
                textAlign: TextAlign.center,
                'At CreditWise, we envision a future where accessing financial solutions is straightforward and empowering for everyone.'),
            Text(
                textAlign: TextAlign.center,
                'Our mission is to provide users a seamless loan process experience, tailored to your needs, while priortising your data privacy and security.'),
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
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: aboutus_tile()),
            ),
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Meet Our Team',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        profiles.length - 2,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: avatar_circle(
                            image: profiles[index].values.elementAt(0),
                            name: profiles[index].values.elementAt(1),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        profiles.length - 3,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: avatar_circle(
                            image: profiles[index + 3].values.elementAt(0),
                            name: profiles[index + 3].values.elementAt(1),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
