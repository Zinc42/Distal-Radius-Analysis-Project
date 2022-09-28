import 'package:flutter/material.dart';

import "screen_button.dart";
import "image_upload_screen.dart";

import 'dart:io';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  static const String id = "menu_screen";

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

// argument class that contains arguments for the screen
class MenuScreenArguments {
  MenuScreenArguments({required this.analysisType});

  final String analysisType;
}

// state class that handles logic in the screen
class _MenuScreenState extends State<MenuScreen> {

  String? frontImagePath;
  String? sideImagePath;

  @override
  Widget build(BuildContext context) => _MenuScreenView(state: this);

  ImageProvider getFrontImageDisplay() {
    if (frontImagePath == null) {
      return AssetImage("lib/images/image_placeholder.png");
    } else {
      return FileImage(File(frontImagePath!));
    }
  }

  ImageProvider getSideImageDisplay() {
    if (sideImagePath == null) {
      return AssetImage("lib/images/image_placeholder.png");
    } else {
      return FileImage(File(frontImagePath!));
    }
  }

  void setSideImagePath(String newSideImagePath) {
    sideImagePath = newSideImagePath;
  }

  void setFrontImagePath(String newFrontImagePath) {
    frontImagePath = newFrontImagePath;
  }
}

// view class that purely builds the UI elements
class _MenuScreenView extends StatelessWidget {
  const _MenuScreenView({super.key, required this.state});

  final _MenuScreenState state;

  @override
  Widget build(BuildContext context) {

    final MenuScreenArguments args = ModalRoute.of(context)!.settings.arguments as MenuScreenArguments;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 35, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center, 
              children: [
                const Positioned(left: 10, child: BackButton()),
                Align(
                  child: Text(
                    args.analysisType,
                    textScaleFactor: 1.5,
                    textAlign: TextAlign.center,
                  ),
                ),
              ]
            ),
            const SizedBox(height: 40),
            ScreenButton(
              buttonText: "Import Frontal View",
              pressFunction: () {
                Navigator.pushNamed(
                  context,
                  ImageUploadScreen.id);
              },
            ),
            const SizedBox(height: 20),
            Image(
              height: 200,
              width: 200,
              image: state.getFrontImageDisplay(),
            ),
            SizedBox(
              height: 30,
            ),
            ScreenButton(
              buttonText: "Import Side View",
              pressFunction: () {
                Navigator.pushNamed(
                  context,
                  ImageUploadScreen.id);
              },
            ),
            const SizedBox(height: 20),
            Image(
              height: 200,
              width: 200,
              image: state.getSideImageDisplay(),
            ),
            SizedBox(
              height: 50,
            ),
            ScreenButton(
              buttonText: "Run Analysis",
              pressFunction: () {
                print("Run Analysis");
              },
            ),
            
          ],
        ),
      ) 
    );
  }
}
