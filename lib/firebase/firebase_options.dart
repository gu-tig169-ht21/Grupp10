import 'package:firebase_core/firebase_core.dart';

FirebaseOptions getOptions() {
  Map<String, String> options = {
    "apiKey": "AIzaSyCem--eVU6b44u09TbNHfxWgKrVwpSNaSQ",
    "appId": "1:775269442553:android:18b895c96ccd032526d328",
    "messagingSenderId":
        "775269442553-g09dcehois6esh3k84jso34hrk0kbtjl.apps.googleusercontent.com",
    "projectId": "nicotrack-dadbc",
    "databaseURL":
        "https://nicotrack-dadbc-default-rtdb.europe-west1.firebasedatabase.app",
    "storageBucket": "nicotrack-dadbc.appspot.com",
  };

  return FirebaseOptions.fromMap(options);
}

/*
FirebaseOptions(
        apiKey: "AIzaSyCem--eVU6b44u09TbNHfxWgKrVwpSNaSQ",
        appId: "1:775269442553:android:18b895c96ccd032526d328",
        messagingSenderId:
            "775269442553-g09dcehois6esh3k84jso34hrk0kbtjl.apps.googleusercontent.com",
        projectId: "nicotrack-dadbc",
        databaseURL:
            "https://nicotrack-dadbc-default-rtdb.europe-west1.firebasedatabase.app",
        storageBucket: "nicotrack-dadbc.appspot.com",
      ),
*/
