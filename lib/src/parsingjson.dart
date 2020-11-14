import 'dart:convert';

import 'package:belajar_layouting/DaftarRekening.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:belajar_layouting/Model.dart';

class ListViewAPI extends StatefulWidget {
  @override
  _ListViewAPIState createState() => _ListViewAPIState();
}

class _ListViewAPIState extends State<ListViewAPI> {

  List<Model> list;

  var dummyArray = [
    "Belanja Rutin",
    "Operasional",
    "Lain-lain",
    "Aset"
  ];

  Future loadJson() async{
    String jsonDaftar = await rootBundle.loadString("daftar_rekening.json");
    final jsonData = json.decode(jsonDaftar);
    var dataRekening = jsonData["result"] as List;
    list = dataRekening.map<Model>((json) => Model.fromJson(json)).toList();
    setState(() {
      for(int i = 0; i<list.length; i++){
        print(list[i].rekening);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Container(
              child: Text('Tampilin Array API di Listview'),
            )
        ),
        body: _buildListView(),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, index){
          return _buildItemColumn(list[index]);
        }
    );
  }

  Widget _buildItemColumn(Model list) {
    return Row(
      children: <Widget>[
        Image(image: AssetImage('noimage.png')),
        Text(list.idRekening.toString()),
        Text("  "),
        Text(artiKodeRekening(list.kodeRekening)),
        Text("  "),
        Text(list.rekening),
        Text("  "),
        Text(artiStatus(list.status))
      ],
    );
  }

  String artiKodeRekening(String kodeRekening) {
    String artiKode = "";
    switch(int.parse(kodeRekening)){
      case 1:{
        artiKode = "rekening tabungan";
        break;
      }
      case 2:{
        artiKode = "rekening pembelian";
        break;
      }
      case 3:{
        artiKode = "rekening bersama";
      }
    }
    return artiKode;
  }


  String artiStatus(int status) {
    String artiStatus = "";
    if(status == 1){
      artiStatus = "Status Aktif";
    }else{
      artiStatus = "Status Tidak Aktif";
    }
    return artiStatus;
  }

}

class ParseJson extends StatefulWidget {
  @override
  _ParseJsonState createState() => _ParseJsonState();
}

class _ParseJsonState extends State<ParseJson> {

  String _jsonContent = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            child: Text('Flutter JSON'),
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
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            disabledColor: Colors.grey,
                            disabledTextColor: Colors.black,
                            padding: EdgeInsets.all(8.0),
                            splashColor: Colors.blueAccent,
                            onPressed: (){
//                            _loadDaftarJson();
                              _loadModelRekening();
//                            _loadSampleJson();
                            },
                            child: Text("Get Data"),
                          ),
                          Text(_jsonContent, textAlign: TextAlign.center)
                        ],
                      ),
                    )
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


  Future _loadSampleJson() async {
    String jsonString = await rootBundle.loadString("rekening.json");
    final jsonData = json.decode(jsonString);
    Model model = Model.fromJson(jsonData);
    setState(() {
      _jsonContent = model.toString();
//    _jsonContent = "kampala";
      // sample.name => you can access field from class model
    });
  }

  Future _loadDaftarJson() async{
    String jsonDaftar = await rootBundle.loadString("daftar_rekening.json");
    final jsonData = json.decode(jsonDaftar);
    DaftarRekening daftarRekening = DaftarRekening.fromJson(jsonData);
    setState(() {
      _jsonContent = daftarRekening.toString();
//      _jsonContent = "nyahuu";
    });
  }

  Future _loadModelRekening() async{
    String jsonDaftar = await rootBundle.loadString("daftar_rekening.json");
    final jsonData = json.decode(jsonDaftar);
//    ModelArray modelArray = ModelArray.fromJson(jsonData);
    var dataRekening = jsonData["result"] as List;
    setState(() {
//      _jsonContent = modelArray.toString();
//      _jsonContent = "nyahoo";
//    _jsonContent = dataRekening;
      List<Model> list;
      list = dataRekening.map<Model>((json) => Model.fromJson(json)).toList();
//    print(list[2].rekening);
      for(int i = 0; i<list.length ; i++){
        print(list[i].rekening);
      }
    });
  }

}