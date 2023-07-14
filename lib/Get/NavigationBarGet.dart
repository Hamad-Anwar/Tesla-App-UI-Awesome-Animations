

import 'package:get/get.dart';

class NavigationBarGet extends GetxController{
  RxInt selectedTab=0.obs;

  setTab(int val){
    selectedTab.value = val;
  }


}