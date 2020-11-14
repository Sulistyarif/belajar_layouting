
class ModelArray{
  bool success;
  int total;
  Rekening rekening;

  ModelArray({
    this.success, this.total, this.rekening
});

  factory ModelArray.fromJson(Map<String, dynamic> json){
    return ModelArray(
      rekening: Rekening.fromJson(json["rekening"]),
      success: json["success"],
      total: json["total"]
    );
  }

}

class Rekening{
  String kodeRekening;
  String rekening;
  int idRekening;
  int status;

  Rekening({this.idRekening, this.kodeRekening, this.rekening, this.status});

  @override
  String toString() {
    return 'Rekening{id rekening: $idRekening, kode rekening: $kodeRekening, rekening: $rekening, status: $status}';
  }

  factory Rekening.fromJson(Map<String, dynamic> json) {
    return Rekening(
        idRekening: json["id_rekening"],
        kodeRekening: json["kode_rekening"],
        rekening: json["rekening"],
        status: json["status"]
    );
  }
}