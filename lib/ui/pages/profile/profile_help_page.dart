import 'package:SiMedit/controllers/faq_controller.dart';
import 'package:SiMedit/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileHelpPage extends StatelessWidget {
  final FaqController controller = Get.put(FaqController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: GetBuilder<FaqController>(
          builder: (controller) => Container(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
            ),
            child: ExpansionPanelList(
              elevation: 4,
              expansionCallback: (int index, bool isExpanded) {
                // Toggle the expansion state when the header is tapped
                controller.toggleItem(index);
              },
              children: List.generate(
                controller.faqs.length,
                (index) => ExpansionPanel(
                  backgroundColor: controller.faqs[index].isExpanded == false
                      ? whiteColor
                      : subtleBlueColor,
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      title: Text(controller.faqs[index].title),
                    );
                  },
                  body: ListTile(
                    title: Text(controller.faqs[index].body),
                  ),
                  isExpanded: controller.faqs[index].isExpanded,
                  canTapOnHeader: true,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
