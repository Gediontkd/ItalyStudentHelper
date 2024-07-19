// recording_details.dart
import 'package:flutter/material.dart';
import 'package:michele_s_application8/widgets/custom_button.dart';

class RecordingDetails extends StatelessWidget {
  final String recordingDetails;
  final String duration;
  final String title;
  final String presenterName;
  final VoidCallback onStop;

  RecordingDetails({
    required this.recordingDetails,
    required this.duration,
    required this.title,
    required this.presenterName,
    required this.onStop,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    recordingDetails,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Durata: $duration',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Titolo: $title',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nome del relatore: $presenterName',
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
              onTap: onStop,
            ),
          ],
        ),
      ),
    );
  }
}
