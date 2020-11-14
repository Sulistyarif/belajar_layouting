class Model{
  String kodeRekening;
  String rekening;
  int idRekening;
  int status;

  Model({this.idRekening, this.kodeRekening, this.rekening, this.status});

  @override
  String toString() {
    return 'Model{id rekening: $idRekening, kode rekening: $kodeRekening, rekening: $rekening, status: $status}';
  }

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
        idRekening: json["id_rekening"],
        kodeRekening: json["kode_rekening"],
        rekening: json["rekening"],
        status: json["status"]
    );
  }
}