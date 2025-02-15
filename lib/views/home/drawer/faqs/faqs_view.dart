import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/common/list_data.dart';
import 'package:kitaabe/views/home/main_tab_bar.dart';

class FAQsView extends StatefulWidget {
  const FAQsView({super.key});

  @override
  State<FAQsView> createState() => _FAQsViewState();
}

class _FAQsViewState extends State<FAQsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
            horizontal: 15,
            vertical: 20,
          ),
          child: Column(
            children: [
              Text(
                'Frequently Asked Questions (FAQs)',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: TColor.text,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: ListData().faqs.length,
                  itemBuilder: (context, index) {
                    var fObj = ListData().faqs[index] as Map;
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
