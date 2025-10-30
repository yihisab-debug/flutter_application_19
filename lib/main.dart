import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Мои заметки',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: NoteListPage(),
    );
  }
}

class NoteListPage extends StatefulWidget {
  @override
  _NoteListPageState createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  List<String> _notes1 = [];
  TextEditingController _noteController1 = TextEditingController();
  List<String> _notes2 = [];
  TextEditingController _noteController2 = TextEditingController();
  List<String> _notes3 = [];
  TextEditingController _noteController3 = TextEditingController();
  List<String> _notes4 = [];
  TextEditingController _noteController4 = TextEditingController();
  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _notes1 = prefs.getStringList('notes') ?? [];
      _notes2 = prefs.getStringList('notes') ?? [];
      _notes3 = prefs.getStringList('notes') ?? [];
      _notes4 = prefs.getStringList('notes') ?? [];
    });
  }

  Future<void> _saveNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('notes', _notes1);
    await prefs.setStringList('notes2', _notes2);
    await prefs.setStringList('notes3', _notes3);
    await prefs.setStringList('notes4', _notes4);
  }

  void _addNote() {
    String text = _noteController1.text.trim();
    String text2 = _noteController2.text.trim();
    String text3 = _noteController3.text.trim();
    String text4 = _noteController4.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _notes1.add(text);
        _notes2.add(text2);
        _notes3.add(text3);
        _notes4.add(text4);
        _noteController1.clear();
        _noteController2.clear();
        _noteController3.clear();
        _noteController4.clear();
      });
      _saveNotes();
    }
  }



void _deleteNote(int index) {
  setState(() {
    _notes1.removeAt(index);
    _notes2.removeAt(index);
    _notes3.removeAt(index);
    _notes4.removeAt(index);
  });
  _saveNotes();
}



Widget _buildTextField(TextEditingController controller, String label) {
  return Container(
    width: 220,
    child: TextField(
       controller: controller,
       decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
         isDense: true,
         contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      ),
    ),
  );
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: 


        Center(
          child: Row(
          children: [
            Center(
              child: 
              Column( 
                children: [

          Container(
            width:  1000,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                ),
              ],
            ),

            child: Column(
            children: [

              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        'Заметки',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTextField(_noteController1, 'Имя'),
                      SizedBox(width: 10),
                      _buildTextField(_noteController2, 'Возраст'),
                      SizedBox(width: 10),
                      _buildTextField(_noteController3, 'Город'),
                      SizedBox(width: 10),
                      _buildTextField(_noteController4, 'Должность'),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.only(bottom: 16, top: 16, left: 16, right: 16),
                child: ElevatedButton(
                onPressed: _addNote,
                  child: Text('Add'),
                ),
              ),

              SizedBox(height: 10),

Expanded(
  child: _notes1.isEmpty
      ? Center(child: Text('Заметок пока нет'))
      : ListView.builder(
          itemCount: _notes1.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      width: 200,
                      height: 37,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        _notes1[index],
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),

              SizedBox(width: 10),

                    Container(
                      width: 200,
                      height: 37,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        _notes2[index],
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),

              SizedBox(width: 10),

                    Container(
                      width: 200,
                      height: 37,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        _notes3[index],
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),

              SizedBox(width: 10),

                    Container(
                      width: 200,
                      height: 37,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        _notes4[index],
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),

              SizedBox(width: 20),

                    Container(
                      padding: EdgeInsets.all(7),
                      child: ElevatedButton.icon(
                        onPressed: () => _deleteNote(index),
                        icon: Icon(Icons.delete, color: Colors.white, size: 20),
                        label: Text(
                          'Удалить',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          elevation: 3,
                      ),
                     ),
                  ),
                  ],
            ),
              ),
          );
          },
       ),
),




          ],
        ),
      ),

],
),
),        

],
),
),
),
);
}
}