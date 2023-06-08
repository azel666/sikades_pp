import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../../utils/colors.dart';

class DashboardUser extends StatefulWidget {
  const DashboardUser({super.key});

  @override
  State<DashboardUser> createState() => _DashboardUserState();
}

class _DashboardUserState extends State<DashboardUser> {
  int _selected_index = 0;

  void _updated_index(int index) {
    setState(() {
      _selected_index = index;
    });
  }

  Future<bool> onBackPressed() {
    if (_selected_index != 0) {
      setState(() {
        _selected_index = 0;
      });
      return Future.value(false); // Tidak tindak lanjuti navigasi kembali
    }
    return Future.value(true); // Tindak lanjuti navigasi kembali
  }

  final pages = [
    const Center(
      child: Text('pages 1'),
    ),
    const Center(
      child: Text('pages 2'),
    ),
    const Center(
      child: Text('pages 3'),
    ),
    const Center(
      child: Text('pages 4'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.green),
            child: Row(
              children: [
                Spacer(),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    padding: EdgeInsets.only(right: 20),
                    onPressed: () {
                      _updated_index(0);
                    },
                    icon: Icon(
                      Icons.home,
                      color:
                          _selected_index == 0 ? Colors.white : Colors.black45,
                      size: 30,
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    onPressed: () {
                      _updated_index(1);
                    },
                    icon: Icon(
                      Icons.archive,
                      color:
                          _selected_index == 1 ? Colors.white : Colors.black45,
                      size: 25,
                    ),
                  ),
                ),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    onPressed: () {
                      _updated_index(2);
                    },
                    icon: Icon(
                      Icons.info,
                      color:
                          _selected_index == 2 ? Colors.white : Colors.black45,
                      size: 25,
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    padding: EdgeInsets.only(left: 10),
                    onPressed: () {
                      _updated_index(3);
                    },
                    icon: Icon(
                      Icons.person,
                      color:
                          _selected_index == 3 ? Colors.white : Colors.black45,
                      size: 30,
                    ),
                  ),
                ),
                Spacer()
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            // backgroundColor: "#99A3A4".toColor(),
            child: Icon(
              Icons.add,
              size: 35,
            ),
            onPressed: () {
              // Get.to(TambahAduan());
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: pages.elementAt(_selected_index),
      ),
    );
  }
}