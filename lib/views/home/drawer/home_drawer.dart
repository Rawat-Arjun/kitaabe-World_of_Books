import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/color_extension.dart';
import '../../../common/list_data.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  int drawerIndex = 0;
  final drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Drawer(
      key: drawerKey,
      width: mediaQuery.width * 0.6,
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            mediaQuery.width * 0.9,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  mediaQuery.width * 0.9,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15,
                )
              ]),
          child: Column(
            children: ListData.drawerList.map(
              (e) {
                int index = ListData.drawerList.indexOf(e);
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() {
                      drawerIndex = index;
                    });
                    Navigator.of(context).push(e['route']);
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: drawerIndex == index
                        ? BoxDecoration(
                            color: TColor.primary,
                            boxShadow: [
                              BoxShadow(
                                color: TColor.primary,
                                blurRadius: 10,
                                offset: Offset(0, 3),
                              ),
                            ],
                          )
                        : null,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          e['name'].toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: drawerIndex == index
                                ? Colors.white
                                : TColor.text,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          e['icon'] as IconData,
                          color: drawerIndex == index
                              ? Colors.white
                              : TColor.primary,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
