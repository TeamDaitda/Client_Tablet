import 'package:daitda/UIComponent/AnimatedLiquidLinearProgressIndicator.dart';
import 'package:camera/camera.dart';
import 'package:daitda/pages/previewPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:daitda/design/colorSet.dart';
import 'package:daitda/design/designSet.dart';
import 'package:daitda/controller/progress.dart';
import 'package:daitda/UIComponent/processBar.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:fdottedline/fdottedline.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final designSet = Get.put(DesignSet());
  final progressData = Get.put(ProgressData());
  final colorSet = ColorSet();
  CameraController cameraController;
  List cameras;
  int selectedCameraIndex;
  String imgPath;

  @override
  void initState() {
    designSet.setScreenWidthAndHeight(w: Get.size.width, h: Get.size.height);
    progressData.setData(0.2);
    super.initState();
    availableCameras().then((availableCameras) {
      cameras = availableCameras;

      if (cameras.length > 0) {
        setState(() {
          selectedCameraIndex = 1;
        });
        _initCameraController(cameras[selectedCameraIndex]).then((void v) {});
      } else {
        print('No camera available');
      }
    }).catchError((err) {
      print('Error :${err.code}Error message : ${err.message}');
    });
  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    if (cameraController != null) {
      await cameraController.dispose();
    }
    cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);

    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    if (cameraController.value.hasError) {
      print('Camera eroor ${cameraController.value.errorDescription}');
    }
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                width: Get.size.width,
                height: Get.size.height,
                child: Expanded(
                  flex: 1,
                  child: _cameraPreviewWidget(context),
                ),
              ),
            
              Column(
                children: [
                  renderLogoArea(),
                  renderProgressArea(),
                ],
              ),

              Row(
                children: [
                  _cameraControlWidget(context), 
                ],
              ),

              _cameraoverlayWidget(),
              
              Row(
                children: [
                  _cameraToggleRowWidget(),
                ],
              ),      
            ],
          ),
        ),
      ),
    );
  }

  Widget renderLogoArea() {
    return Container(
      decoration: BoxDecoration(
        color: colorSet.tfColor,
        border: Border.all(
          width: 0.5,
          color: colorSet.tfColor,
        ),
      ),
      width: designSet.getLogoAreaWidth(),
      height: designSet.getLogoAreaHeight(),
    );
  }

  Widget renderProgressArea() {
    return Container(
      decoration: BoxDecoration(
        color: colorSet.tfColor,
        border: Border.all(
          width: 0.5,
          color: colorSet.tfColor,
        ),
      ),
      width: designSet.getProgressAreaWidth(),
      height: designSet.getProgressAreaHeight(),
      child: Column(
        children: [
          AnimatedLiquidLinearProgressIndicator(),
          ProcessBar(
            index: 3,
          ),
        ],
      ),
    );
  }

  //camerapreview
  Widget _cameraPreviewWidget(BuildContext context) {
    if (cameraController == null || !cameraController.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    return AspectRatio(
      aspectRatio: cameraController.value.aspectRatio,
      child: CameraPreview(cameraController),
    );
  }

  //display control bar to take pictures
  Widget _cameraControlWidget(context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(
                Icons.camera,
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
              onPressed: () {
                _onCapturePressed(context);
              },
            )
          ],
        ),
      ),
    );
  }
    Widget _cameraoverlayWidget(){
    return Container(
      padding: EdgeInsets.fromLTRB(350, 120, 100, 60),
              child: FDottedLine(
              color: Colors.black,
              height: 500.0,
              width: 500.0,
              strokeWidth: 3.0,
              dottedLength: 10.0,
              space: 12.0,
              ),
              );

  }
  //display a row of taggle to select the camera
  Widget _cameraToggleRowWidget() {
    if (cameras == null || cameras.isEmpty) {
      return Spacer();
    }
    CameraDescription selectedCamera = cameras[selectedCameraIndex];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Expanded(
      child: Align(
        alignment: Alignment.bottomLeft,
        // ignore: deprecated_member_use
        child: FlatButton.icon(
            onPressed: _onSwitchCamera,
            icon: Icon(
              _getCameraLensIcon(lensDirection),
              color: Colors.white,
              size: 24,
            ),
            label: Text(
              '${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1).toUpperCase()}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            )),
      ),
    );
  }

  void _showCameraException(CameraException e) {
    String errorText = 'Error : ${e.code}\n Error message : ${e.description}';
    print(errorText);
  }

  void _onCapturePressed(context) async {
    try {
      final path =
          join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');
      await cameraController.takePicture().then((value) {
        print(value.path);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PreviewPage(
              imgPath: value.path,
            ),
          ),
        );
      });
    } catch (e) {
      _showCameraException(e);
    }
  }

  void _onSwitchCamera() {
    selectedCameraIndex =
        selectedCameraIndex < cameras.length - 1 ? selectedCameraIndex + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIndex];
    _initCameraController(selectedCamera);
  }

  IconData _getCameraLensIcon(CameraLensDirection lensDirection) {
    switch (lensDirection) {
      case CameraLensDirection.back:
        return CupertinoIcons.switch_camera;
      case CameraLensDirection.front:
        return CupertinoIcons.switch_camera_solid;
      case CameraLensDirection.external:
        return CupertinoIcons.photo_camera;
        return Icons.device_unknown;
    }
  }
}
