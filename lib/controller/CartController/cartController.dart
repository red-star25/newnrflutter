import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/data/sharedPrefs/sharedPrefs.dart';
import 'package:nrlifecare/wigdets/CustomSnackbar/customWidgets.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:telephony/telephony.dart';

class CartController extends GetxController {
  List<Map<String, dynamic>> cartItems = [];
  double totalCartPrice = 0.0;

  TextEditingController quantityController;
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();

  final Telephony telephony = Telephony.instance;

  String smsMessage = "";

  bool isLoading = false;

  bool isSendingSms = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Razorpay _razorpay;
  Uuid uuid;

  String uId, userName, email;

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

  Future<void> smsSend() async {
    final SmsSendStatusListener listener = (SendStatus status) {
      if (status == SendStatus.SENT) {
        CustomWidgets.customPaymentSnackbar(
            message: "Order Placed Successfully",
            title: "Congratulation",
            utfLogo: "✔");
      }
    };

    await telephony
        .sendSms(
      to: "6353369354",
      message: smsMessage,
      statusListener: listener,
    )
        .then((value) {
      Get.offNamed("/cart");
    });
  }

  Future<void> openCheckout() async {
    // rzp_live_lpk9qpV9GInbUw
    final options = {
      'key': "rzp_test_7w5UEKTQKOkb0s",
      'amount': (totalCartPrice * 100).roundToDouble().toString(),
      'name': "NR Life Care",
      'description': 'Online Order',
      'prefill': {'contact': "", 'email': email},
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

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    CustomWidgets.customPaymentSnackbar(
        message: "Order successfully placed", title: "Success", utfLogo: "✔");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print(response.message);
    CustomWidgets.customPaymentSnackbar(
        message: response.message.toString(),
        title: response.code.toString(),
        utfLogo: "❌");
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
  }

  Future<void> getCartProducts() async {
    cartItems.clear();
    getUid();
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
  }

  void deleteCartProduct(
      {String id, String categoryId, String categoryName}) async {
    if (categoryId == null) {
      if (categoryName == "TopProducts") {
        isLoading = true;
        update();
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
      } else if (categoryName == "NewProducts") {
        isLoading = true;
        update();
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
      }
    } else {
      isLoading = true;
      update();
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
    }
    isLoading = false;
    update();
  }

  Future<void> totalCartProductPrice() async {
    totalCartPrice = 0.0;
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
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
