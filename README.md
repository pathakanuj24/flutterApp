

# Color Changing App

The Color Changing App is a simple mobile application built using Flutter and Firebase Firestore. It allows users to change the background color of a circle on the screen by clicking on buttons. The RGB color values are stored in a Firestore database and can be updated in real-time.



## Getting Started

### Prerequisites

Before running the Color Changing App, make sure you have the following prerequisites installed:

- Flutter SDK: You can follow the installation instructions [here](https://flutter.dev/docs/get-started/install).
- Firebase Project: Set up a Firebase project and configure it for your app. Create a Firestore database and make sure you have the Firebase configuration options set in the `firebase_options.dart` file (not included in this repository).

### Installation

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/your-username/colorchangingapp.git

2. Navigate to the project directory:
   ```bash
   cd colorchangingapp

3. Install dependencies:
   ```bash
   flutter pub get
   
4. Run the app:
   ```bash
   flutter run
   
The Color Changing App should now be running on your device or simulator.

## Usage
Upon launching the app, you will see a circle with an initial color (red, green, blue). 

You can change the color by clicking on the following buttons:
-  "Change Color to Green": Sets the green component to 255.
-  "Change Color to Blue": Sets the blue component to 255.
-  "Change Color to Red": Sets the red component to 255.

The color changes will be reflected in real-time both in the app and in the Firestore database.

## Features
- Real-time color updates using Firebase Firestore.
- Simple and intuitive user interface.
- Easily customizable with additional features and UI enhancements.
