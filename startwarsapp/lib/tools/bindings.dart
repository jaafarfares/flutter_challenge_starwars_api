import 'package:get/get.dart';
import 'package:startwarsapp/viewmodels/home.viewmodel.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel());
  }
}
