import 'package:SiMedit/controllers/faq_controller.dart';
import 'package:SiMedit/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileHelpPage extends StatelessWidget {
  final FaqController controller = Get.put(FaqController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset(
            'assets/ic_back.png',
            width: 24,
            height: 24,
          ),
        ),
        title: Text('Pusat Bantuan'),
      ),
      body: GetBuilder<FaqController>(
        builder: (controller) => Container(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
          ),
          child: ListView.builder(
            itemCount: controller.faqs.length,
            itemBuilder: (_, index) {
              return Card(
                color: whiteColor,
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                margin: const EdgeInsets.only(bottom: 20),
                child: Theme(
                  data: theme,
                  child: Material(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(11),
                    child: ExpansionTile(
                      backgroundColor: subtleBlueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      childrenPadding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 20,
                      ),
                      expandedCrossAxisAlignment: CrossAxisAlignment.end,
                      title: Text(
                        controller.faqs[index].title,
                        style: font_bold.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      children: [
                        Text(
                          controller.faqs[index].body,
                          style: font_regular.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
