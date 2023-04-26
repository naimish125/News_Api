import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/news_model.dart';
import '../provider/news_provider.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {

  homeProvider? ht,hf;
  Welcome? w1;

  @override
  void initState() {
    super.initState();

    Provider.of<homeProvider>(context,listen: false).getNews;
  }
  @override
  Widget build(BuildContext context) {

    ht = Provider.of<homeProvider>(context,listen: true);
    hf = Provider.of<homeProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
          centerTitle: true,
          leading: Icon(Icons.menu),
          actions: [Icon(Icons.language)],
          title: Text(
            "News App",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: () {
                      hf!.change("in");
                    },
                        child: Text("in",style: TextStyle(color: Colors.white,fontSize: 17),)),
                    TextButton(onPressed: () {
                      hf!.change("ca");
                    }, child: Text("ca",style: TextStyle(color: Colors.white,fontSize: 17))),
                    TextButton(onPressed: () {
                      hf!.change("au");
                    }, child: Text("au",style: TextStyle(color: Colors.white,fontSize: 17))),
                    TextButton(onPressed: () {
                      hf!.change("us");
                    }, child: Text("us",style: TextStyle(color: Colors.white,fontSize: 17))),
                  ],
                ),
                FutureBuilder(builder: (context, snapshot) {

                  if(snapshot.hasError)
                  {
                    return Text("${snapshot.error}");
                  }
                  else if(snapshot.hasData)
                  {
                    Welcome? w1 = snapshot.data;

                    return Expanded(
                      child: ListView.builder(itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),

                            title: Text("${w1.articles[index].author}",style: TextStyle(color: Colors.black)),

                            subtitle: Text("${w1.articles[index].content}",style: TextStyle(color: Colors.black)),

                          ),
                        );
                      },
                        itemCount: w1!.articles.length,
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                },
                  future: hf!.getNews(ht!.selectedCountry),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}