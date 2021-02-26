import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/data/fakeData.dart';
import 'package:nrlifecare/data/sharedPrefs/sharedPrefs.dart';

class CategoryController extends GetxController {
  final searchedProducts = RxList<Map<String, dynamic>>().obs;

  // final productList = FakeData.productList;

  RxString categoryId = RxString();

  final categoryList = FakeData.categoryList.obs;

  RxBool isSearchVisible = false.obs;

  bool isAddedToCart = false;

  void updateIsSearchVisible({bool value}) {
    isSearchVisible = RxBool(value);
    update();
  }

  void setCategoryId(String id) {
    categoryId.value = id;
    update();
  }

  Future<void> addSearchedProducts(String term) async {
    searchedProducts.value.clear();
    FirebaseFirestore.instance
        .collection("Categories")
        .doc(categoryId.toString())
        .collection("products")
        .get()
        .then((value) {
      for (var i = 0; i < value.docs.length; i++) {
        if (value.docs[i]
            .data()["productName"]
            .toString()
            .toLowerCase()
            .contains(term.toLowerCase())) {
          searchedProducts.value.add(value.docs[i].data());
          break;
        }
      }
      update();
    });
  }

  RxInt selectedCategoryIndex = 0.obs;

  void setSelectedCategory(int index) {
    for (int i = 0; i < categoryList.value.length; i++) {
      if (i == index) {
        categoryList.value[i].isSelected = true;
        selectedCategoryIndex.value = index;
        update();
      } else {
        categoryList.value[i].isSelected = false;
        update();
      }
    }
  }

  // void updateProductQuantity({int quantity, String id}) async {
  //   final uId = await SharedPrefs.getUid();

  //   await FirebaseFirestore.instance
  //       .collection("Users")
  //       .doc(uId)
  //       .collection("cartProducts")
  //       .doc(categoryId.value.toString())
  //       .update({"productQuantity": quantity});
  // }

  void addProductToCartToggle({String id, int index}) async {
    isAddedToCart = true;
    update();

    if (index != null) {
      if (searchedProducts.value[index]["isAdded"] == false) {
        searchedProducts.value[index]["isAdded"] = true;
        update();
      } else {
        searchedProducts.value[index]["isAdded"] = false;
        update();
      }
    }

    final isAlreadyAdded = await FirebaseFirestore.instance
        .collection("Categories")
        .doc(categoryId.value.toString())
        .collection("products")
        .doc(id)
        .get()
        .then((value) => value.data()["isAdded"] as bool);

    if (!isAlreadyAdded) {
      await FirebaseFirestore.instance
          .collection("Categories")
          .doc(categoryId.value.toString())
          .collection("products")
          .doc(id)
          .update({"isAdded": true}).then((value) async {
        final uId = await SharedPrefs.getUid();

        CollectionReference collectionReference = FirebaseFirestore.instance
            .collection("Users")
            .doc(uId)
            .collection("cartProducts");

        Map<String, dynamic> addedProductData = await FirebaseFirestore.instance
            .collection("Categories")
            .doc(categoryId.value.toString())
            .collection("products")
            .doc(id)
            .get()
            .then((value) => value.data());

        await collectionReference.doc(id).set(addedProductData);
      });
      isAddedToCart = false;
      update();
    } else {
      isAddedToCart = true;
      update();

      await FirebaseFirestore.instance
          .collection("Categories")
          .doc(categoryId.value.toString())
          .collection("products")
          .doc(id)
          .update({"isAdded": false}).then((value) async {
        final uId = await SharedPrefs.getUid();

        await FirebaseFirestore.instance
            .collection("Users")
            .doc(uId)
            .collection("cartProducts")
            .doc(id)
            .delete();
      });
      isAddedToCart = false;
      update();
    }
  }

  // getSearchResults(String searchQuery) {
  //   productList.value.forEach((productDetail) {
  //     if (productDetail.values.contains(searchQuery)) searchList.add();
  //   });
  // }
}
