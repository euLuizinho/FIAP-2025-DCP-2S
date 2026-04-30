// firebase_options.dart (resumo)
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.windows:
        return windows;
      default:
        throw UnsupportedError('Plataforma nao suportada.');
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyDfvaVQHapnQulv631f5COe-VnZJ_Zdpo0",
    authDomain: "aulafirebase-e61f5.firebaseapp.com",
    projectId: "aulafirebase-e61f5",
    storageBucket: "aulafirebase-e61f5.firebasestorage.app",
    messagingSenderId: "691607659492",
    appId: "1:691607659492:web:d5585ff2aefbeb3c849df1",
    measurementId: "G-B48G1GWYLF",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'ANDROID_API_KEY',
    appId: 'ANDROID_APP_ID',
    messagingSenderId: 'MESSAGING_SENDER_ID',
    projectId: 'PROJECT_ID',
    storageBucket: 'PROJECT_ID.firebasestorage.app',
  );

  static const FirebaseOptions windows = web;
}
