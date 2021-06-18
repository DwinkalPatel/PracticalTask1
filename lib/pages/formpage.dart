import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hive/hive.dart';
import 'package:practical_task_1/common_widgets.dart';
import 'package:practical_task_1/model/response_model.dart';
import 'package:intl/intl.dart';
import 'package:practical_task_1/pages/thankspage.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:uuid/uuid.dart';


class FormPage extends StatefulWidget {
  final ResponseModel model;

  const FormPage({Key key, this.model}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  var fields;
  var _select;
  var rate;
  var uuid = Uuid();

  var _formKey = GlobalKey<FormState>();
  final textkey = GlobalKey();
  TextEditingController _name = new TextEditingController();
  TextEditingController _secondname = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _date1 = new TextEditingController();
  TextEditingController _age = new TextEditingController();
  TextEditingController _secondemail = new TextEditingController();
  TextEditingController _phonecontroller = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  bool _submit(GlobalKey<FormState> formkey) {
    final isValid = _isValidateFields();
    formkey.currentState.save();
    if (isValid) {

      return true;
    } else {
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey ,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Survey"),
      ),
      body: SingleChildScrollView(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Container(
              padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: generateForm()),
              ),
          ),
          ),
        ),

    );
  }

  List<Widget> generateForm() {
    fields = widget.model.fields;
    var _selectedgender = '';
    List<Widget> list = new List<Widget>();

    for (int i = 0; i < fields.length; i++) {
      print('length::: ${i}');
      Widget sizebox = SizedBox(
        height: 10,
      );

      if (fields[i].type == 'short_text') {
        Widget text;
        if (fields[i].id == 'a7PPrsreuktH') {
          text = textfield(fields, i, TextInputType.text, _name);
        } else {
          text = textfield(fields, i, TextInputType.text, _secondname);
        }
        list.add(text);
        list.add(sizebox);
      }
      if (fields[i].type == 'dropdown') {
        List<String> _select1 = List<String>.empty(growable: true);
        print(fields[i].properties.choices.length);

        for(int j=0;j<fields[i].properties.choices.length;j++)
          {
             print(fields[i].properties.choices[j].label);
            _select1.add(fields[i].properties.choices[j].label);
          }
        Widget dropdown =  new DropdownButton<String>(
            hint: new Text(fields[i].title),
            value: _select,
            isExpanded: true,
            isDense: true,
            onChanged: (String newValue) {
              setState(() {
                _select = newValue;
              });
              print(_select);
            },
            items: _select1.map((String location) {
              return new DropdownMenuItem<String>(
                child: new Text(location),
                value: location,
              );
            }).toList());

            list.add(dropdown);
        list.add(sizebox);
      }
      if (fields[i].type == 'number') {
        Widget age = textfield(fields, i, TextInputType.number, _age);
        list.add(age);
        list.add(sizebox);
      }
      if (fields[i].type == 'email') {
        Widget email;
        if (fields[i].id == 'dTYFCBZNq3Ye') {
          email = textfield(fields, i, TextInputType.emailAddress, _email);
        } else {
          email =
              textfield(fields, i, TextInputType.emailAddress, _secondemail);
        }
        list.add(email);
        list.add(sizebox);
      }
      if (fields[i].type == 'phone_number') {
        Widget phone =
            textfield(fields, i, TextInputType.phone, _phonecontroller);
        list.add(phone);
        list.add(sizebox);
      }
      if (fields[i].type == 'rating') {
       Widget text= Center(child: Text(fields[i].title,style: mediumTextStyle(Colors.black, 14),));


    Widget rating = RatingBar.builder(
          initialRating: 0,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 7,
          itemPadding: EdgeInsets.symmetric(horizontal: 2.0,vertical: 5),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.green,
          ),
          onRatingUpdate: (rating) {
            print(rating);
            rate=rating;
          },
        );
        list.add(text);
        list.add(rating);
        list.add(sizebox);
      }
      if (fields[i].type == 'date') {
        Widget date1 = GestureDetector(
            onTap: () {
              _openDatePicker(_date1);
            },
            child: TextFormField(
              controller: _date1,
              validator: fields[i].validations.required == 'true'
                  ? (value) {
                      if (value.isEmpty || value == null) {}
                      return null;
                    }
                  : null,
              enabled: false,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.date_range,
                    color: Colors.black,
                  ),
                  hintText: fields[i].title,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey)),
                  focusColor: Colors.black,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey))),
            ));
        list.add(date1);
        list.add(sizebox);
      }

      if (fields[i].type == 'yes_no') {
        // Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
        Widget toggle = Column(children: [
          SizedBox(
            height: 10,
          ),
          Center(child: Text(fields[i].title,style: mediumTextStyle(Colors.black, 14))),
          SizedBox(
            height: 10,
          ),
          ToggleSwitch(
            minWidth: 400,
            activeBgColor: Colors.green,
            initialLabelIndex: 0,
            labels: ['Yes', 'No'],
            onToggle: (index) {
              print('switched to: $index');
            },
          )
        ]);
        list.add(toggle);
        list.add(sizebox);
      }
    }
    Widget submitbutton = RaisedButton(
      onPressed: () {
       bool issubmit= _submit(_formKey);
       if(issubmit)
         {

           var databox=Hive.box('mydatabox');
           databox.put('id',uuid.v4());
           databox.put('data',_name.text);
           Navigator.push(
               context, MaterialPageRoute(builder: (context) => ThanksPage(model: widget.model,)));
         }
       else{
            snackbar(_scaffoldKey, 'Please fill all required Fields');
       }

      },
      color: Colors.black,
      textColor: Colors.white,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Text('Submit'),
    );

    list.add(submitbutton);
    return list;
  }

  Future<void> _openDatePicker(TextEditingController date1) async {
    DateTime selectedDate = DateTime.now();

    final DateTime picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
        initialDate: selectedDate);

    var myFormat = DateFormat('MM-dd-yyyy');

    date1.text = myFormat.format(picked);
  }

  bool _isValidateFields() {
    if (_name.text.isEmpty ||
        _secondname.text.isEmpty ||
        _email.text.isEmpty ||
        _secondemail.text.isEmpty ||
        _age.text.isEmpty ||
        _select.isEmpty ||
        _date1.text.isEmpty ||
        rate==0) {
      return false;
    } else {
      return true;
    }
  }
}
