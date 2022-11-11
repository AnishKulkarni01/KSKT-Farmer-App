import 'package:crop_doctor/reusable_widgets/provider.dart';
import 'package:crop_doctor/screens/about.dart';
import 'package:crop_doctor/screens/disease_description.dart';
import 'package:crop_doctor/screens/examine_leaf.dart';
import 'package:crop_doctor/screens/image_details.dart';
import 'package:crop_doctor/screens/images_library.dart';
import 'package:crop_doctor/screens/reset_password.dart';
import 'package:crop_doctor/screens/sample_images.dart';
import 'package:crop_doctor/screens/capture_image.dart';
import 'package:crop_doctor/screens/fruits.dart';
import 'package:crop_doctor/screens/home.dart';
import 'package:crop_doctor/screens/diseases_library.dart';
import 'package:crop_doctor/screens/plant__diseases.dart';
import 'package:crop_doctor/screens/loading_screen.dart';
import 'package:crop_doctor/screens/sign_in.dart';
import 'package:crop_doctor/screens/sign_up.dart';
import 'package:crop_doctor/screens/tomato.dart';
import 'package:crop_doctor/screens/millet_ear.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:crop_doctor/screens/millet_leaf.dart';
import 'package:crop_doctor/screens/magnify_view.dart';
import 'package:provider/provider.dart';
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final appDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDirectory.path);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) :super(key : key);

// MATERIAL APP TO RUN IF DATABASE CONTAINS ALL DATA
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child : MaterialApp(
        debugShowCheckedModeBanner: false,

        routes: {
          "/": (context) => SplashScreen(),
          "/fruits": (context) => Fruit(),
          "/home": (context) => Home(),
          "/tomato": (context) => Tomato(),
          "/millet_ear": (context) => MilletEar(),
          "/millet_leaf": (context) => MilletLeaf(),
          "/capture_image":  (context) => CaptureImage(),
          "/diseases_library": (context) => DiseasesLibrary(),
          "/images_library":  (context) => ImagesLibrary(),
          "/sample_images":  (context) => SampleImages(),
          "/about":  (context) => About(),
          "/examine_leaf": (context) => ExamineLeaf(),
          "/image_details": (context) => ImageDetails(),
          "/plant_diseases": (context) => PlantDiseases(),
          "/disease_description": (context) => DiseaseDescription(),
          "/magnify": (context) => Magnify(),
          "/sign_in": (context) => SignInScreen(),
          "/sign_up": (context) => SignUpScreen(),
          "/reset_password": (context) => ResetPassword()
      }
  ),
  );

}

//flutter packages pub run build_runner build