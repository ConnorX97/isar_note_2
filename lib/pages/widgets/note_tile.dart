import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class NoteTile extends StatelessWidget {
  final String title;
  final String text;
  final Function()? delete;
  final Function()? longTap;
  const NoteTile(
      {super.key,
      required this.title,
      required this.text,
      required this.delete,
      required this.longTap});

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onLongTap: longTap,
      beginDuration: const Duration(milliseconds: 200),
      endDuration: const Duration(milliseconds: 200),
      end: 0.97,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromRGBO(77, 77, 77, 1)),
        child: ListTile(
          leading: Icon(
            Icons.brightness_1,
            size: 14,
            color: Colors.grey.shade400,
          ),
          title: Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            title,
            style: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          subtitle: Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            text,
            style: const TextStyle(fontFamily: "Poppins", color: Colors.white),
          ),
          trailing: IconButton(onPressed: delete, icon: Icon(Icons.deblur),),
        ),
      ),
    );
  }
}


