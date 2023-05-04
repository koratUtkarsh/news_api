import 'package:flutter/material.dart';
import 'package:news_api/Screen/Model/news_model.dart';
import 'package:provider/provider.dart';

import '../Provider/home_provider.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  Homeprovider? truepro;
  Homeprovider? falsepro;

  @override
  Widget build(BuildContext context) {
    truepro = Provider.of<Homeprovider>(context, listen: true);
    falsepro = Provider.of<Homeprovider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("News Api"),),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(style: ButtonStyle(),
                  onPressed: () {
                    falsepro!.ChangeData("in");
                  },
                  child: Text("in"),
                ),
                TextButton(
                  onPressed: () {
                    falsepro!.ChangeData("us");
                  },
                  child: Text("us"),
                ),
                TextButton(
                  onPressed: () {
                    falsepro!.ChangeData("uk");
                  },
                  child: Text("uk"),
                ),
              ],
            ),
            SizedBox(height:10),
            Expanded(
              child: FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    HomeModel? h1 = snapshot.data;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 80,
                          width: double.infinity,
                          child: Text("${h1.articles![index].title}"),
                        );
                      },
                      itemCount: h1!.articles!.length,
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
                future: falsepro!.newsApiCall(truepro!.Name),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
