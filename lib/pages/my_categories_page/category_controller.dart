import 'package:get/get.dart';
import 'package:git_project/pages/my_categories_page/categories_model.dart';

class CategoryController extends GetxController {
  var zRotation = 0.5.obs;

  //******* Add Selected Category ********************
  RxInt selectedCategory = RxInt(0);

  RxInt lengthList = RxInt(0);

  void incrementLengthList() {
    lengthList++;
  }

  late RxList<CategoryModel> userCategory = RxList();
}
