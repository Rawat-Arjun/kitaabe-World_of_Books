import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../components/color_extension.dart';
import '../../../../components/list_data.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  int drawerIndex = -1;
  final drawerKey = GlobalKey<ScaffoldState>();

  User? user;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Drawer(
      key: drawerKey,
      width: mediaQuery.width * 0.6,
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: mediaQuery.height * 0.5,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                mediaQuery.width * 0.8,
              ),
              bottomLeft: Radius.circular(
                mediaQuery.width * 0.8,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(mediaQuery.width * 0.8),
                  bottomLeft: Radius.circular(mediaQuery.width * 0.8),
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 20,
                        color: drawerIndex == 0 ? TColor.primary : Colors.white,
                      ),
                    ),
                    ...ListData.drawerList.map(
                      (e) {
                        int index = ListData.drawerList.indexOf(e);
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Navigator.of(context).pop(); // Close the drawer

                            final routeBuilder = e['route'];
                            if (routeBuilder != null &&
                                routeBuilder is Function) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => routeBuilder()),
                                );
                              });
                            }
                          },
                          child: Container(
                            width: double.maxFinite,
                            decoration: drawerIndex == index
                                ? BoxDecoration(
                                    color: TColor.primary,
                                  )
                                : null,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 20,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  e['name'].toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: drawerIndex == index
                                        ? Colors.white
                                        : TColor.text,
                                  ),
                                ),
                                const SizedBox(
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
                    ),
                    Expanded(
                      child: Container(
                        color: drawerIndex == ListData.drawerList.length - 1
                            ? TColor.primary
                            : Colors.white,
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
