import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final noteController = TextEditingController(text: "");
  final titleController = TextEditingController(text: "");

  List<Note> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("OCR App"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    hintText: "Enter Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )),
              ),
            ),

            ///TextField
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: noteController,
                maxLines: 10,
                decoration: const InputDecoration(
                    hintText: "Enter Note",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            ///Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      notes.forEach((e){print(e.title);});
                    },
                    child: Image.asset(
                      "assets/camera.png",
                      height: 35,
                    )),
                const SizedBox(
                  width: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      Note tempNote = Note(
                          title: titleController.text,
                          body: noteController.text,
                          dateTime: DateTime.now());


                      setState(() {
                        notes.add(tempNote);
                      });

                      titleController.clear();
                      noteController.clear();
                      print(notes);

                      print("Length is :${notes.length}");
                      // notes.forEach((e){
                      //   print(e.title);
                      //   print(e.body);
                      //   print(e.dateTime);
                      // });

                      // List<String> noteList = ["1","2","3"];
                      // List<String> n1 = ["a","b","c"];
                      // // List<String> n2 = ["d","e","f"];
                      //
                      //
                      // // noteList.addAll(n2);
                      //
                      // print(noteList);
                    },
                    child: Text(
                      "Save",
                      style: GoogleFonts.poppins(fontSize: 16),
                    ))
              ],
            ),

            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.note),
                    trailing: Text(
                     notes[index].dateTime.toIso8601String(),
                      style: GoogleFonts.lato(fontSize: 10, color: Colors.grey),
                    ),
                    title: Text(notes[index].title),
                    subtitle: Text(notes[index].body),
                  );
                },
              ),
            )
          ],
        ));
  }
}

class Note {
  final String title;
  final String body;
  final DateTime dateTime;

  const Note({
    required this.title,
    required this.body,
    required this.dateTime,
  });
}
