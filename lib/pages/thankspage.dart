import 'package:flutter/material.dart';
import 'package:practical_task_1/common_widgets.dart';
import 'package:practical_task_1/model/response_model.dart';

import 'homepage.dart';

class ThanksPage extends StatefulWidget {
 final ResponseModel model;

  const ThanksPage({Key key, this.model}) : super(key: key);

  @override
  _ThanksPageState createState() => _ThanksPageState();
}

class _ThanksPageState extends State<ThanksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),

           Text(widget.model.thankyouScreens.title,style: mediumTextStyle(Colors.black, 18),textAlign: TextAlign.center,),
            SizedBox(height: 50,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => HomePage()));

                  },
                  color: Colors.black,
                  textColor: Colors.white,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text('again'),
                ),

                Icon(Icons.share,color: Colors.black,),

              ],

            ),
            SizedBox(height: 20,),

          ],

        ),
      ),
    );
  }
}
