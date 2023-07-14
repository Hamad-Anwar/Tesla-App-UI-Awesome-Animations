import 'dart:async';

import 'package:get/get.dart';

class LockGet extends GetxController{
  RxBool isLockedLeft=false.obs;
  RxBool isLockedRight=false.obs;
  RxBool isLockedUp=false.obs;
  RxBool isLockedDown=false.obs;
  RxInt selectedTab=0.obs;
  RxBool coolTemp=true.obs;
  RxBool heatTemp=false.obs;
  RxInt temperature=25.obs;
  RxBool showTyre=true.obs;
  setCoolTemp(){
    coolTemp.value=true;
    heatTemp.value=false;
    temperature.value=25;
  }

  setHeatTemp(){
    coolTemp.value=false;
    heatTemp.value=true;
    temperature.value=35;
  }


  showTyreController()async{
    if(selectedTab.value == 2){
      showTyre.value==false;
    }else{
     // Timer(Duration(milliseconds: 300), () {
     //   showTyre.value=true;
     // });
      showTyre.value=true;
    }
  }

  incTemp(){
    temperature.value++;
    checkTemp();
  }
  decTemp(){
    temperature.value--;
    checkTemp();
  }


  checkTemp(){
    if(temperature<=25){
      coolTemp.value=true;
      heatTemp.value=false;
    }else{
      coolTemp.value=false;
      heatTemp.value=true;
    }
  }



  setTab(int val){

    selectedTab.value = val;
    showTyreController();

  }
  void setLockedLeft() {
    isLockedLeft.value = !isLockedLeft.value;
  }
  void setLockedRight(){
    isLockedRight.value=!isLockedRight.value;
  }
  void setLockedUp(){
    isLockedUp.value=!isLockedUp.value;
  }
  void setLockedDown(){
    isLockedDown.value=!isLockedDown.value;
  }

}