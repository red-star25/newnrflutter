import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/controller/HomeController/homeController.dart';
import 'package:nrlifecare/data/sharedPrefs/sharedPrefs.dart';
import 'package:nrlifecare/wigdets/CustomSnackbar/customWidgets.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:telephony/telephony.dart';

class CartController extends GetxController {
  List<Map<String, dynamic>> cartItems = [];
  double totalCartPrice = 0.0;

  TextEditingController quantityController;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final Telephony telephony = Telephony.instance;

  String smsMessage = "";

  bool isLoading = false;

  bool isSendingSms = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Razorpay _razorpay;
  Uuid uuid;

  String uId, userName, email;

  String modeOfPayment;

  @override
  void onInit() {
    quantityController = TextEditingController(text: "1");
    getCartProducts();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.onInit();
  }

  Future<bool> onBackPress() {
    Get.offAllNamed("/category");
    Get.find<HomeController>().updateSelectedFabIcon(2);
    return Future.value(true);
  }

  Future<void> smsSend() async {
    final SmsSendStatusListener listener = (SendStatus status) {
      if (status == SendStatus.SENT) {
        CustomWidgets.customPaymentSnackbar(
            message: "Order Has Been Successfully Placed",
            title: "Congratulation",
            utfLogo: "✔");
        phoneNumberController.clear();
        nameController.clear();
        addressController.clear();
      }
    };
    try {
      await telephony
          .sendSms(
        to: "6353369354",
        message: smsMessage,
        statusListener: listener,
      )
          .then((value) async {
        Get.toNamed("/orderSuccess");
      }).then((value) async {
        try {
          await telephony.sendSms(
            to: phoneNumberController.text,
            message:
                "Your order has been placed. Our Medical Representative will reach you soon. Thank You",
          );
        } catch (e) {
          debugPrint(e.toString());
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> openCheckout() async {
    final options = {
      'key': "rzp_test_7w5UEKTQKOkb0s",
      'amount': (totalCartPrice * 100).roundToDouble().toString(),
      'name': "NR Life Care",
      'description': 'Online Order',
      'prefill': {'contact': phoneNumberController.text, 'email': email},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> setMessage({String mode}) async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(uId)
          .collection("cartProducts")
          .get()
          .then((value) {
        final productName = [];
        final productQuantity = [];

        for (var i = 0; i < value.docs.length; i++) {
          productName.add(value.docs[i]["productName"].toString());
          productQuantity.add(value.docs[i]["userQuantity"].toString());
        }

        final product = productName.reduce(
            // ignore: prefer_interpolation_to_compose_strings
            (value, element) => value + "," + element);

        final quantity = productQuantity.reduce(
            // ignore: prefer_interpolation_to_compose_strings
            (value, element) => value + "," + element);

        smsMessage =
            "$mode:\nProducts:\n$product\n\nQuantity:\n$quantity\n\nName: ${userName}\nAddress :${addressController.text}\nPhone Number :${phoneNumberController.text}";
      }).then((value) async {
        nameController.clear();
        phoneNumberController.clear();
        addressController.clear();
        smsSend();
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    CustomWidgets.customPaymentSnackbar(
        message: "Order has been successfully placed",
        title: "Success",
        utfLogo: "✔");
    setMessage(mode: "Online Payment");
    Get.toNamed("/orderSuccess");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    debugPrint(response.message);
    CustomWidgets.customPaymentSnackbar(
        message: response.message.toString(),
        title: response.code.toString(),
        utfLogo: "❌");
    Get.offNamed("/cart");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Get.snackbar("External wallet", "",
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.grey);
  }

  Future<void> getUid() async {
    uId = await SharedPrefs.getUid();
    userName = await SharedPrefs.getUserName();
    email = await SharedPrefs.getEmail();
  }

  Future<void> setUserQuantity({String pId, String quantity}) async {
    isLoading = true;
    update();
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(uId)
          .collection("cartProducts")
          .doc(pId)
          .update({"userQuantity": quantity}).then((value) {
        totalCartProductPrice();
        isLoading = false;
        update();
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getCartProducts() async {
    cartItems.clear();
    getUid();
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(uId)
          .collection("cartProducts")
          .get()
          .then((value) {
        for (var i = 0; i < value.docs.length; i++) {
          cartItems.add(value.docs[i].data());
        }
        update();
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteCartProduct(
      {String id, String categoryId, String categoryName}) async {
    if (categoryId == null) {
      if (categoryName == "TopProducts") {
        isLoading = true;
        update();
        try {
          await FirebaseFirestore.instance
              .collection("Users")
              .doc(uId)
              .collection("cartProducts")
              .doc(id)
              .delete()
              .then((value) async {
            await FirebaseFirestore.instance
                .collection("TopProducts")
                .doc(id)
                .update({"isAdded": false}).then((value) {
              totalCartProductPrice();
              isLoading = false;
              update();
            });
          });
        } catch (e) {
          debugPrint(e.toString());
        }
      } else if (categoryName == "NewProducts") {
        isLoading = true;
        update();
        try {
          await FirebaseFirestore.instance
              .collection("Users")
              .doc(uId)
              .collection("cartProducts")
              .doc(id)
              .delete()
              .then((value) async {
            await FirebaseFirestore.instance
                .collection("NewProducts")
                .doc(id)
                .update({"isAdded": false});
          }).then((value) {
            totalCartProductPrice();
            isLoading = false;
            update();
          });
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    } else {
      isLoading = true;
      update();
      try {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(uId)
            .collection("cartProducts")
            .doc(id)
            .delete()
            .then((value) async {
          await FirebaseFirestore.instance
              .collection("Categories")
              .doc(categoryId)
              .collection("products")
              .doc(id)
              .update({"isAdded": false}).then((value) {
            totalCartProductPrice();
            isLoading = false;
            update();
          });
        });
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    isLoading = false;
    update();
  }

  Future<void> totalCartProductPrice() async {
    totalCartPrice = 0.0;
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(uId)
          .collection("cartProducts")
          .get()
          .then((value) {
        for (var i = 0; i < value.docs.length; i++) {
          totalCartPrice = totalCartPrice +
              (double.parse(value.docs[i]["userQuantity"].toString()) *
                  (double.parse(value.docs[i]["productPrice"].toString())));
        }
      });
      update();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
