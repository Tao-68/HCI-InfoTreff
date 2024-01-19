import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyFeedBackButton extends ConsumerStatefulWidget {
  const MyFeedBackButton({super.key});

  @override
  
  ConsumerState<MyFeedBackButton> createState() => _MyFeedBackButtonState();
}

class _MyFeedBackButtonState extends ConsumerState<MyFeedBackButton> {
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