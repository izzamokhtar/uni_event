import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uni_event/service/database.dart';

class CreateEvent extends StatefulWidget {
  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController textController = TextEditingController();
  final TextEditingController textController2 = TextEditingController();
  final TextEditingController textController3 = TextEditingController();
  final TextEditingController textController4 = TextEditingController();

  String? docID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(' '),
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
            //TextFormField(
            /*controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Date of Event',
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  //onPressed: () => _selectDate(context),
                ),
              ),
              readOnly: true,
            ),*/
            SizedBox(height: 200),
            Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    firestoreService.addEvent(
                        textController.text,
                        textController2.text,
                        textController3.text,
                        textController4.text);
                    FocusScope.of(context).unfocus();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Saved!")));
                    //String Id = randomAlphaNumeric(10);
                    /*Map<String, dynamic> eventInfoMap = {
                      "Title": etitlecontroller.text,
                      "Description": eventdesc.text,
                      "Id": Id,
                    };
                    await DatabaseMethods()
                        .addEventDetails(eventInfoMap, Id)
                        .then(
                      (value) {
                        Fluttertoast.showToast(
                            msg: "Event Uploaded",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                    );*/
                    //_showLogoutConfirmationDialog(context);
                  },
                  child: Text(
                    'Create',
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
