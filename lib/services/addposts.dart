import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instaclone/widgets/captionpage.dart';
import 'package:instaclone/widgets/videoview.dart';
import 'package:instaclone/services/globals.dart' as global;

List<CameraDescription> cameras = global.cameras;

class addposts extends StatefulWidget {
  const addposts({Key? key}) : super(key: key);

  @override
  _addpostsState createState() => _addpostsState();
}

class _addpostsState extends State<addposts> {
  late CameraController controller;
  bool cameracontrollerisinitialised = false;
  bool isreel = false, issnap = true, isrec = false;
  @override
  void initState() {
    super.initState();
    cameracontrollerisinitialised = false;
    controller = CameraController(cameras[0], ResolutionPreset.high);
    controller.initialize().then((_) {
      if (!mounted) {
        return CircularProgressIndicator();
      }
      setState(() {
        cameracontrollerisinitialised = true;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    print(image);

    if (image != null) {
      cropimage(image);

      // Navigator.pushNamed(context, '/imagepreview');
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text("ADD MORE!?"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => addposts()));
                },
                child: const Text("YES")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => captionpage()));
                },
                child: const Text("NO")),
          ],
        );
      },
    );
  }

  cropimage(XFile? image) async {
    final pathimage = File(image!.path);
    File? croppedimage = await ImageCropper.cropImage(
        sourcePath: pathimage.path,
        androidUiSettings: const AndroidUiSettings(
            toolbarTitle: 'Crop It!',
            toolbarColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
            activeControlsWidgetColor: Colors.blue));
    global.currentpostlist.add(croppedimage!.path);
    _showMyDialog();
  }

  void getsnap() async {
    final XFile? image = await controller.takePicture();
    print(image);
    if (image != null) {
      cropimage(image);

      // Navigator.pushNamed(context, '/imagepreview');
      /*Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => EditImage()));*/
    }
  }

  switchcam() {
    controller = CameraController(cameras[1], ResolutionPreset.high);

    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  getvideo() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    print(video);
    if (video != null) {
      String vpath = video.path;
      // Navigator.pushNamed(context, '/imagepreview');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => videoview(vpath)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (!cameracontrollerisinitialised) {
      print("Camera controller not initiated");
      return Container();
    }
    print("Camera controller initiated");
    var camera = controller.value;
    var scale = size.aspectRatio * camera.aspectRatio;
    if (scale < 1) {
      scale = 1 / scale;
    }
    return Container(
        child: Stack(children: [
      Transform.scale(
        scale: scale,
        child: CameraPreview(controller),
      ),
      //CameraPreview(controller),
      Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 10,
              ),
              Container(
                child: issnap
                    ? GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: const Icon(
                          Icons.photo_album,
                          color: Colors.white,
                          size: 35,
                        ))
                    : GestureDetector(
                        onTap: () {
                          getvideo();
                        },
                        child: const Icon(
                          Icons.video_library,
                          color: Colors.white,
                          size: 35,
                        )),
              ),
              Container(
                width: (MediaQuery.of(context).size.width) / 4.5,
              ),
              Container(
                child: issnap
                    ? GestureDetector(
                        onTap: getsnap,
                        child: Container(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                          ),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(35),
                            ),
                            border: Border.all(
                              width: 10,
                              color: Colors.white.withOpacity(.5),
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onLongPress: () async {
                          /*var path = (await getTemporaryDirectory()).path;
                          path = path + '${DateTime.now()}.mp4';*/
                          await controller.startVideoRecording();
                          setState(() {
                            isrec = true;
                          });
                        },
                        onLongPressUp: () async {
                          final XFile? video =
                              await controller.stopVideoRecording();
                          if (video != null) {
                            String vpath = video.path;
                            // Navigator.pushNamed(context, '/imagepreview');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        videoview(vpath)));
                          }
                          setState(() {
                            isrec = false;
                          });
                          print(video);
                        },
                        child: Container(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                          ),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(35),
                            ),
                            border: Border.all(
                              width: 10,
                              color: isrec
                                  ? Colors.purple.withOpacity(.5)
                                  : Colors.red.withOpacity(.5),
                            ),
                          ),
                        ),
                      ),
              ),
              Container(
                width: (MediaQuery.of(context).size.width) / 5.5,
              ),
              GestureDetector(
                  onTap: () {
                    switchcam();
                  },
                  child: const Icon(
                    Icons.cached,
                    color: Colors.white,
                    size: 35,
                  )),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height / 20,
          ),
          Container(
              color: Colors.black,
              height: size.height / 20,
              child: Row(
                children: [
                  Container(
                    width: size.width / 7,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          issnap = true;
                        });
                      },
                      child: const Text('SNAP',
                          textScaleFactor: 1,
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic))),
                  Container(
                    width: size.width / 9,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          issnap = false;
                        });
                      },
                      child: const Text(
                        'REELS',
                        textScaleFactor: 1,
                        style: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                      )),
                  Container(
                    width: size.width / 9,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'LIVE',
                        textScaleFactor: 1,
                        style: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                      )),
                ],
              ))
        ],
      )
    ]));
  }
  //end of file
}
