import 'dart:io';

import '../../core/constants/app_colors.dart';
import '../../core/utils/app_functions.dart';
import 'widgets/recognition_result.dart';
import 'package:camera_universal/camera_universal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:typewritertext/v3/typewriter.dart';

import 'camera_page_controller.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final CameraPageController controller = Get.find<CameraPageController>();
  late final CameraController cameraController;
  late bool isTakingPicture;

  @override
  void initState() {
    isTakingPicture = false;
    _initCameraController();
    super.initState();
  }

  Future<void> _initCameraController() async {
    cameraController = CameraController();
    await cameraController.initializeCameras();
    await cameraController.initializeCamera(setState: setState);
    await cameraController.activateCamera(setState: setState, mounted: () => mounted);
  }

  Future<void> takePicture({bool openHomePage = false, bool openClosingPage = false}) async {
    try {
      if (isTakingPicture) return;
      isTakingPicture = true;
      final CameraTakePictureData? data = await cameraController.action_take_picture(
        onCameraNotActive: () {},
        onCameraNotSelect: () {},
        onCameraNotInit: () {},
      );
      if (data != null) {
        final String imagePath = data.path;
        debugPrint('Image taken: $imagePath');
        controller.updateImage(
          imagePath,
          openHomePage: openHomePage,
          openClosingPage: openClosingPage,
        );
      }
      isTakingPicture = false;
    } catch (e) {
      AppFunctions.showSnackBar(message: 'failedToTakePicture'.tr);
    }
  }

  static const double imageSize = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TapRegion(
              onTapInside: (event) {
                final bool isRightClickButton = event.buttons == 2;
                if (isRightClickButton) takePicture(openHomePage: true);
              },
              child: GestureDetector(
                onTap: takePicture,
                behavior: HitTestBehavior.translucent,
                onDoubleTap: () => takePicture(openHomePage: true),
                onLongPress: () => takePicture(openClosingPage: true),
                child: Container(
                  height: imageSize,
                  width: imageSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary.withOpacity(0.2),
                  ),
                  child: ObxValue<Rxn<File>>(
                    (rxImage) {
                      final File? image = rxImage.value;
                      if (image == null) {
                        return const Icon(
                          Icons.camera_alt,
                          size: imageSize * 0.5,
                          color: AppColors.primary,
                        );
                      } else {
                        return Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(200),
                              child: Image.file(
                                image,
                                height: imageSize,
                                width: imageSize,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ObxValue<RxBool>(
                              (rxIsLoading) {
                                if (!rxIsLoading.value) return const SizedBox();
                                return Container(
                                  height: imageSize,
                                  width: imageSize,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primary.withOpacity(0.2),
                                  ),
                                  child: const CircularProgressIndicator(color: AppColors.background),
                                );
                              },
                              controller.isLoading,
                            ),
                          ],
                        );
                      }
                    },
                    controller.image,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            ObxValue<RxBool>(
              (rxIsShowingAutisticResult) {
                final bool isShowing = rxIsShowingAutisticResult.value;
                if (isShowing) {
                  return Column(
                    children: [
                      RecognitionResult(
                        isAutistic: controller.isAutistic,
                        isRecognized: controller.isRecognized,
                      ),
                      const SizedBox(height: 32),
                    ],
                  );
                }
                return const SizedBox();
              },
              controller.isShowingAutisticResult,
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 500),
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/logo.svg',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TypeWriter.text(
                      'imageIntro'.tr,
                      duration: const Duration(milliseconds: 20),
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.background,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }
}
