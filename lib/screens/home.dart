import 'package:crop_doctor/classes/language_init.dart';
import 'package:crop_doctor/classes/strings.dart';
import 'package:crop_doctor/classes/stringsEN.dart';
import 'package:crop_doctor/classes/stringsHI.dart';
import 'package:crop_doctor/reusable_widgets/reusable_widget.dart';

import 'package:flutter/material.dart';
import 'package:crop_doctor/classes/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {

  // @override
  // void dispose() {
  //   Hive.close();
  //   super.dispose();
  // }


  Color buttonColor = AppColor.buttonColorLight;
  double buttonFontSize = 24;
  double buttonWidth = 300;
  double buttonHeight = 60;
  double buttonRadius = 10;
  double buttonIconSize = 48;

  AppStrings? appStrings;

  void setLanguage(String languageID) {

    setState(() {
      if(languageID == "EN")
        appStrings = AppStringsEN();
      else
        appStrings = AppStringsHI();
    });
  }

  LanguageInitializer languageInitializer = LanguageInitializer();

  Widget _builderFunction(BuildContext context, AsyncSnapshot snapshot) {

    // var arguments = ModalRoute.of(context)!.settings.arguments as Map;
    // String crop = arguments["crop"];

    Widget child;

    if(snapshot.hasData) {

      appStrings = snapshot.data;

      child = Scaffold(
        backgroundColor: AppColor.backgroundColorLight,

        // CHANGE LANGUAGE BUTTON
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () {
        //     if (appStrings!.languageID == "EN") {
        //       languageInitializer.setLanguage("HI");
        //       setLanguage("HI");
        //     }
        //     else {
        //       languageInitializer.setLanguage("EN");
        //       setLanguage("EN");
        //     }
        //   },
        //   label: Text(
        //     appStrings!.otherLanguage,
        //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        //   ),
        //   backgroundColor: AppColor.themeColorLight,
        // ),
        body: Stack(children: [
          // BACKGROUND IMAGE
          Container(
            decoration: BoxDecoration(
                gradient: colorScheme()
            ),
          ),

          // BUTTONS AND STUFF
          Padding(
            padding: const EdgeInsets.all(1),
            child: Center(
              child: Column(
                children: [
                  AppBar(
                    // leading: IconButton(
                    //   icon: Icon(Icons.arrow_back),
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //   },
                    // ),
                    title: Text("Welcome to KSKT!"),//00Text((crop=="tomato")?appStrings!.tomato:(crop=="millet_ear")?appStrings!.milletEar:appStrings!.milletLeaf),
                    backgroundColor : Colors.green,

                  ),
                  Spacer(),

                  // CAPTURE IMAGES BUTTON
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ElevatedButton.icon(

                      onPressed: () async {
                        await Navigator.pushNamed(context, "/capture_image", arguments: {"crop":"tomato"});
                        setState(() {});
                      },
                      icon: Align(
                        alignment: Alignment.centerLeft,
                        child: ImageIcon(
                          AssetImage("assets/camera_icon.png"),
                          size: buttonIconSize,
                        ),
                      ),
                      label: Align(
                        alignment: Alignment.center,
                        child: Text(
                            appStrings!.captureImage,
                            textAlign: TextAlign.center
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(buttonRadius)
                              )
                          ),
                          primary: buttonColor,
                          // fixedSize: Size(buttonWidth, buttonHeight),
                          minimumSize: Size(buttonWidth, buttonHeight),
                          //maximumSize: Size(buttonWidth, buttonHeight*2),
                          textStyle: TextStyle(
                              fontSize: buttonFontSize,
                              // fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                  ),

                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ]),
      );
    }
    else
      child = Scaffold(
        body: Center(
            child: Text("Loading..123")
        ),
      );

    return child;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: languageInitializer.initLanguage(),
      builder: _builderFunction,
    );
  }
}

