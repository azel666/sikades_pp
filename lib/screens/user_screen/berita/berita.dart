// ignore_for_file: camel_case_types, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sikades/screens/user_screen/berita/widget/berita_card.dart';

class Berita extends StatefulWidget {
  const Berita({super.key});

  @override
  State<Berita> createState() => _BeritaState();
}

class _BeritaState extends State<Berita> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference data = firestore.collection("berita");
    return data.orderBy("tanggal", descending: true).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Berita',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [beritaView()],
          )),
    );
  }

  Widget beritaView() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 650,
        child: content(),
      ),
    );
  }

  Widget content() {
    return StreamBuilder<QuerySnapshot<Object?>>(
        stream: streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocument = snapshot.data!.docs;
            return BeritaCard(listAllDocument: listAllDocument);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
