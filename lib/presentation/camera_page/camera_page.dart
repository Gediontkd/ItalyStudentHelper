import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CameraPage extends StatelessWidget {
  final String loginUrl = dotenv.env['SERVER_URL']! + '/auth/login';
  final String moveCameraUrl = dotenv.env['SERVER_URL']! + '/move-camera';

  Future<http.Client> createHttpClient() async {
    final ioc = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    return IOClient(ioc);
  }

  Future<String> loginAndGetToken(http.Client client) async {
    var url = Uri.parse(loginUrl);
    var data = {
      'username': dotenv.env['USERNAME']!,
      'password': dotenv.env['PASSWORD']!,
    };

    var body = data.keys
        .map((key) =>
    "${Uri.encodeComponent(key)}=${Uri.encodeComponent(data[key] ?? '')}")
        .join("&");

    var response = await client.post(
      url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: body,
    );

    var responseBody = response.body;
    var parsedJson = jsonDecode(responseBody);

    if (parsedJson['access_token'] != null) {
      return parsedJson['access_token'];
    } else {
      throw Exception('Token not found in response');
    }
  }

  Future<void> sendPostRequestMoveCamera(
      BuildContext context, String token, Map<String, dynamic> data) async {
    var url = Uri.parse(moveCameraUrl);
    var jsonData = jsonEncode(data);

    HttpClient httpClient = HttpClient()
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

    var request = await httpClient.postUrl(url)
      ..headers.contentType = ContentType.json
      ..headers.add('Authorization', 'Bearer $token')
      ..write(jsonData);

    var response = await request.close();

    var responseBody = await utf8.decodeStream(response);
    var responseJson = jsonDecode(responseBody);
    var message = responseJson['message'] ?? 'Unknown response';

    bool isError = message.startsWith('Error:') || message.startsWith('Errore:');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final client = await createHttpClient();
                        String token = await loginAndGetToken(client);
                        await sendPostRequestMoveCamera(context, token, {
                          "baseUrl": dotenv.env['IP_CAMERA_BASE_URL']!,
                          "username": dotenv.env['IP_CAMERA_USERNAME']!,
                          "password": dotenv.env['IP_CAMERA_PASSWORD']!,
                          "preset": 1
                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Transform.rotate(
                          angle: 3.14 / 2,
                          child: Image.asset(
                            'assets/images/img1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final client = await createHttpClient();
                        String token = await loginAndGetToken(client);
                        await sendPostRequestMoveCamera(context, token, {
                          "baseUrl": dotenv.env['IP_CAMERA_BASE_URL']!,
                          "username": dotenv.env['IP_CAMERA_USERNAME']!,
                          "password": dotenv.env['IP_CAMERA_PASSWORD']!,
                          "preset": 3
                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Transform.rotate(
                          angle: 3.14 / 2,
                          child: Image.asset(
                            'assets/images/img2.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final client = await createHttpClient();
                        String token = await loginAndGetToken(client);
                        await sendPostRequestMoveCamera(context, token, {
                          "baseUrl": dotenv.env['IP_CAMERA_BASE_URL']!,
                          "username": dotenv.env['IP_CAMERA_USERNAME']!,
                          "password": dotenv.env['IP_CAMERA_PASSWORD']!,
                          "preset": 2
                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Transform.rotate(
                          angle: 3.14 / 2,
                          child: Image.asset(
                            'assets/images/img3.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: screenHeight * 0.15,
                left: screenWidth * 0.05,
                child: GestureDetector(
                  onTap: () async {
                    final client = await createHttpClient();
                    String token = await loginAndGetToken(client);
                    await sendPostRequestMoveCamera(context, token, {
                      "baseUrl": dotenv.env['IP_CAMERA_BASE_URL']!,
                      "username": dotenv.env['IP_CAMERA_USERNAME']!,
                      "password": dotenv.env['IP_CAMERA_PASSWORD']!,
                      "preset": 5
                    });
                  },
                  child: Transform.rotate(
                    angle: 3.14 / 2, // Rotating 90 degrees (PI / 2 radians)
                    child: FaceSymbol(),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.35,
                left: screenWidth * 0.05,
                child: GestureDetector(
                  onTap: () async {
                    final client = await createHttpClient();
                    String token = await loginAndGetToken(client);
                    await sendPostRequestMoveCamera(context, token, {
                      "baseUrl": dotenv.env['IP_CAMERA_BASE_URL']!,
                      "username": dotenv.env['IP_CAMERA_USERNAME']!,
                      "password": dotenv.env['IP_CAMERA_PASSWORD']!,
                      "preset": 4
                    });
                  },
                  child: Transform.rotate(
                    angle: 3.14 / 2, // Rotating 90 degrees (PI / 2 radians)
                    child: FaceSymbol(),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.7,
                left: screenWidth * 0.05,
                child: GestureDetector(
                  onTap: () async {
                    final client = await createHttpClient();
                    String token = await loginAndGetToken(client);
                    await sendPostRequestMoveCamera(context, token, {
                      "baseUrl": dotenv.env['IP_CAMERA_BASE_URL']!,
                      "username": dotenv.env['IP_CAMERA_USERNAME']!,
                      "password": dotenv.env['IP_CAMERA_PASSWORD']!,
                      "preset": 6
                    });
                  },
                  child: Transform.rotate(
                    angle: 3.14 / 2, // Rotating 90 degrees (PI / 2 radians)
                    child: FaceSymbol(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class FaceSymbol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.face, // Using a built-in face icon
      size: 50.0,
      color: Colors.blue,
    );
  }
}