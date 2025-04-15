part of "model.dart";

DataWisata dataWisataFromJson(String str) =>
    DataWisata.fromJson(json.decode(str));

String dataWisataToJson(DataWisata data) => json.encode(data.toJson());

class DataWisata {
  List<DetailWisata> data;

  DataWisata({
    required this.data,
  });

  factory DataWisata.fromJson(Map<String, dynamic> json) => DataWisata(
        data: List<DetailWisata>.from(
            json["data"].map((x) => DetailWisata.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DetailWisata {
  int idwisata;
  String namawisata;
  String gambarwisata;
  int hargaWisata;
  double ratingWisata;
  String lokasiwisata;
  String deskripsi;
  int isFav;
  String gallery;
  int idCategory;
  DateTime createAt;
  DateTime updateAt;

  DetailWisata({
    required this.idwisata,
    required this.namawisata,
    required this.gambarwisata,
    required this.hargaWisata,
    required this.ratingWisata,
    required this.lokasiwisata,
    required this.deskripsi,
    required this.isFav,
    required this.gallery,
    required this.idCategory,
    required this.createAt,
    required this.updateAt,
  });

  factory DetailWisata.fromJson(Map<String, dynamic> json) => DetailWisata(
        idwisata: json["idwisata"] ?? 0,
        namawisata: json["namawisata"] ?? '',
        gambarwisata: json["gambarwisata"] ?? '',
        hargaWisata: json["hargaWisata"] ?? 0,
        ratingWisata: (json["ratingWisata"] ?? 0).toDouble(),
        lokasiwisata: json["lokasiwisata"] ?? '',
        deskripsi: json["deskripsi"] ?? '',
        isFav: json["isFav"] ?? 0,
        gallery: json["Gallery"] ?? '',
        idCategory: json["idCategory"] ?? 0,
        createAt: json["createAt"] != null
            ? DateTime.parse(json["createAt"])
            : DateTime.now(),
        updateAt: json["updateAt"] != null
            ? DateTime.parse(json["updateAt"])
            : DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "idwisata": idwisata,
        "namawisata": namawisata,
        "gambarwisata": gambarwisata,
        "hargaWisata": hargaWisata,
        "ratingWisata": ratingWisata,
        "lokasiwisata": lokasiwisata,
        "deskripsi": deskripsi,
        "isFav": isFav,
        "Gallery": gallery,
        "idCategory": idCategory,
        "createAt": createAt.toIso8601String(),
        "updateAt": updateAt.toIso8601String(),
      };
}