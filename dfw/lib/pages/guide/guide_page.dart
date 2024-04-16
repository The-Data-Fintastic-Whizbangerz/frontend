import 'package:The_Data_Fintastic_Whizbangerz_Group/base/extensions/responsiveContext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 20, 10),
              child: Text(
                'Guides',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: MasonryGridView.count(
                crossAxisCount: context.responsive(xs: 1, sm: 2, md: 3, lg: 6),
                padding: EdgeInsets.symmetric(horizontal: 20),
                // maxCrossAxisExtent: 200,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          color: Colors.grey,
                          margin: EdgeInsets.all(5),
                        ),
                        Container(
                            height: 50, child: Center(child: Text('Title'))),
                        InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Read More...'),
                            ))
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
