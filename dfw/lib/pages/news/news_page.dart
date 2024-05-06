import 'package:The_Data_Fintastic_Whizbangerz_Group/base/extensions/responsiveContext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../error/construction_page.dart';

List<Map<String, dynamic>> news = [
  {
    'image':
        'https://i2-prod.mirror.co.uk/incoming/article4987159.ece/ALTERNATES/s1200d/Senior-woman-inserting-coins-into-piggybank.jpg',
    'title':
        'Bank of England holds base rate at 5.25% despite rise in inflation',
    'description':
        'We explore Bank of England’s decision to maintain base rate amidst inflation surge.',
    'url':
        'https://www.mirror.co.uk/money/what-cashback-websites-can-really-8684198',
  },
  {
    'image':
        'https://www.ft.com/__origami/service/image/v2/images/raw/https://d1e00ek4ebabms.cloudfront.net/production/49e034bd-c89f-44a4-99d5-adbca2082965.jpg?source=next-barrier-page',
    'title': 'Falling food prices see UK Inflation unexpected hold at 4%',
    'description':
        'Inflation has unexpectedly held at 4% due to falling food prices, based on information from the Office of National Statistics (ONS)',
    'url': 'https://www.ft.com/content/42c4bece-abd9-4e02-a403-66f1a29647b4',
  },
  {
    'image':
        'https://www.moneysavingexpert.com/content/dam/mse/editorial-image-library/homepage/hero-homepage-tip-cash-isa-savers-undepaid-fixed-cash-isa.png.rendition.992.992.png',
    'title': 'The best UK cash ISA rates this week',
    'description': 'Our team of experts discuss the best ISA rates in the UK',
    'url':
        'https://www.moneysavingexpert.com/news/2023/january/martin-lewis-cash-isa-itv-show/',
  },
  {
    'image':
        'https://www.moneysavingexpert.com/content/dam/hero-lloyds-bank.jpg.rendition.992.992.jpg',
    'title': 'Lloyds Bank announces £175 switching incentive',
    'description':
        'Lloyds Bank is offering £175 for account holders to switch to them',
    'url':
        'https://www.moneysavingexpert.com/news/2018/11/lloyds-hikes-overdraft-fees-for-most-with-new-charging-structure/',
  },
];

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.purple[50],
          ),
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
                          child: Text(
                        'Most Recent News',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ))),
                  TextButton(
                    child: Center(
                        child: Text('Read More...',
                            style: TextStyle(color: Colors.black))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConstructionPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Expanded(
                child: MasonryGridView.count(
                  crossAxisCount:
                      context.responsive(xs: 2, sm: 3, md: 4, lg: 5),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  // maxCrossAxisExtent: 200,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.vertical(
                                  top: Radius.circular(10)),
                              color: Colors.grey,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  news[index].values.elementAt(0),
                                ),
                                // image: AssetImage(
                                //   'images/guide-1.png',
                                // ),
                              ),
                            ),
                          ),
                          Container(
                              // color: Colors.red,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 80,
                              child: Center(
                                  child: Text(
                                news[index].values.elementAt(1),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ))),
                          Container(
                              // color: Colors.red,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 80,
                              child: Center(
                                  child: Text(
                                news[index].values.elementAt(2),
                              ))),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ConstructionPage(),
                                  ),
                                );
                              },
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
          )),
    );
  }
}
