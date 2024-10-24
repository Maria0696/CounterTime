# Counter Time Application

This Flutter application is a simple countdown timer that allows users to set the timer's duration using both minutes and seconds. It features an intuitive user interface, animated countdown, and interactive control (play/pause) for managing the timer. The app is designed to help users keep track of time efficiently and can be easily adapted for different uses.

## Features

- Interactive Countdown: Allows users to set custom time intervals (minutes and seconds) and start a countdown.

- Play/Pause functionality: Users can pause and resume the countdown.

- Custom Input Dialog: The app provides a dialog for setting minutes and seconds separately.

- Progress Animation: Visual representation of the remaining time through a CircularProgressIndicator.

- Responsive UI: The app is optimized for different screen sizes and orientations.

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

1. Set Timer: Tap on the time display in the center of the screen to open a dialog where you can input the minutes and seconds for the countdown.

2. Start/Stop Timer: Use the floating action button at the bottom of the screen to start, pause, or resume the countdown.

3. Reset Timer: Once the timer reaches zero, you can reset it by tapping on the time display again and inputting new values.

## Customization

You can customize the app’s appearance and functionality by modifying the following:

- Timer Colors: The colors for the progress bar and text can be changed by adjusting the color property of the CircularProgressIndicator and Text widget.

- Duration Limits: You can limit the maximum duration that the user can input by adding validation in the _showTimeInputDialog method.

- Animation Style: The stroke width, background color, and duration of the animation can be adjusted in the CircularProgressIndicator and AnimationController respectively.

## Contributions

Contributions are welcome! If you have any ideas to improve the app or add new features, feel free to fork the project and open a pull request.
