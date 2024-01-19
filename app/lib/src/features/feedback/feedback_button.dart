import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/api.dart';
import '../../exceptions/api_exception.dart';
import '../../utils/dio_provider.dart';
import '../../utils/logger.dart';

part 'feedback_provider.g.dart';

class FeedbackRepository {
  FeedbackRepository ({required this.dio});
  final Dio dio;

  String _getUrl({int? id}) {
    final url = Uri(scheme: Api.schema, host: Api.host, path: Api.eventsPath)
        .toString();
    if (id != null) {
      return '$url$id';
    } else {
      return url;
    }
  }
}

class FeedBackButton extends ConsumerStatefulWidget {
  const FeedBackButton({super.key});

  @override
  ConsumerState<FeedBackButton> createState() => _FeedBackButtonState();
}

class _FeedBackButtonState extends ConsumerState<FeedBackButton> {
  final _TextFieldController = TextEditingController();

  @override 
  void initState()
  {
    super.initState();
  }

  @override
  void dispose()
  {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { 
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context, 
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row (
                children: [
                  const Expanded (
                    child: Text (
                      'Feedback',
                      style: TextStyle (
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                    Icons.close,
                    color: Colors.red
                  ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ]
              ),
              content: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text (
                    'What would you like to tell us?',
                    style: TextStyle(
                    fontWeight: FontWeight.bold
                    ),
                  ),
                  TextField(
                    minLines: 5,
                    maxLines: 5,
                    controller: _TextFieldController,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration (
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton (
                      child: const Text("Send"),
                      onPressed: () {
                        Navigator.pop(context);
                        String text = _TextFieldController.text;
                      }
                    ),
                  ),
                ]
              )
            );
          } 
        );
      },
      child: const Text ("Feedback"),
    );
  }
}