// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FinalView(),
    );
  }
}

class FinalView extends StatefulWidget {
  const FinalView({super.key});

  @override
  _FinalViewState createState() => _FinalViewState();
}

class _FinalViewState extends State<FinalView> with TickerProviderStateMixin {
  late AnimationController controller;
  int inputMinutes = 0;
  int inputSeconds = 30;

  String get timerString {
    Duration duration = controller.duration! * controller.value;
    String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(minutes: inputMinutes, seconds: inputSeconds),
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _showTimeInputDialog() {
    Duration tempDuration = Duration(minutes: inputMinutes, seconds: inputSeconds);

    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.ms,
                  initialTimerDuration: tempDuration,
                  onTimerDurationChanged: (Duration newDuration) {
                    setState(() {
                      tempDuration = newDuration;
                    });
                  },
                ),
              ),
              CupertinoButton(
                child: Text("Set Time"),
                onPressed: () {
                  _updateTimer(tempDuration.inMinutes, tempDuration.inSeconds % 60);
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      },
    );
  }

  void _updateTimer(int minutes, int seconds) {
    setState(() {
      inputMinutes = minutes;
      inputSeconds = seconds;
      controller.duration = Duration(minutes: inputMinutes, seconds: inputSeconds);
      controller.reset();
      controller.value = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: const Text("Count Down Timer"),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.deepPurpleAccent,
                  height: controller.value * MediaQuery.of(context).size.height,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.center,
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: CircularProgressIndicator(
                                    color: controller.value < 0.5
                                        ? Colors.deepPurpleAccent
                                        : Colors.white,
                                    backgroundColor: controller.isAnimating
                                        ? const Color.fromARGB(74, 0, 0, 0)
                                        : Colors.deepPurpleAccent,
                                    strokeWidth: 20,
                                    value: controller.value,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: FractionalOffset.center,
                                child: GestureDetector(
                                  onTap: _showTimeInputDialog,
                                  child: Text(
                                    timerString,
                                    style: TextStyle(
                                      fontSize: 112.0,
                                      color: controller.value < 0.5
                                          ? Colors.deepPurpleAccent
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: FloatingActionButton.extended(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                controller.isAnimating ? 10 : 20,
                              ),
                            ),
                            backgroundColor: Colors.white,
                            onPressed: () {
                              if (controller.isAnimating) {
                                controller.stop();
                              } else {
                                controller.reverse(
                                  from: controller.value == 0.0
                                      ? 1.0
                                      : controller.value,
                                );
                              }
                            },
                            icon: Icon(
                              controller.isAnimating
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.deepPurpleAccent,
                            ),
                            label: Text(
                              controller.isAnimating ? "Pause" : "Play",
                              style: TextStyle(
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
