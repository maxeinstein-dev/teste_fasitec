import 'package:flutter/material.dart';
import 'package:teste_fasitec/app/modules/form1/form1_controller.dart';

void showOverlay(BuildContext context, Widget formWidget) {
  final Form1Controller controller = Form1Controller();
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 100.0,
      left: 20.0,
      right: 20.0,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: formWidget,
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);
  controller.setCurrentOverlay(overlayEntry);
}
