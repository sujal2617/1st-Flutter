import 'package:flutter/material.dart';

void main() {
  runApp(const FormHandlingData());
}

class FormHandlingData extends StatefulWidget {
  const FormHandlingData({super.key});

  @override
  State<FormHandlingData> createState() => _FormHandlingDataState();
}

class _FormHandlingDataState extends State<FormHandlingData> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormTrial(),
    );
  }
}

class FormTrial extends StatefulWidget {
  const FormTrial({super.key});

  @override
  State<FormTrial> createState() => _FormTrialState();
}

class _FormTrialState extends State<FormTrial> {
  final List<Map<String, String>> _details = [];
  final TextEditingController _nc = TextEditingController();
  final TextEditingController _fc = TextEditingController();
  final List<String> _branches = [
    "Computer Science",
    "Electrical Engineering",
    "Mechanical Engineering",
    "Civil Engineering"
  ];
  final List<String> _departments = [
    "Department A",
    "Department B",
    "Department C"
  ];
  String? _selectedBranch;
  String? _selectedDepartment;
  String? _selectedYear;
  int _selectedAge = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Google Forms",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          formlet(),
          Expanded(child: _listDisplay()),
        ],
      ),
    );
  }

  Widget formlet() {
    return Column(
        children: [
    Padding(
    padding: const EdgeInsets.all(10.0),
    child: TextField(
    controller: _nc,
    decoration: InputDecoration(
    labelText: "Name",
    hintText: "Enter Your Name",
    hintStyle: const TextStyle(fontWeight: FontWeight.bold),
    border: OutlineInputBorder(
    borderSide: const BorderSide(
    width: 2.0,
    color: Colors.black,
    ),
    borderRadius: BorderRadius.circular(45),
    ),
    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(10.0),
    child: DropdownButtonFormField<String>(
    value: _selectedBranch,
    decoration: InputDecoration(
    labelText: "Branch",
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(45),
    borderSide: const BorderSide(
    width: 2.0,
    color: Colors.black,
    ),
    ),
    ),
    items: _branches.map((String branch) {
    return DropdownMenuItem<String>(
    value: branch,
    child: Text(branch),
    );
    }).toList(),
    onChanged: (String? newValue) {
    setState(() {
    _selectedBranch = newValue;
    });
    },
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(10.0),
    child: DropdownButtonFormField<String>(
    value: _selectedDepartment,
    decoration: InputDecoration(
    labelText: "Department",
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(45),
    borderSide: const BorderSide(
    width: 2.0,
    color: Colors.black,
    ),
    ),
    ),
    items: _departments.map((String department) {
    return DropdownMenuItem<String>(
    value: department,
    child: Text(department),
    );
    }).toList(),
    onChanged: (String? newValue) {
    setState(() {
    _selectedDepartment = newValue;
    });
    },
    ),
    ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButtonFormField<int>(
              value: _selectedAge,
              decoration: InputDecoration(
                labelText: "Age",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                  borderSide: const BorderSide(
                    width: 2.0,
                    color: Colors.black,
                  ),
                ),
              ),
              items: List.generate(100, (index) => index + 1).map((int age) {
                return DropdownMenuItem<int>(
                  value: age,
                  child: Text(age.toString()),
                );
              }).toList(),
              onChanged: (int? newValue) {
                setState(() {
                  _selectedAge = newValue ?? 18;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButtonFormField<String>(
              value: _selectedYear,
              decoration: InputDecoration(
                labelText: "Year",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                  borderSide: const BorderSide(
                    width: 2.0,
                    color: Colors.black,
                  ),
                ),
              ),
              items: ["First Year", "Second Year", "Third Year", "Fourth Year"].map((String year) {
                return DropdownMenuItem<String>(
                  value: year,
                  child: Text(year),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedYear = newValue;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _fc,
              decoration: InputDecoration(
                labelText: "Full UserName",
                hintText: "Enter Your UserName",
                hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2.0,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
            ),
          ),
          ElevatedButton(onPressed: submit, child: const Text("Post")),
        ],
    );
  }

  Widget _listDisplay() {
    return ListView.builder(
      itemCount: _details.length,
      itemBuilder: (context, index) {
        final item = _details[index];
        return Card(
          child: ListTile(
            leading: const Icon(Icons.supervised_user_circle),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${item['Name']}'),
                Text('Age: ${item['Age']}'),
                Text('Branch: ${item['Branch']}'),
                Text('Department: ${item['Department']}'),
                Text('Year: ${item['Year']}'),
              ],
            ),
            trailing: Text('Full UserName: ${item['Full UserName']}'),
          ),
        );
      },
    );
  }

  void submit() {
    setState(() {
      _details.add({
        "Name": _nc.text,
        "Age": _selectedAge.toString(),
        "Branch": _selectedBranch ?? "",
        "Department": _selectedDepartment ?? "",
        "Year": _selectedYear ?? "",
        "Full UserName": _fc.text,
      });
    });

    // Clear the text fields and reset selections after submission
    _nc.clear();
    _selectedBranch = null;
    _selectedDepartment = null;
    _selectedAge = 18;
    _selectedYear = null;
    _fc.clear();
  }
}