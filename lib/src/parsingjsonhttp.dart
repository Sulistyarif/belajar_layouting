import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:belajar_layouting/src/news.dart';

class ParsingJsonHttp extends StatefulWidget {
  @override
  _ParsingJsonHttpState createState() => _ParsingJsonHttpState();
}

class _ParsingJsonHttpState extends State<ParsingJsonHttp> {

  List<News> list;

  Future<String> getData() async {

    String link = "https://jsonplaceholder.typicode.com/posts";
    var res = await http.get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
//    print(res.body);

    if(res.statusCode == 200){
      var data = json.decode(res.body);
      var rest = data as List;
//      print(rest);
      list = rest.map<News>((json) => News.fromJson(json)).toList();
      setState(() {
        print(list.toString());
      });
    }
    return "success";
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget listViewWidget(List<News> news) {
    return new MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(title: new Text("Test ListView"), backgroundColor: Colors.blue),
            body: Container(
                child: ListView.builder(
                  itemCount: 20,
                  padding: const EdgeInsets.all(1.5),
                  itemBuilder: (context, posistion){
                    return Card(
                      child: ListTile(
                        title: Text(
                          '${news[posistion].title}',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    );
                  },
                )
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("cikiprit"),
        ),
        body: Container(
          child: Center(
            child: Text("Hello Coeg"),
          ),
        ),
      ),
    );
  }


}


