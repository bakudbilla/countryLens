# countrylens

Countrylens is a flutter application that helps you view the list of countries worldwide using rest countries API, in this app, you will be able to view the details of each country such as their Capital,Region, subregion and population.

Prerequisites
Ensure you have the following tools installed:
Flutter SDK
Install Flutter
Dart SDK (comes with Flutter)
Android Studio (for Android emulation)
Git: Install Git

Installation
Clone the Repository:
git clone https://github.com/KennyKvn001/farm-ed_flutter_app 
cd insurancecostpredictor
Install Dependencies: Inside the project directory, run:

flutter pub get

Add required dependencies to pubspec.yaml:

dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0

Folder Structure
countrylens/
├── android/
├── ios/
├── lib/
│   ├── main.dart
│   ├── models/
│   │   ├── country.dart
│   ├── provider/
│   ├── screens/
│   ├── services/
├── linux/
├── macos/
├── web/
├── windows/
├── test/
├── build/
├── images/
├── pubspec.yaml
├── pubspec.lock
├── README.md
├── .gitignore
└── .metadata

Configure assets in pubspec.yaml:

flutter:
  assets:
    - images/background.jpeg
Running the Application

Start an Emulator or Connect a Device: Use Android Studio to launch an emulator or connect a physical device.

Run the App:

flutter run
Hot Reload (during development): Make changes and save to see updates instantly.
