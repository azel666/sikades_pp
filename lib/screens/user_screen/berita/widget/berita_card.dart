import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikades/screens/user_screen/berita/berita_detail.dart';

class BeritaCard extends StatefulWidget {
  final listAllDocument;
  const BeritaCard({required this.listAllDocument, super.key});

  @override
  State<BeritaCard> createState() => _BeritaCardState();
}

class _BeritaCardState extends State<BeritaCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.listAllDocument.length,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                var detail = widget.listAllDocument[index].data()
                    as Map<String, dynamic>;
                Get.to(BeritaDetail(detail: detail));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(5, 5, 0, 10),
                width: MediaQuery.of(context).size.width,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    // ignore: prefer_const_constructors
                    BoxShadow(
                      blurRadius: 6,
                      color: Color(0x34000000),
                      offset: Offset(3, 3),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 115,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                      '${(widget.listAllDocument[index].data() as Map<String, dynamic>)["imageUrl"]}')
                                  .image)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 230,
                          child: Text(
                            "${(widget.listAllDocument[index].data() as Map<String, dynamic>)["judul"]}",
                            style: TextStyle(
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins'),
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          width: 230,
                          child: Text(
                            "${(widget.listAllDocument[index].data() as Map<String, dynamic>)["deskripsi"]}",
                            style: TextStyle(
                                fontSize: 16.0, fontFamily: 'Poppins'),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          width: 230,
                          child: Text(
                            "${(widget.listAllDocument[index].data() as Map<String, dynamic>)["tanggal"]}",
                            style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'Poppins',
                                color: Colors.black54),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
