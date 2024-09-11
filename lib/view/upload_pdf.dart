import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ghanshyam_mahotsav/controller/upload_pdf_controller.dart';
import 'package:ghanshyam_mahotsav/utils/app_text_styles.dart';
import 'package:path/path.dart' as path;

import '../utils/app_colors.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/widgets.dart';

class UploadPDF extends StatefulWidget {
  const UploadPDF({super.key});

  @override
  State<UploadPDF> createState() => _UploadPDFState();
}

class _UploadPDFState extends State<UploadPDF> {
  final UploadPDFController uploadPDFController = Get.put(UploadPDFController());
  final AppTextStyle appTextStyle = AppTextStyle();

  final TextEditingController description = TextEditingController();
  final TextEditingController bookContent = TextEditingController();
  final TextEditingController bookName = TextEditingController();
  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: AppColors.scaffoldColor));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Upload PDF'.tr,
          style: appTextStyle.montserrat20W500White,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // InkWell(
                  //   onTap: () => pickPDFFile(),
                  //   child: Container(
                  //     margin: const EdgeInsets.symmetric(vertical: 12),
                  //     height: Get.height / 2.8,
                  //     width: double.infinity,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(6),
                  //       color: AppColors.lightGrey,
                  //     ),
                  //     child: DottedBorder(
                  //       radius: const Radius.circular(6),
                  //       borderType: BorderType.RRect,
                  //       dashPattern: const [6, 6],
                  //       strokeWidth: 2,
                  //       color: AppColors.grey1,
                  //       child: Obx(
                  //         () => uploadPDFController.filePath.value.isNotEmpty
                  //             ? Center(
                  //                 child: Text(
                  //                   'Selected PDF: ${path.basenameWithoutExtension(uploadPDFController.filePath.value)}',
                  //                   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  //                 ),
                  //               )
                  //             : Center(
                  //                 child: Column(
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   crossAxisAlignment: CrossAxisAlignment.center,
                  //                   children: [
                  //                     Icon(
                  //                       Icons.picture_as_pdf_rounded,
                  //                       size: 50,
                  //                       color: AppColors.grey,
                  //                     ),
                  //                     const SizedBox(height: 20),
                  //                     Text(
                  //                       "Click here to upload PDF".tr,
                  //                       textAlign: TextAlign.center,
                  //                       style: uploadPDFController.appTextStyle.montserrat16W500Grey,
                  //                     )
                  //                   ],
                  //                 ),
                  //               ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  //
                  // SelectableLinkify(
                  //   onOpen: (LinkableElement link) async {
                  //     if (!await launchUrl(Uri.parse(link.url))) {
                  //       throw Exception('Could not launch ${link.url}');
                  //     }
                  //   },
                  //   text: 'For better user experience upload and get PDF from this website:https://www.instagram.com/',
                  //   style: appTextStyle.montserrat12W500,
                  // ),
                  InkWell(
                    onTap: () => pickPDFImage(),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      height: Get.height / 4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.lightGrey,
                      ),
                      child: DottedBorder(
                        radius: const Radius.circular(6),
                        borderType: BorderType.RRect,
                        dashPattern: const [6, 6],
                        strokeWidth: 2,
                        color: AppColors.grey1,
                        child: Obx(
                          () => uploadPDFController.imagePath.value.isNotEmpty
                              ? Center(
                                  child: Text(
                                    'Selected PDF Photo: ${path.basenameWithoutExtension(uploadPDFController.imagePath.value)}',
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                )
                              : Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.image,
                                        size: 50,
                                        color: AppColors.grey,
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        "Click here to upload PDF Photo".tr,
                                        textAlign: TextAlign.center,
                                        style: uploadPDFController.appTextStyle.montserrat16W500Grey,
                                      )
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  CustomTextFields(
                    textFieldController: bookName,
                    textFieldName: 'Book Name',
                    minLine: 1,
                  ),
                  const SizedBox(height: 14),

                  CustomTextFields(
                    textFieldController: bookContent,
                    textFieldName: 'Book Content',
                    minLine: 5,
                  ),
                  const SizedBox(height: 10),

                  CustomTextFields(
                    textFieldController: description,
                    textFieldName: 'PDF Description',
                    maxLine: 2,
                    maxLength: 80,
                  ),

                  /// Language Dropdown
                  const SizedBox(height: 12),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select PDF language'.tr,
                        style: appTextStyle.montserrat14W600,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey), // Change to your desired border color
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Obx(
                          () => DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              borderRadius: BorderRadius.circular(4),
                              isExpanded: true,
                              value: uploadPDFController.selectedLanguage.value, // Initialize value to your selected language
                              onChanged: (String? newValue) {
                                uploadPDFController.selectedLanguage.value = newValue!;
                              },
                              items: ['Select Language', 'English', 'Gujarati'] // Add more languages as needed
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      value.tr,
                                      style: appTextStyle.montserrat14W600,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// Upload Button
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print(
                            '|| ${uploadPDFController.selectedLanguage.value} || ${uploadPDFController.filePath.value} || ${description.text} || ${uploadPDFController.imagePath.value}');
                        if (uploadPDFController.selectedLanguage.value != 'Select Language' &&
                                uploadPDFController.filePath.value != '' &&
                                description.text != '' &&
                                uploadPDFController.imagePath.value != '' ||
                            bookName.text != '' ||
                            bookContent.text != '') {
                          uploadPDFController.uploadPDF(
                            description: description.text,
                            fileName: bookName.text,
                            content: bookContent.text,
                          );
                        } else {
                          CustomWidgets.toastValidation(msg: 'Select PDF,PDF image and PDF language');
                        }
                      },
                      child: Text('Upload Book'.tr),
                    ),
                  )
                ],
              ),
            ),
          ),
          Obx(
            () => uploadPDFController.isLoading.value
                ? Container(
                    color: AppColors.lightBorder.withOpacity(0.8),
                    child: CustomWidgets.loader,
                  )
                : const SizedBox(height: 0, width: 0),
          ),
        ],
      ),
    );
  }

  Future<void> pickPDFFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null) {
        uploadPDFController.filePath.value = result.files.single.path ?? '';
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> pickPDFImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'jpeg'],
      );
      if (result != null) {
        uploadPDFController.imagePath.value = result.files.single.path ?? '';
      }
    } catch (e) {
      debugPrint('$e');
    }
  }
}
