import 'package:adv_flutter_mid_exam/helper/api_helper.dart';
import 'package:adv_flutter_mid_exam/modal/modal.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier
{
  double total=0;
  int selectIndex=0;
  List<String> addList=[];
  ApiHelper apiHelper=ApiHelper();
  List<ApiModal>? apiModalListSave;
  late List<ApiModal> apiModalList;
  Future<List<ApiModal>> apiComes()
  async {
    List apiData= await apiHelper.apiCalling();
    apiModalList = apiData.map((e) => ApiModal.fromJson(e),).toList();
    return apiModalList;
  }
  HomeProvider()
  {
    getBookMark();
    apiComes();
  }
  void addToCart(int index,double price)
  {
    addList.add("$index $price");
    // addList.clear();
    bookMark();
    totalCart();
    print(addList);
    notifyListeners();
  }
  bool checkList(int index,double price)
  {
    bool check=false;
    for(int i=0;i<addList.length;i++)
    {
      if(addList[i]=="$index $price")
      {
        check=true;
      }
    }
    notifyListeners();
    return check;
  }
  Future<void> bookMark()
  async {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    sharedPreferences.setStringList("book", addList);
    notifyListeners();
  }
  Future<void> getBookMark()
  async {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    addList=sharedPreferences.getStringList("book") ?? [];
    // totalCart();
    notifyListeners();
  }
  void totalCart()
  {
    double adding=0;
    for(int i=0;i<addList.length;i++)
    {
      adding=adding+apiModalListSave![int.parse(addList[i].split(" ").sublist(0,1).join(" "))].price;
    }
    total=adding;
    print(total);
    notifyListeners();
  }
  void removeCartItem(int index)
  {
    addList.removeAt(index);
    bookMark();
    totalCart();
    notifyListeners();
  }
}