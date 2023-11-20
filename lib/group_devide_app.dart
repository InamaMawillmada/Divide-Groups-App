import 'package:flutter/material.dart';

class GroupDevideApp extends StatefulWidget {
  const GroupDevideApp({Key? key}) : super(key: key);

  @override
  State<GroupDevideApp> createState() => _GroupDevideAppState();
}

class _GroupDevideAppState extends State<GroupDevideApp> {
  TextEditingController textFieldController = TextEditingController();
  List<String> memberNamesList = [];
  bool isSubmitBtnClicked = false;
  List<List<String>> dividedList = [];

  List<List<String>> divideListIntoGroups(
      List<String> originalList, int groupSize) {
    List<String> shuffledList = List.from(originalList)..shuffle();

    int totalSize = shuffledList.length;
    int numGroups = (totalSize / groupSize).ceil();
    for (int i = 0; i < numGroups; i++) {
      int start = i * groupSize;
      int end = (i + 1) * groupSize;
      end = end < totalSize ? end : totalSize;
      dividedList.add(shuffledList.sublist(start, end));
    }

    print(dividedList);

    for (List<String> group in dividedList) {
      for (String members in group) {
        print(members);
      }
      print('---');
    }

    return dividedList;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 100, 100, 100),
          title: const Text(
            'Devide into Groups ',
            textAlign: TextAlign.center,
          ),
        ),
        body: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 44, 44, 44)),
          child: Center(
            child: isSubmitBtnClicked
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      
                      Expanded(
                        child: ListView.builder(
                          itemCount: dividedList.length,
                          itemBuilder: (context, index) {
                            const SizedBox(height: 20,);
                            return Card(
                              color: Colors.grey,
                              child: Column(
                                children: [
                                  Text(
                                    'Group ${index + 1}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Column(
                                    children: dividedList[index].map((member) {
                                      return ListTile(
                                        title: Text(member),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Enter member names : ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      TextField(
                        controller: textFieldController,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 212, 212, 212),
                            fontSize: 20),
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: '',
                          hoverColor: Colors.white,
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            memberNamesList.add(textFieldController.text);
                            textFieldController.clear();
                            print(memberNamesList);
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
                          padding: EdgeInsets.all(10),
                          child: Text('Add Member'),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            divideListIntoGroups(memberNamesList, 5);
                            isSubmitBtnClicked = true;
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
                          padding: EdgeInsets.all(10),
                          child: Text('See Groups'),
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

