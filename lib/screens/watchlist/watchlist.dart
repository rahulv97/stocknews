import 'package:flutter/material.dart';
import 'package:stocknews/helpers/colors_helper.dart';
import 'package:stocknews/helpers/custom_background.dart';
import 'package:stocknews/models/watchlist/watchlistmodel.dart';

class WatchList extends StatefulWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
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
                  height: height - (height / 3.8) - 65,
                  child: ListView.builder(
                      itemCount: watchlistDataModel.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: SizedBox(
                            width: width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    watchlistDataModel[index].bankname,
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
                                        image: DecorationImage(
                                          image: AssetImage(
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
                                          watchlistDataModel[index].stockname,
                                          style: TextStyle(
                                            fontFamily: 'Segoe UI',
                                            fontSize: 14,
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          watchlistDataModel[index]
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
                                    const SizedBox(width: 80),
                                    Column(
                                      children: [
                                        Text(
                                          watchlistDataModel[index].price,
                                          style: TextStyle(
                                            fontFamily: 'Segoe UI',
                                            fontSize: 14,
                                            color: newsdataColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          watchlistDataModel[index].increased,
                                          style: TextStyle(
                                            fontFamily: 'Segoe UI',
                                            fontSize: 14,
                                            color: newsdataColor,
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
                                )
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
