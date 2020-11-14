import 'package:belajar_layouting/Model.dart';

class DaftarRekening{
  bool success;
  int totalData;
  List<Model> models;

  DaftarRekening({this.success, this.totalData, this.models});

  @override
  String toString() {
    // TODO: implement toString
    return 'DaftarRekening{Apakah sukses request: $success, Jumlah data diambil: $totalData, datanya: $models}';
  }

  factory DaftarRekening.fromJson(Map<String, dynamic> json){
    var listRekening = json["models"] as List;

    var iterableRekening = listRekening.map((models){
      return Model.fromJson(models);
    });

    var models = List<Model>.from(iterableRekening);

    return DaftarRekening(
      success: json["success"],
      totalData: json["total"],
      models: models
    );
  }

}