import 'package:flutter/material.dart';
import 'package:group_devide_application/group_devide_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isNewGameStarted = false;

  @override
  Widget build(BuildContext context) {
    return isNewGameStarted
        ? const GroupDevideApp()
        : MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 100, 100, 100),
                title: const Text(
                  'Devide into Groups ',
                  textAlign: TextAlign.center,
                ),
              ),
              body: Container(
                decoration: const BoxDecoration(
                  

                    color: Color.fromARGB(255, 44, 44, 44)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Devide Into Groups',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isNewGameStarted = true;
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text('See new groups '),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
