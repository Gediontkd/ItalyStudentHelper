import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:michele_s_application8/widgets/custom_button.dart';
import 'package:michele_s_application8/widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;
import 'package:michele_s_application8/presentation/camera_page/camera_page.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _timeController1 = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _presenterNameController = TextEditingController();
  final TextEditingController _camNumberController = TextEditingController(text: '1');
  late TextEditingController _languageController;

  bool isRecording = false;
  bool isLoading = false;
  bool isError = false;
  bool showStartRecordingButton = true;

  Timer? _recordingTimer;

  @override
  void initState() {
    super.initState();
    String deviceLanguage = ui.window.locale.languageCode;
    String language = (deviceLanguage == 'en') ? 'EN' : (deviceLanguage == 'it') ? 'IT' : 'IT';
    _languageController = TextEditingController(text: language);
  }

  @override
  void dispose() {
    _recordingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.white, Colors.purple],
    ),
    ),
        child: Stack(
          children: [
            Center( // Use Center to vertically and horizontally center the form
              child: Column(
                mainAxisSize: MainAxisSize.min, // Minimize the column size to its content
                children: [
                  if (!isRecording || showStartRecordingButton)
                  Text(
                    'CookingLab',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  if (!isRecording || showStartRecordingButton)
                    Form(
                      key: _formKey,
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(horizontal: 23),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      child: Container(
                                        height: MediaQuery.of(context).copyWith().size.height / 3,
                                        child: CupertinoTimerPicker(
                                          mode: CupertinoTimerPickerMode.hms,
                                          onTimerDurationChanged: (Duration duration) {
                                            _timeController1.text = "${duration.inHours.toString().padLeft(2, '0')}:${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}";
                                          },
                                          initialTimerDuration: Duration(hours: DateTime.now().hour, minutes: DateTime.now().minute, seconds: DateTime.now().second),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: AbsorbPointer(
                                child: CustomTextFormField(
                                  controller: _timeController1,
                                  prefixIcon: Icon(Icons.timer),
                                  hintText: "Inserisci la durata",
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  margin: EdgeInsets.fromLTRB(5, 12, 10, 0),
                                  validator: (value) {
                                    if (value != null && !isTime(value)) {
                                      return "Inserisci un'ora valida (HH:MM:SS)";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            CustomTextFormField(
                              controller: _titleController,
                              prefixIcon: Icon(Icons.title),
                              hintText: "Inserisci il titolo",
                              margin: EdgeInsets.fromLTRB(5, 12, 10, 0),
                              validator: (value) {
                                if (value != null && !isText(value)) {
                                  return "Inserisci un testo valido"'';
                                }
                                return null;
                              },
                            ),
                            CustomTextFormField(
                              controller: _presenterNameController,
                              prefixIcon: Icon(Icons.person),
                              hintText: "Inserisci il nome del relatore",
                              margin: EdgeInsets.fromLTRB(5, 12, 10, 0),
                              validator: (value) {
                                if (value != null && !isText(value)) {
                                  return "Inserisci un testo valido";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (!isRecording || showStartRecordingButton)
                    CustomButton(
                      text: "inizia a registrare",
                      margin: EdgeInsets.fromLTRB(50, 30, 50, 10),
                      variant: ButtonVariant.OutlineBlack9003f,
                      padding: ButtonPadding.PaddingAll9,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          // Remove focus from any focused text field
                          FocusScope.of(context).unfocus();
                          String token = await loginAndGetToken();
                          String time = _timeController1.text;
                          String camNumber = _camNumberController.text;
                          Map<String, dynamic> data = {
                            "title": _titleController.text,
                            "presenter_name": _presenterNameController.text,
                            "language": _languageController.text,
                          };
                          try {
                            await sendPostRequestStart(token, data, time, camNumber);
                            setState(() {
                              isRecording = true;
                              showStartRecordingButton = false;
                            });
                            // Start the timer to update the UI after the duration ends
                            List<String> timeParts = time.split(':');
                            int durationInSeconds = int.parse(timeParts[0]) * 3600 + int.parse(timeParts[1]) * 60 + int.parse(timeParts[2]);
                            _recordingTimer = Timer(Duration(seconds: durationInSeconds), () {
                              setState(() {
                                showStartRecordingButton = true;
                                _resetFormFields();
                              });
                            });
                          } catch (error) {
                            setState(() {
                              isError = true;
                            });
                          } finally {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        } else {
                          Get.snackbar(
                            "Errore",
                            "Si prega di compilare tutti i campi richiesti",
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      },
                    ),
                  if (isRecording && !showStartRecordingButton && !isError)
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min, // Minimize the column size to its content
                          children: [
                            Container(
                              padding: EdgeInsets.all(40), // Increase the padding to increase the size of the Container
                              decoration: BoxDecoration(
                                color: Colors.white, // Change this to your preferred color
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Dettagli di registrazione',
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Durata: ${_timeController1.text}',
                                    style: TextStyle(fontSize: 20, color: Colors.black),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Titolo: ${_titleController.text}',
                                    style: TextStyle(fontSize: 20, color: Colors.black),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Nome del relatore: ${_presenterNameController.text}',
                                    style: TextStyle(fontSize: 20, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            CustomButton(
                              text: "Interrompi la registrazione",
                              margin: EdgeInsets.fromLTRB(80, 10, 80, 10),
                              variant: ButtonVariant.OutlineBlack9003f,
                              padding: ButtonPadding.PaddingAll15,
                              onTap: () async {
                                String token = await loginAndGetToken();
                                String camNumber = _camNumberController.text;
                                await sendPostRequestStop(token, camNumber);
                                setState(() {
                                  isRecording = false;
                                  showStartRecordingButton = true;
                                  _resetFormFields();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            if (isLoading)
              Positioned.fill(
                child: Container(
                  color: Colors.black54,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: isLoading
                  ? SizedBox() // Hide the button when isLoading is true
                  : CustomButton(
                text: "Vai a Fotocamera",
                // prefixIcon: Icon(Icons.camera_alt),
                margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                variant: ButtonVariant.OutlineBlack9003f,
                padding: ButtonPadding.PaddingAll9,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CameraPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void _resetFormFields() {
    _timeController1.clear();
    _titleController.clear();
    _presenterNameController.clear();
  }

  Future<String> loginAndGetToken() async {
    var url = Uri.parse('https://192.168.60.230:5050/auth/login');
    var data = {
      'username': dotenv.env['USERNAME'],
      'password': dotenv.env['PASSWORD'],
    };

    var body = data.keys.map((key) => "${Uri.encodeComponent(key)}=${Uri.encodeComponent(data[key] ?? '')}").join("&");

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

    var request = await httpClient.postUrl(url)
      ..headers.contentType = ContentType("application", "x-www-form-urlencoded")
      ..write(body);

    var response = await request.close();

    var responseBody = await utf8.decodeStream(response);
    var parsedJson = jsonDecode(responseBody);

    if (parsedJson['access_token'] != null) {
      return parsedJson['access_token'];
    } else {
      throw Exception('Token not found in response');
    }
  }


  Future<void> sendPostRequestStart(String token, Map<String, dynamic> data, String time, String camNumber) async {
    var url = Uri.parse('https://192.168.60.230:5050/start-recording');
    List<String> timeParts = time.split(':');
    int durationInSeconds = int.parse(timeParts[0]) * 3600 + int.parse(timeParts[1]) * 60 + int.parse(timeParts[2]);
    durationInSeconds += 10;

    var requestData = {
      "camera_name": int.parse(camNumber),
      "duration": durationInSeconds,
      "title": data['title'],
      "presenter_name": data['presenter_name'],
      "language": data['language']
    };
    var jsonData = jsonEncode(requestData);

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

    var request = await httpClient.postUrl(url)
      ..headers.contentType = ContentType.json
      ..headers.add('Authorization', 'Bearer $token')
      ..write(jsonData);

    var response = await request.close();

    var responseBody = await utf8.decodeStream(response);
    var responseJson = jsonDecode(responseBody);
    var message = responseJson['message'];

    bool isError = message.startsWith('Error:') || message.startsWith('Errore:');

    Get.snackbar(
      isError ? "Error" : "Message",
      message,
      backgroundColor: isError ? Colors.red : Colors.green,
      colorText: Colors.white,
    );
    setState(() {
      this.isError = isError;
      if (isError) {
        isRecording = false;
        throw Exception('Failed to start recording');
      }
    });
  }


  Future<void> sendPostRequestStop(String token, String camNumber) async {
    var url = Uri.parse('https://192.168.60.230:5050/stop-recording');

    var requestData = {
      "camera_name": int.parse(camNumber),
    };
    var jsonData = jsonEncode(requestData);

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

    var request = await httpClient.postUrl(url)
      ..headers.contentType = ContentType.json
      ..headers.add('Authorization', 'Bearer $token')
      ..write(jsonData);

    var response = await request.close();

    var responseBody = await utf8.decodeStream(response);
    var responseJson = jsonDecode(responseBody);
    var message = responseJson['message'];

    bool isError = message.startsWith('Error:') || message.startsWith('Errore:');

    Get.snackbar(
      isError ? "Error" : "Message",
      message,
      backgroundColor: isError ? Colors.red : Colors.green,
      colorText: Colors.white,
    );

    setState(() {
      this.isError = isError;
      if (!isError) {
        isRecording = false;
        _timeController1.clear();
        _titleController.clear();
        _presenterNameController.clear();
      }
    });
  }

  bool isTime(String time) {
    var timeParts = time.split(':');
    if (timeParts.length != 3) {
      return false;
    }
    var hours = int.tryParse(timeParts[0]);
    var minutes = int.tryParse(timeParts[1]);
    var seconds = int.tryParse(timeParts[2]);
    return hours != null && hours >= 0 && hours < 24 &&
        minutes != null && minutes >= 0 && minutes < 60 &&
        seconds != null && seconds >= 0 && seconds < 60;
  }

  bool isText(String? value) {
    return value != null && value.isNotEmpty;
  }
}
