import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';

class CameraPage extends StatelessWidget {
  final String loginUrl = 'https://192.168.60.230:5050/auth/login';
  final String moveCameraUrl = 'https://192.168.60.230:5050/move-camera';

  Future<http.Client> createHttpClient() async {
    final ioc = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    return IOClient(ioc);
  }

  Future<String> loginAndGetToken(http.Client client) async {
    var url = Uri.parse(loginUrl);
    var data = {'username': 'admin', 'password': 'Pwdadmin1!'};

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

    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Builder(
                    builder: (context) => GestureDetector(
                      onTap: () async {
                        final client = await createHttpClient();
                        String token = await loginAndGetToken(client);
                        await sendPostRequestMoveCamera(context, token, {
                          "baseUrl": "HTTP://10.1.1.66:2000",
                          "username": "admin",
                          "password": "Adminadmin1",
                          "preset": 1
                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: Transform.rotate(
                              angle: 3.14 / 2,
                              child: Image.asset(
                                'assets/images/img1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) => GestureDetector(
                      onTap: () async {
                        final client = await createHttpClient();
                        String token = await loginAndGetToken(client);
                        await sendPostRequestMoveCamera(context, token, {
                          "baseUrl": "HTTP://10.1.1.66:2000",
                          "username": "admin",
                          "password": "Adminadmin1",
                          "preset": 3
                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: Transform.rotate(
                              angle: 3.14 / 2,
                              child: Image.asset(
                                'assets/images/img2.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) => GestureDetector(
                      onTap: () async {
                        final client = await createHttpClient();
                        String token = await loginAndGetToken(client);
                        await sendPostRequestMoveCamera(context, token, {
                          "baseUrl": "HTTP://10.1.1.66:2000",
                          "username": "admin",
                          "password": "Adminadmin1",
                          "preset": 2
                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: Transform.rotate(
                              angle: 3.14 / 2,
                              child: Image.asset(
                                'assets/images/img3.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 110.0,
              right: 350.0,
              child: GestureDetector(
                onTap: () async {
                  final client = await createHttpClient();
                  String token = await loginAndGetToken(client);
                  await sendPostRequestMoveCamera(context, token, {
                    "baseUrl": "HTTP://10.1.1.66:2000",
                    "username": "admin",
                    "password": "Adminadmin1",
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
              top: 350.0,
              right: 350.0,
              child: GestureDetector(
                onTap: () async {
                  final client = await createHttpClient();
                  String token = await loginAndGetToken(client);
                  await sendPostRequestMoveCamera(context, token, {
                    "baseUrl": "HTTP://10.1.1.66:2000",
                    "username": "admin",
                    "password": "Adminadmin1",
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
              top: 700.0,
              right: 350.0,
              child: GestureDetector(
                onTap: () async {
                  final client = await createHttpClient();
                  String token = await loginAndGetToken(client);
                  await sendPostRequestMoveCamera(context, token, {
                    "baseUrl": "HTTP://10.1.1.66:2000",
                    "username": "admin",
                    "password": "Adminadmin1",
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
        ),
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
