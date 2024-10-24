# Counter Time Application

This Flutter application is a countdown timer that allows users to set the timer's duration using both minutes and seconds through an intuitive scroll-based input. It features an animated countdown, interactive control (play/pause) for managing the timer, and a sleek user interface that adapts to different screen sizes and orientations. 


## Features

- Scroll-based Time Input (Cupertino Picker): Users can easily set custom time intervals using a CupertinoTimerPicker, which provides a smooth scroll interface for selecting both minutes and seconds.

- Play/Pause Functionality: Users can pause and resume the countdown at any time with a single button press.

- Custom Input Dialog: The app presents a CupertinoModalPopup dialog to set the timer duration in a native scrollable picker interface.

- Progress Animation: Visual representation of the remaining time through a CircularProgressIndicator, which dynamically changes based on the countdown.

- Responsive UI: The app's design is optimized for both portrait and landscape orientations, and supports various screen sizes.

## Requirements

- Flutter SDK (v2.0.0 or higher)
- Dart (v2.12.0 or higher)

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/Maria0696/CounterTime.git
   
2. Navigate to the project directory:

    ```bash
   cd CounterTime
    
3. Install the dependencies:

   ```bash
   flutter pub get
   
4. Run the application:

   ```bash
   flutter run
   
## Usage

1. Set Timer: Tap on the time display in the center of the screen to open a scrollable time picker where you can select minutes and seconds. The time is set using a native-style CupertinoTimerPicker.

2. Start/Stop Timer: Use the floating action button at the bottom of the screen to start, pause, or resume the countdown.

3. Reset Timer: Once the timer reaches zero or after pausing, tap on the time display to reset and input new values.

## Customization

You can customize the app’s appearance and functionality by modifying the following:

- Timer Colors: Change the colors for the progress bar and text by adjusting the CircularProgressIndicator and Text widget properties.

- Timer Duration Limits: You can set maximum or minimum timer limits by adding validation logic in the _showTimeInputDialog method where the picker is displayed.

- Animation Style: Modify the stroke width, background color, and animation speed by adjusting the properties of the CircularProgressIndicator and the AnimationController.

- Cupertino Styling: If desired, you can adjust or replace the Cupertino-style picker with a more Material-focused design by using a Material dialog or input fields.

## Contributions

Contributions are welcome! If you have any ideas to improve the app or add new features, feel free to fork the project and open a pull request.
