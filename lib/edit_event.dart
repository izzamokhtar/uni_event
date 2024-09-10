import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uni_event/service/database.dart';

class EditEvent extends StatefulWidget {
  final String docID; // Add docID parameter

  EditEvent({required this.docID});
  @override
  _EditEventState createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController textController = TextEditingController();
  final TextEditingController textController2 = TextEditingController();
  final TextEditingController textController3 = TextEditingController();
  final TextEditingController textController4 = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchEventData();
  }

  Future<void> fetchEventData() async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('test')
        .doc(widget.docID)
        .get();
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    textController.text = data['eventName'];
    textController2.text = data['eventDesc'];
    textController3.text = data['category'];
    textController4.text = data['type'];
  }

  String? docID;
  /*TextEditingController _dateController = TextEditingController();
  DateTime _selectedDate =
      DateTime.now(); // Initialize _selectedDate with current date

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate);
      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Edit Event'),
        backgroundColor: Color.fromARGB(255, 223, 123, 156),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Event Title",
              //style: CustomTextStyle.getTitleStyle(
              //context, 18, CustomColor.getBlackColor(context)),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Description",
              //style: CustomTextStyle.getTitleStyle(
              //context, 18, CustomColor.getBlackColor(context)),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: textController2,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Category",
              //style: CustomTextStyle.getTitleStyle(
              //context, 18, CustomColor.getBlackColor(context)),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: textController3,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Type",
              //style: CustomTextStyle.getTitleStyle(
              //context, 18, CustomColor.getBlackColor(context)),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: textController4,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            // Text(
            //   "Date",
            //   //style: CustomTextStyle.getTitleStyle(
            //   //context, 18, CustomColor.getBlackColor(context)),
            // ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(height: 150),
            Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    firestoreService.updateEvent(
                      widget.docID,
                      textController.text,
                      textController2.text,
                      textController3.text,
                      textController4.text,
                    );
                    FocusScope.of(context).unfocus();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Saved!")));
                  },
                  child: Text(
                    'Update',
                    //style: CustomTextStyle.getTitleStyle(
                    //context, 12, CustomColor.getWhiteColor(context)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: Size(50, 50), // Button width and height
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
