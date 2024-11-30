import 'package:flutter/material.dart';
import 'package:tomcoffeshop/models/user_model.dart';
import 'package:tomcoffeshop/widgets/base_scaffold.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  EditAccountScreenState createState() => EditAccountScreenState();
}

class EditAccountScreenState extends State<EditAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  late UserModel _user;

  @override
  void initState() {
    super.initState();
    _user = UserModel(
      id: '1', // Add the required id parameter
      name: 'Temesgen',
      address: 'addis ababa',
      email: 'tom@gmail.com',
      phoneNumber: '+25123456789',
      profileImageUrl: 'lib/images/profile.jpg', 
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title:'Account Info',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(_user.profileImageUrl),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                initialValue: _user.name,
                onSaved: (value) {
                  _user.name = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Address'),
                initialValue: _user.address,
                onSaved: (value) {
                  _user.address = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                initialValue: _user.email,
                onSaved: (value) {
                  _user.email = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone'),
                initialValue: _user.phoneNumber,
                onSaved: (value) {
                  _user.phoneNumber = value!;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Save the updated details
                    setState(() {});
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Account info saved')),
                    );
                    // Navigate to home page
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}