import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const formhandlling(),
  ));
}

class formhandlling extends StatefulWidget {
  const formhandlling({super.key});

  @override
  State<formhandlling> createState() => _formhandlingdatastate();
}

class _formhandlingdatastate extends State<formhandlling> {
  // Create Empty List
  final List<Map<String, String>> _items = [];
  final TextEditingController _nameControler = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _ageControler = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _spec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "REGISTRATION PAGE",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // form
            formData(),
            Expanded(child: _listDisplay()),
            // listview
          ],
        ),
      ),
    );
  }

  Widget formData() {
    return Column(
      children: [
        TextField(
          controller: _nameControler,
          decoration: InputDecoration(hintText: "Enter Name"),
        ),
        SizedBox(height: 25),
        TextField(
          controller: _idController,
          decoration: InputDecoration(hintText: "Enter ID"),
        ),
        SizedBox(height: 25),
        TextField(
          controller: _ageControler,
          decoration: InputDecoration(hintText: "Enter Age"),
        ),
        SizedBox(height: 25),
        TextField(
          controller: _departmentController,
          decoration: InputDecoration(hintText: "Enter Department"),
        ),
        SizedBox(height: 25),
        TextField(
          controller: _spec,
          decoration: InputDecoration(hintText: "Enter Specialization"),
        ),
        SizedBox(height: 25),
        ElevatedButton(
          onPressed: postData,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // Change this to the desired background color
          ),
          child: Text("Post"),
        ),
      ],
    );
  }

  void postData() {
    final String name = _nameControler.text;
    final String age = _ageControler.text;
    final String id = _idController.text;
    final String spe = _spec.text;
    final String department = _departmentController.text;
    if (name.isNotEmpty && age.isNotEmpty) {
      setState(() {
        _items.add({
          'name': name,
          'age': age,
          'id': id,
          'department': department,
          'spec': spe
        });
      });
    }
    _nameControler.clear();
    _ageControler.clear();
    _idController.clear();
    _departmentController.clear();
    _spec.clear();
  }

  Widget _listDisplay() {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];
        return Card(
          child: ListTile(
            leading: const Icon(Icons.supervised_user_circle),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('NAME: ${item['name']}'),
                Text('ID: ${item['id']}'),
                Text('AGE: ${item['age']}'),
                Text('SPECIALIZATION: ${item['spec']}'),
              ],
            ),
            trailing: Text('${item['department']}'),
          ),
        );
      },
    );
  }
}
