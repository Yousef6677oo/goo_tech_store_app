import 'package:flutter/material.dart';

class DialogUtils {
  static void loadingDialog(BuildContext context) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            backgroundColor: Theme.of(context).splashColor,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Loading...',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          );
        });
  }

  static void showMessageDialog(BuildContext context, String message) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            backgroundColor: Theme.of(context).splashColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "try again",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0x46000000)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
