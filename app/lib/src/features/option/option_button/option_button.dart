import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyButtonOption extends ConsumerWidget {
  const MyButtonOption({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref)
  {
    return ElevatedButton(
      onPressed: () {
          showDialog (
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog (
                scrollable: true,
                title: Row (
                  children: [
                    const Expanded (
                      child: Text (
                        'Options',
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
                    Container (
                      padding: const EdgeInsets.only(bottom: 5),
                      child: const Text (
                        'General',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        )
                      )
                    ),
                    Container (
                      padding: const EdgeInsets.only(bottom: 7),
                      child: const Column (
                        children: [
                            Text (
                            'some Setting'
                          )
                        ]
                      ),
                    ),
                    Container (
                      padding: const EdgeInsets.only(bottom: 5),
                      child: const Text (
                        'Menu',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        )
                      )
                    ),
                    Container (
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Column (
                        children: [
                          const Text (
                            'show Number of like'
                          )
                        ]
                      ),
                    ),
                    Container (
                      padding: EdgeInsets.only(bottom: 5),
                      child: const Text (
                        'Event',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        )
                      )
                    ),
                    Container (
                      padding: EdgeInsets.only(bottom: 7),
                      child: Column (
                        children: [
                          const Text (
                            'Hide Number of participants'
                          )
                        ]
                      ),
                    ),
                  ]
                ),
              );
            }
          );
        },
        child: const Text("option")
      );
   }
}
