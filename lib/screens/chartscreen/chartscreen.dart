import 'package:flutter/material.dart';
import 'package:stocknews/helpers/colors_helper.dart';
import 'package:stocknews/models/newsModel/news_data_model.dart';
import 'package:stocknews/network/apiprovider.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  List newsList = [
    'All',
    'India ',
    'United States',
    'Canada',
    'France ',
    'Germany ',
    'Japan ',
    'Russia  ',
    'United Kingdom ',
    'Australia',
    'UAE'
  ];

  int _selectedIndex = 0;
  bool isLoading = false;

  void getnewsData(var func) async {
    setState(() {
      isLoading = true;
    });
    await func;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getnewsData(ApiProvider().allNews());
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height / 3.8,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        begin: const Alignment(-0.902, 0.0),
                        end: const Alignment(1.169, 0.407),
                        colors: [
                          leftgradient,
                          rightgradient,
                        ],
                        stops: const [0.0, 1.0],
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 10, top: 10),
                          alignment: Alignment.topRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.search,
                                color: bgimage,
                                size: 25,
                              ),
                              const SizedBox(width: 20),
                              Icon(
                                Icons.notifications_outlined,
                                color: bgimage,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "News",
                              style: TextStyle(
                                fontSize: 40,
                                color: bgimage,
                                fontFamily: 'Segoe UI',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: width,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: newsList.length,
                              itemBuilder: (context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Align(
                                    child: UnconstrainedBox(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _selectedIndex = index;
                                            if (index == 0) {
                                              getnewsData(
                                                  ApiProvider().allNews());
                                            } else if (index == 1) {
                                              getnewsData(
                                                  ApiProvider().indiaNews());
                                            } else if (index == 2) {
                                              getnewsData(
                                                  ApiProvider().usaNews());
                                            } else if (index == 3) {
                                              getnewsData(
                                                  ApiProvider().canadaNews());
                                            } else if (index == 4) {
                                              getnewsData(
                                                  ApiProvider().franceNews());
                                            } else if (index == 5) {
                                              getnewsData(
                                                  ApiProvider().germanyNews());
                                            } else if (index == 6) {
                                              getnewsData(
                                                  ApiProvider().japanNews());
                                            } else if (index == 7) {
                                              getnewsData(
                                                  ApiProvider().russiaNews());
                                            } else if (index == 8) {
                                              getnewsData(
                                                  ApiProvider().ukNews());
                                            } else if (index == 9) {
                                              getnewsData(ApiProvider()
                                                  .australiaNews());
                                            } else if (index == 10) {
                                              getnewsData(
                                                  ApiProvider().uaeNews());
                                            }
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            // ignore: unnecessary_null_comparison
                                            color: _selectedIndex != null &&
                                                    _selectedIndex == index
                                                ? Colors.blue
                                                : rightgradient,
                                          ),
                                          child: Text(
                                            newsList[index].toString(),
                                            style: TextStyle(
                                                // ignore: unnecessary_null_comparison
                                                color: _selectedIndex != null &&
                                                        _selectedIndex == index
                                                    ? Colors.white
                                                    : Colors.white,
                                                fontFamily: 'Segoe UI',
                                                letterSpacing: 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: height - (height / 3.8) - 90,
                  child: isLoading
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: leftgradient,
                            ),
                          ],
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: newsDataModel.length,
                          itemBuilder: (context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 10, left: 10, bottom: 5),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: bgimage,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 2,
                                      )
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "${newsDataModel[index].newstime}",
                                          style: TextStyle(
                                            fontFamily: 'Segoe UI',
                                            fontSize: 14,
                                            color: newsdataColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          "${newsDataModel[index].newsdate}",
                                          style: TextStyle(
                                            fontFamily: 'Segoe UI',
                                            fontSize: 14,
                                            color: newsdataColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "${newsDataModel[index].newsdetailsdata}",
                                      style: const TextStyle(
                                        fontFamily: 'Segoe UI',
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })),
            ],
          ),
        ),
      ),
    );
  }
}
