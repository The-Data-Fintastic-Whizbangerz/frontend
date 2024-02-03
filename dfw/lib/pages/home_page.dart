import 'package:flutter/material.dart';
import '../base/models/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

User? user;

final List<String> bannerList = [
  'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1579621970795-87facc2f976d?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1628348068343-c6a848d2b6dd?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://plus.unsplash.com/premium_photo-1679923677983-02b9f3b166be?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
];

// test as news
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    // return BlocListener<AuthBloc, AuthState>(
    //   listener: (context, state) {
    //     if (state.status is StatusAuthenticated) {
    //       print('Status -> Home: ' + state.status.toString());
    //       user = User(
    //           uuid: const Uuid().v4(),
    //           username: state.username,
    //           password: state.password);
    //     }
    //     if (state.status is StatusUnauthenticated) {
    //       print('Status -> Home: ' + state.status.toString());
    //       user = null;
    //     }
    //   },
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // CarouselSlider(
        //   options: CarouselOptions(
        //     autoPlay: true,
        //     height: context.responsive(sm: 250, md: 350, lg: 450),
        //   ),
        //   items: bannerList
        //       .map(
        //         (item) => Container(
        //           padding: EdgeInsets.all(5),
        //           child: Center(
        //             child: Image.network(
        //               item,
        //               fit: BoxFit.cover,
        //               width: width,
        //             ),
        //           ),
        //         ),
        //       )
        //       .toList(),
        // ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white54,
            ),
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Center(
              child: Text('Banner Here'),
            ),
          ),
        ),
      ],
    );
  }
}
