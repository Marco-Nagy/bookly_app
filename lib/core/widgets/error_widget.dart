import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ErrorScreen extends StatelessWidget {
  final VoidCallback? onPress;
  final String errorMsg;
  const ErrorScreen({super.key, this.onPress, required this.errorMsg});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Center(
            child: Icon(
              Icons.warning_amber_rounded,
              color: Colors.orangeAccent,
              size: 30,
            ),
          ),
          Container(
            child: Text(
              errorMsg,
              style: const TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),

          Container(
            height: 50,
            width: MediaQuery.sizeOf(context).width * .55,
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor, elevation: 500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                if (onPress != null) {
                  onPress!();
                }
              },
              child: const Text('Reload Screen',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
