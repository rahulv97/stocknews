import 'package:flutter/material.dart';
import 'package:stocknews/helpers/colors_helper.dart';
import 'package:stocknews/helpers/custom_background.dart';
import 'package:stocknews/models/homePageModel/homePageModel.dart';
import 'package:stocknews/network/apiprovider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  void _getData() async {
    setState(() {
      isLoading = true;
    });
    await ApiProvider().allNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomBackground(),
                SizedBox(
                  height: height - (height / 3.8) - 55,
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
                          itemCount: homepageDataModel.length,
                          itemBuilder: (context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(20),
                              child: SizedBox(
                                height: 200,
                                child: Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        launchUrl(Uri.parse(
                                            "${homepageDataModel[index].link}"));
                                      },
                                      child: Container(
                                        height: 150,
                                        alignment: Alignment.center,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child:
                                              homepageDataModel[index].image !=
                                                      "null"
                                                  ? Image.network(
                                                      "${homepageDataModel[index].image}",
                                                      fit: BoxFit.cover,
                                                      height: 150,
                                                      width: 200,
                                                    )
                                                  : Image.asset(
                                                      "assets/concept.png",
                                                      fit: BoxFit.cover,
                                                      height: 150,
                                                      width: 200,
                                                    ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 200,
                                      padding: const EdgeInsets.only(top: 80),
                                      child: Container(
                                        height: 150,
                                        width: width,
                                        decoration: BoxDecoration(
                                            color: bgimage.withOpacity(0.8),
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(30),
                                              bottomRight: Radius.circular(30),
                                            )),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 14),
                                            SizedBox(
                                              width: width,
                                              height: 30,
                                              child: Text(
                                                "${homepageDataModel[index].newsdetailsdata}",
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                  fontFamily: 'Segoe UI',
                                                  fontSize: 14,
                                                  color: textColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Text(
                                                  "${homepageDataModel[index].newstime}",
                                                  style: TextStyle(
                                                    fontFamily: 'Segoe UI',
                                                    fontSize: 14,
                                                    color: textColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "${homepageDataModel[index].newsdate}",
                                                  style: TextStyle(
                                                    fontFamily: 'Segoe UI',
                                                    fontSize: 14,
                                                    color: textColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                                height: 50,
                                                alignment:
                                                    Alignment.bottomCenter,
                                                decoration: BoxDecoration(
                                                  color: homePageIconColor,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(30),
                                                    bottomRight:
                                                        Radius.circular(30),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.share,
                                                        color: bgimage,
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Text(
                                                        "Share",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Segoe UI',
                                                          fontSize: 16,
                                                          color: bgimage,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
