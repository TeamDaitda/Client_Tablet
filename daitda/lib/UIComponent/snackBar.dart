import 'package:flutter/material.dart';

class SnackBarComponent {
  /// Category Page Intro SnackBar
  static ScaffoldFeatureController categoryPageIntro(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "기부를 원하시는 카테고리를 선택해 보세요.",
            style: TextStyle(fontSize: 20, fontFamily: 'nanum'),
          ),
        ),
      ),
    );
  }

  /// Input Page Intro SnackBar
  static ScaffoldFeatureController inputPageIntro(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "기부자님의 정보를 입력해주세요.",
            style: TextStyle(fontSize: 20, fontFamily: 'nanum'),
          ),
        ),
      ),
    );
  }

  /// Input Page TextForm Validate
  static ScaffoldFeatureController inputPageTextFormName(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "올바른 성함인지 확인해주세요.",
            style: TextStyle(fontSize: 20, fontFamily: 'nanum'),
          ),
        ),
      ),
    );
  }

  static ScaffoldFeatureController inputPageTextFormPhone(
      BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "올바른 연락처인지 확인해주세요.",
            style: TextStyle(fontSize: 20, fontFamily: 'nanum'),
          ),
        ),
      ),
    );
  }

  /// Camera Page Intro SnackBar
  static ScaffoldFeatureController cameraPageIntro(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "타원에 얼굴을 맞추고 촬영버튼을 눌러주세요.",
            style: TextStyle(fontSize: 20, fontFamily: 'nanum'),
          ),
        ),
      ),
    );
  }

  /// PhotoCard Page Outtro SnackBar
  static ScaffoldFeatureController photoCardPageOuttro(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "기부해주셔서 감사합니다. 잠시만 기다려주세요. 포토프린트에서 기념 사진이 안쇄됩니다!",
            style: TextStyle(fontSize: 20, fontFamily: 'nanum'),
          ),
        ),
      ),
    );
  }
}
