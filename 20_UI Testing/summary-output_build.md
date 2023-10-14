# Summary of Output Build Flutter

- file output Flutter project untuk rilis ke store (format APK/AAB//IPA)
  > `flutter build apk/appbundle/ios`
  - .aab : environment release
  - .ipa : deprecated, butuh steps lebih lanjut untuk install
- mode build : debug:development / profile:performa / release:rilis
  > `flutter build <format> --<mode>`
  - debug & profile untuk testing
  - release menghapus data data testing; hanya data yang dibutuhkan user
- `debugShowCheckedModeBanner: kDebugMode`

## Build APK

- Android (.apk); installable
- **AndroidManifest.xml** - android/app/src/debug||main||profile

  - nama aplikasi : `android:label`
  - perizinan : tambah `uses-permission` di child `manifest`
    > `android:name="android.permission.INTERNET"`

- icon aplikasi

  - [generate icon dari web](<https://romannurik.github.io/AndroidAssetStudio/icons-launcher.html#foreground.type=clipart&foreground.clipart=android&foreground.space.trim=1&foreground.space.pad=0.25&foreColor=rgba(96%2C%20125%2C%20139%2C%200)&backColor=rgb(68%2C%20138%2C%20255)&crop=0&backgroundShape=circle&effects=none&name=ic_launcher>) -> unzip downloaded file; -> copas semua folder **mipmap** ke project : android/app/src/main/res

- output : build/app/outputs/apk/[mode]/**app-[mode].apk**

- error jdk : android/app/build.gradle - jdk7 -> jdk8

## Build IPA

- iOS (.ipa)
- mendaftar di [Apple Developer Program](https://developer.apple.com/programs/)

- ios/Runner/**info.plist**

  - nama aplikasi : di bawa key bundle name
    > `<string>[nama app]</string>`

- icon aplikasi

  - [web App Icon Generator](https://www.appicon.co/)
  - pilih platform iPhone
  - unzip; replace folder ios/Runnder/Assetts.xcassets/**AppIcon.appiconset**

- build : `flutter build ios`
- output : build/ios/archive

## Bonus

- [package rename nama aplikasi](https://www.appicon.co/)

  > `flutter pub global activate rename`  
  > `flutter pub global run rename --appname "My App Name"`

- [package flutter_launcher_icons untuk app icon](https://pub.dev/packages/flutter_launcher_icons)
  - insert icon 1024x1024 ke assets/ -> install package
  - tambah di **dev_dependencies** :
    > `flutter_icons:`  
    > `android: true`  
    > `ios: true`  
    > `image_path: "assets/logo.png"`
  - `flutter clean && flutter pub get && run flutter_launcher_icons:main`
