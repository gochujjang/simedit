import 'package:get/get.dart';

class Faq {
  Faq(this.title, this.body, [this.isExpanded = false]);
  String title;
  String body;
  bool isExpanded;
}
