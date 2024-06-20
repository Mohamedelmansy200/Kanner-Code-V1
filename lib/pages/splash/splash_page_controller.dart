import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

import '../../core/constants/app_routes.dart';

final class SplashPageController extends GetxController {
  late RxBool didPlayIntro;
  late final AudioPlayer _audioPlayer;

  @override
  void onInit() {
    didPlayIntro = false.obs;
    _audioPlayer = AudioPlayer();
    super.onInit();
  }

  Future<void> playIntro() async {
    if (didPlayIntro.value) {
      Get.offNamed(AppRoutes.camera);
    } else if (_audioPlayer.state != PlayerState.playing) {
      didPlayIntro.value = true;
      final Source audioSource = AssetSource('audio/intro.mp3');
      await _audioPlayer.play(audioSource);
    }
  }
}
