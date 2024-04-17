import 'package:The_Data_Fintastic_Whizbangerz_Group/base/extensions/responsiveContext.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<String> bannerList = [
  'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1579621970795-87facc2f976d?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1628348068343-c6a848d2b6dd?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://plus.unsplash.com/premium_photo-1679923677983-02b9f3b166be?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white54,
            ),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            // Consider FLEX
            child: StaggeredGrid.count(
              crossAxisCount: context.responsive(xs: 1, md: 4),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                StaggeredGridTile.extent(
                  crossAxisCellCount: context.responsive(xs: 1),
                  mainAxisExtent: MediaQuery.of(context).size.height *
                      context.responsive(xs: 0.3, md: 4 / 5),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Will I qualify for a loan?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: context.responsive(
                                xs: width / 20,
                                sm: width / 30,
                                md: height / width * 50),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(color: Colors.transparent),
                        Text(
                          'Check your loan eligibility with our calculator in minutes - without affecting your credit score',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: context.responsive(
                              xs: width / 40,
                              sm: width / 60,
                              md: height / width * 40,
                            ),
                            height: 1.5,
                          ),
                        ),
                        Divider(color: Colors.transparent, height: 10),
                        TextButton(
                          onPressed: () {},
                          child: Center(child: Text('Try now!')),
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.purple[400]),
                        ),
                      ],
                    ),
                  ),
                ),
                StaggeredGridTile.extent(
                  crossAxisCellCount: context.responsive(xs: 1, md: 3),
                  mainAxisExtent: MediaQuery.of(context).size.height *
                      context.responsive(xs: 0.5, md: 4 / 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black12,
                    ),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 1,
                      ),
                      items: bannerList
                          .map(
                            (item) => ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              child: Image.network(
                                item,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
