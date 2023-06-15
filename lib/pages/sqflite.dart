import 'package:flutter/material.dart';
import 'package:tubesgabungan/pages/openstreet.dart';
import 'sql_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'afterlogin.dart';
import 'openstreet.dart';

void main() {
  runApp(const list_cabang());
  
}

class list_cabang extends StatelessWidget {
  const list_cabang({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'listcabang',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: _list_cabang(),
    );
  }
}

class _list_cabang extends StatefulWidget {
  const _list_cabang({Key? key}) : super(key: key);

  @override
  State<_list_cabang> createState() => _list_cabang_State();
}

class _list_cabang_State extends State<_list_cabang> {

  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;
  // This function is used to fetch all data from the database
  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  void initState() {
    super.initState();
    _refreshJournals(); // Loading the diary when the app starts
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
      _journals.firstWhere((element) => element['id'] == id);
      _titleController.text = existingJournal['title'];
      _descriptionController.text = existingJournal['description'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) =>
            Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom + 120,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(hintText: 'Title'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(hintText: 'Description'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Save new journal
                      if (id == null) {
                        await _addItem();
                      }

                      if (id != null) {
                        await _updateItem(id);
                      }

                      // Clear the text fields
                      _titleController.text = '';
                      _descriptionController.text = '';

                      // Close the bottom sheet
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'Create New' : 'Update'),
                  )
                ],
              ),
            ));
  }

    // Insert a new journal to the database
    Future<void> _addItem() async {
      await SQLHelper.createItem(
          _titleController.text, _descriptionController.text);
      _refreshJournals();
    }

    // Update an existing journal
    Future<void> _updateItem(int id) async {
      await SQLHelper.updateItem(
          id, _titleController.text, _descriptionController.text);
      _refreshJournals();
    }

    // Delete an item
    void _deleteItem(int id) async {
      await SQLHelper.deleteItem(id);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Successfully deleted a journal!'),
      ));
      _refreshJournals();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Cabang'),
        leading: IconButton(
               onPressed: (){
                 Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => afterlogin(),
                ),
              );
               },
               icon:Icon(Icons.arrow_back_ios), 
               //replace with our own icon data.
            )
      ),
      body: _isLoading
          ? const Center( //true
        child: CircularProgressIndicator(),
      )
          : ListView.builder( //false
        itemCount: _journals.length,
        itemBuilder: (context, index) => Card(
          color: Colors.blue[200],
          margin: const EdgeInsets.all(15),
          child: ListTile(
              title: Text(_journals[index]['title']),
              subtitle: Text(_journals[index]['description']),
              trailing: SizedBox(
                width: 150,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _showForm(_journals[index]['id']),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () =>
                          _deleteItem(_journals[index]['id']),
                    ),
                    IconButton(
                      icon: const Icon(Icons.map_sharp),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OpenStreet(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),    
    );
  }
}
