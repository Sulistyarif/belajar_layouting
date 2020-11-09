import 'package:flutter/material.dart';

void main() => runApp(ExtendTest());

class ExtendTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            child: Text('Belajar Layout Pake Extend'),
          ),
        ),
        body: Container(
          // margin: EdgeInsets.all(16),
          // padding: EdgeInsets.all(16),
          // color: Colors.lightBlueAccent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.lightBlue,
                  padding: EdgeInsets.all(16),
                  child: Text('1', style: TextStyle(fontSize: 24))
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      color: Colors.green,
                      child: Center(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.motorcycle_outlined,
                              color: Colors.black,
                              size: 24,
                            ),
                            Text('Touring', style: TextStyle(fontSize: 16)),
                          ],
                        )
                      )
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.black38,
                      padding: EdgeInsets.all(16),
                      child: Center(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.people_alt_outlined,
                                color: Colors.black,
                                size: 24,
                              ),
                              Text('Anggota', style: TextStyle(fontSize: 16)),
                            ],
                          )
                      )
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.lime,
                      padding: EdgeInsets.all(16),
                      child: Center(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.account_circle_outlined,
                                color: Colors.black,
                                size: 24,
                              ),
                              Text('Profil', style: TextStyle(fontSize: 16)),
                            ],
                          )
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


class NoExtend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            child: Text('Belajar Layouting'),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          color: Colors.green,
          child: Row(
            children: <Widget>[
              Container(
                color: Colors.red,
                padding: EdgeInsets.all(16),
                child: Text('1', style: TextStyle(fontSize: 24)),
              ),
              Container(
                color: Colors.yellow,
                padding: EdgeInsets.all(16),
                child: Text('2', style: TextStyle(fontSize: 24)),
              ),
              Container(
                color: Colors.purple,
                padding: EdgeInsets.all(16),
                child: Text('3', style: TextStyle(fontSize: 24)),
              ),
              Container(
                color: Colors.pink,
                padding: EdgeInsets.all(16),
                child: Text('4', style: TextStyle(fontSize: 24)),
              ),
              Container(
                color: Colors.lightBlue,
                padding: EdgeInsets.all(16),
                child: Text('5', style: TextStyle(fontSize: 24)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
