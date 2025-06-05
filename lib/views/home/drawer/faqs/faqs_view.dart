import 'package:flutter/material.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/common/list_data.dart';

class FAQsView extends StatelessWidget {
  const FAQsView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Frequently Asked Questions (FAQs)',
            maxLines: 2,
            style: textTheme.titleLarge,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
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
                    var faqsList = ListData.faqs[index] as Map;
                    return Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: TColor.primary,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Q-  ${faqsList['question']}',
                            style: textTheme.labelMedium,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'A-  ${faqsList['answer']}',
                            style: textTheme.bodySmall,
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
