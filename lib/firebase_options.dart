import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      // case TargetPlatform.iOS:
      //   return ios;

      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDo7q5wpqEgFnnJaZ09VNSObYzGTH3o-gg',
    appId: '1:618808080398:android:24c34182ecb315e98da45f',
    messagingSenderId: '618808080398',
    projectId: 'learningapp-371ba',
    storageBucket: 'learningapp-371ba.appspot.com',
  );

  // static const FirebaseOptions ios = FirebaseOptions(
  //   apiKey: 'AIzaSyBkceDzMsd4jke1vuUOmhBTp8RSjmelcb0',
  //   appId: '1:706823177007:ios:621c6b5c553e5aa7da97da',
  //   messagingSenderId: '706823177007',
  //   projectId: 'rr-mobile-application-v2',
  //   storageBucket: 'rr-mobile-application-v2.appspot.com',
  //   androidClientId:
  //       '706823177007-ib2cnegng9hqtu84obvct5tnb3aeidm9.apps.googleusercontent.com',
  //   iosClientId:
  //       '706823177007-4ltv8f75rnccmmthqfpep7rab3moq8sv.apps.googleusercontent.com',
  //   iosBundleId: 'uat.rabbitrewards.apps',
  // );
}
