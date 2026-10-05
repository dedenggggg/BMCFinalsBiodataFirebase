import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController nationalityController =
      TextEditingController();
  final TextEditingController civilStatusController =
      TextEditingController();
  final TextEditingController religionController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController hobbiesController = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveData() async {
    if (nameController.text.trim().isEmpty ||
        ageController.text.trim().isEmpty ||
        genderController.text.trim().isEmpty ||
        birthdayController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty ||
        nationalityController.text.trim().isEmpty ||
        civilStatusController.text.trim().isEmpty ||
        religionController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty ||
        hobbiesController.text.trim().isEmpty) {
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
        ),
      );

      return;
    }

    await firestore.collection('biodata').add({
      'name': nameController.text.trim(),
      'age': ageController.text.trim(),
      'gender': genderController.text.trim(),
      'birthday': birthdayController.text.trim(),
      'address': addressController.text.trim(),
      'nationality': nationalityController.text.trim(),
      'civilStatus': civilStatusController.text.trim(),
      'religion': religionController.text.trim(),
      'email': emailController.text.trim(),
      'phone': phoneController.text.trim(),
      'hobbies': hobbiesController.text.trim(),
      'createdAt': FieldValue.serverTimestamp(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Biodata saved successfully'),
      ),
    );

    nameController.clear();
    ageController.clear();
    genderController.clear();
    birthdayController.clear();
    addressController.clear();
    nationalityController.clear();
    civilStatusController.clear();
    religionController.clear();
    emailController.clear();
    phoneController.clear();
    hobbiesController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    genderController.dispose();
    birthdayController.dispose();
    addressController.dispose();
    nationalityController.dispose();
    civilStatusController.dispose();
    religionController.dispose();
    emailController.dispose();
    phoneController.dispose();
    hobbiesController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biodata Form'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            const Text(
              'Personal Biodata',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: genderController,
              decoration: const InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: birthdayController,
              decoration: const InputDecoration(
                labelText: 'Birthday',
                hintText: 'MM/DD/YYYY',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: nationalityController,
              decoration: const InputDecoration(
                labelText: 'Nationality',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: civilStatusController,
              decoration: const InputDecoration(
                labelText: 'Civil Status',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: religionController,
              decoration: const InputDecoration(
                labelText: 'Religion',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: hobbiesController,
              decoration: const InputDecoration(
                labelText: 'Hobbies',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveData,
                child: const Text('Save to Firebase'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}