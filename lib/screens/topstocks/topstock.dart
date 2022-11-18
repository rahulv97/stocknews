import 'package:flutter/material.dart';
import 'package:stocknews/helpers/colors_helper.dart';
import 'package:stocknews/helpers/custom_background.dart';
import 'package:stocknews/models/topstockMarket/topstockModel.dart';

class TopStockPage extends StatefulWidget {
  const TopStockPage({Key? key}) : super(key: key);

  @override
  State<TopStockPage> createState() => _TopStockPageState();
}

class _TopStockPageState extends State<TopStockPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomBackground(),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SizedBox(
                  height: height - (height / 3.8) - 10,
                  child: ListView.builder(
                      itemCount: topstockDataModel.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 5),
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    topstockDataModel[index].bankname,
                                    style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 14,
                                      color: newsdataColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: const DecorationImage(
                                          image: const AssetImage(
                                              "assets/profileimage.jpg"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          topstockDataModel[index].stockname,
                                          style: TextStyle(
                                            fontFamily: 'Segoe UI',
                                            fontSize: 14,
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          topstockDataModel[index]
                                              .watchlistdata,
                                          style: TextStyle(
                                            fontFamily: 'Segoe UI',
                                            fontSize: 14,
                                            color: newsdataColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 60),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/arrowupside.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          topstockDataModel[index].price,
                                          style: const TextStyle(
                                            fontFamily: 'Segoe UI',
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          topstockDataModel[index].increased,
                                          style: const TextStyle(
                                            fontFamily: 'Segoe UI',
                                            fontSize: 14,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: newsdataColor,
                                  thickness: 0.5,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
