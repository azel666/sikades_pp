import 'package:cloud_firestore/cloud_firestore.dart';

class KTP {
  String userid;
  String dataid;
  String nama;
  String umur;
  String imageFace;
  String imagekk;
  String imagettd;
  String status;
  String catatan;
  DateTime createdAt;

  KTP({
    required this.userid,
    required this.dataid,
    required this.nama,
    required this.umur,
    required this.imageFace,
    required this.imagekk,
    required this.imagettd,
    required this.status,
    required this.catatan,
    required this.createdAt,
  });

  static KTP fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return KTP(
      userid: snapshot['userid'],
      dataid: snapshot['dataid'],
      nama: snapshot['nama'],
      umur: snapshot['umur'],
      imageFace: snapshot['imageFace'],
      imagekk: snapshot['imagekk'],
      imagettd: snapshot['imagettd'],
      status: snapshot['status'],
      catatan: snapshot['catatan'],
      createdAt: snapshot['createdAt'],
    );
  }

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "dataid": dataid,
        "nama": nama,
        "umur": umur,
        "imageFace": imageFace,
        "imagekk": imagekk,
        "imagettd": imagettd,
        "status": status,
        "catatan": catatan,
        "createdAt": createdAt,
      };
}
