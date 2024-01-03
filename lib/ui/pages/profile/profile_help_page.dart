import 'package:SiMedit/controllers/faq_controller.dart';
import 'package:SiMedit/models/Employee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileHelpPage extends GetView<FaqController> {
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
        title: Text(
          'Pusat Bantuan',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            top: 20,
            bottom: 20,
          ),
          child: Obx(() => ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {
                controller.employee[panelIndex].isExpanded!.value = !isExpanded;
              },
              children:
                  controller.employee.map<ExpansionPanel>((Employee item) {
                return ExpansionPanel(
                    canTapOnHeader: true,
                    headerBuilder: ((context, isExpanded) {
                      return ListTile(title: Text(item.header!));
                    }),
                    body: ListTile(
                      title: Text(item.body!),
                    ),
                    isExpanded: item.isExpanded!.value);
              }).toList())),
        ),
      ),
    );
  }
}
