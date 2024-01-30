
import 'package:get/get.dart';

class ImageDetailsController extends GetxController {
  // ApiModel? apiModel;
  // bool isLoading = false;
  //
  // @override
  // void onInit() {
  //   getArguments();
  //   super.onInit();
  // }
  //
  // void getArguments() {
  //   if (Get.arguments?['photo_detail'] != null) {
  //     apiModel = Get.arguments['photo_detail'];
  //   } else {
  //     apiModel = ApiModel();
  //   }
  // }
  //
  // Future<void> downloadImage(String? imageUrl) async {
  //   isLoading = true;
  //   update();
  //   Get.showSnackbar(const GetSnackBar(
  //     message: 'Please wait until the download is completed',
  //     duration: Duration(seconds: 3),
  //   ));
  //   var response = await Dio()
  //       .get(imageUrl!, options: Options(responseType: ResponseType.bytes));
  //   final result = await ImageGallerySaver.saveImage(
  //       Uint8List.fromList(response.data),
  //       quality: 60,
  //       name: "hello");
  //   isLoading = false;
  //   update();
  //   Get.showSnackbar(const GetSnackBar(
  //     message: 'Successfully download image',
  //     duration: Duration(seconds: 3),
  //   ));
  // }
  //
  // void onBack() {
  //   Get.back();
  // }
}
