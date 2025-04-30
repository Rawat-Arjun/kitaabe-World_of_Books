import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/common/list_data.dart';

import '../../main_tab_bar.dart';

class FAQsView extends StatelessWidget {
  const FAQsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Frequently Asked Questions (FAQs)',
            maxLines: 2,
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: TColor.text,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const MainTabBar(),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: ListData.faqs.length,
                  itemBuilder: (context, index) {
                    var fObj = ListData.faqs[index] as Map;
                    return Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: TColor.primaryLight,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Q-  ${fObj['question']}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: TColor.text,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'A-  ${fObj['answer']}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: TColor.subText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
