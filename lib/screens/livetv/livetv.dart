import 'package:flutter/material.dart';

class LiveTv extends StatefulWidget {
  const LiveTv({Key? key}) : super(key: key);

  @override
  State<LiveTv> createState() => _LiveTvState();
}

class _LiveTvState extends State<LiveTv> {

List channels = [
  "assets/zeebusiness.jpg",
  "assets/starbusiness.png",
  "assets/ndtvbusiness.jpg",
  "assets/cnbcbusinees.png",
  "assets/zeebusiness.jpg",
  "assets/starbusiness.png",
  "assets/ndtvbusiness.jpg",
  "assets/cnbcbusinees.png",
  "assets/zeebusiness.jpg",
  "assets/starbusiness.png",
  "assets/ndtvbusiness.jpg",
  "assets/cnbcbusinees.png",
  "assets/zeebusiness.jpg",
  "assets/starbusiness.png",
  "assets/ndtvbusiness.jpg",
  "assets/cnbcbusinees.png",
  "assets/zeebusiness.jpg",
  "assets/starbusiness.png",
  "assets/ndtvbusiness.jpg",
  "assets/cnbcbusinees.png",
  "assets/zeebusiness.jpg",
  "assets/starbusiness.png",
  "assets/ndtvbusiness.jpg",
  "assets/cnbcbusinees.png",
  "assets/zeebusiness.jpg",
  "assets/starbusiness.png",
  "assets/ndtvbusiness.jpg",
  "assets/cnbcbusinees.png",
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,),
          itemCount: channels.length,
          itemBuilder: (BuildContext, int index){
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(channels[index].toString()))
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
