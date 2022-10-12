import 'package:intl/intl.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

final childnames = TextEditingController();
final frequencyofrides = TextEditingController();
final dateinput = TextEditingController();
final pickuptime = TextEditingController();
final pickuplocation = TextEditingController();
final dropofflocation = TextEditingController();

class UserRides extends StatelessWidget {
  const UserRides({
    super.key,
    required this.email,
  });

  final String? email;

  Future addData() async {
    final ref = FirebaseDatabase.instance.ref();
    var childemail = email!.replaceAll('.', '');
    ref.child(childemail).update({
      'childnames': childnames.text,
      'frequencyofrides': frequencyofrides.text,
      'pickupdate': dateinput.text,
      'pickuptime': pickuptime.text,
      'pickuplocation': pickuplocation.text,
      'dropofflocation': dropofflocation.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Book Rides',
          style: TextStyle(fontFamily: 'Roboto'),
        ),
      ),
      body: ListView(children: [
        const Text(
          'Fill in this form',
          style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto'),
        ),
        const SizedBox(
          height: 30,
        ),
        Form(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            //frequency of ride
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TextFormField(
                controller: childnames,
                decoration: const InputDecoration(
                    labelText: 'Full Child Names',
                    hintText: 'enter full child names',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder()),
                onChanged: (String value) {},
                validator: (value) {
                  return value!.isEmpty ? 'please enter child names' : null;
                },
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            //frequency of rides
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TextFormField(
                controller: frequencyofrides,
                decoration: const InputDecoration(
                    labelText: 'Frequency of ride',
                    hintText: 'is it monthly / one day ride?',
                    prefixIcon: Icon(Icons.car_rental),
                    border: OutlineInputBorder()),
                onChanged: (String value) {},
                validator: (value) {
                  return value!.isEmpty
                      ? 'please enter frequency of ride'
                      : null;
                },
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //checkbox field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            //pickup date
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Pick up date',
                      labelText: 'Pickup up Date',
                      prefixIcon: Icon(Icons.calendar_month_rounded),
                      border: OutlineInputBorder()),
                  controller: dateinput,
                  readOnly: true,
                  onTap: () async {
                    var pickedDate = await DatePicker.showSimpleDatePicker(
                      context,
                      initialDate: DateTime(2002),
                      firstDate: DateTime(2004),
                      lastDate: DateTime(2100),
                      dateFormat: "dd-MMMM-yyyy",
                      locale: DateTimePickerLocale.en_us,
                      looping: true,
                    );
                    if (pickedDate != null) {
                      dateinput.text =
                          DateFormat('dd MMMM yyyy').format(pickedDate);
                    }
                  },
                )),
          ),

          const SizedBox(
            height: 30,
          ),
          //checkbox field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            //pickup location
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: TextFormField(
                controller: pickuptime,
                decoration: const InputDecoration(
                    labelText: 'Pickup up time',
                    hintText: '7:00AM/PM',
                    prefixIcon: Icon(Icons.calendar_today_rounded),
                    border: OutlineInputBorder()),
                onChanged: (String value) {},
                validator: (value) {
                  return value!.isEmpty ? 'please enter pickup time' : null;
                },
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            //pickup location
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: TextFormField(
                controller: pickuplocation,
                decoration: const InputDecoration(
                    labelText: 'Pickup up Location',
                    hintText: ' Ukweli Estate, BuruBuru Phase 1',
                    prefixIcon: Icon(Icons.location_city_rounded),
                    border: OutlineInputBorder()),
                onChanged: (String value) {},
                validator: (value) {
                  return value!.isEmpty ? 'please enter pickup location' : null;
                },
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            //Drop off location
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: TextFormField(
                controller: dropofflocation,
                decoration: const InputDecoration(
                    labelText: 'Drop off location (school)',
                    hintText: 'BuruBuru 1 primary',
                    prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder()),
                onChanged: (String value) {},
                validator: (value) {
                  return value!.isEmpty
                      ? 'please enter drop off location'
                      : null;
                },
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            // submit button
            child: MaterialButton(
              minWidth: double.infinity,
              onPressed: addData,
              child: const Text('Submit'),
              color: Colors.yellow,
              textColor: Colors.black,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ])),
      ]),
    );
  }
}
