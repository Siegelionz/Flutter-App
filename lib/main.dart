import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
  return MaterialApp(
    theme: new ThemeData(
      primaryColor: Colors.white,
    ),
    home: SignPage());
  }
}

class SignPage extends StatefulWidget {
  @override
  createState() => new SignPageState();
}

class SignPageState extends State<SignPage> {
  bool nextBtn = false;
  bool isPhoneVal = true;
  var titleName = '手机号码';
  var btnName = '确定';
  TextEditingController _phoneInput = TextEditingController();
  PinDecoration _pinDecoration = BoxLooseDecoration(
    textStyle: TextStyle(
      color: Colors.black,
      fontSize: 24,
    ),
    solidColor: Color(0x335C78CC),
    strokeColor: Color(0x335C78CC),
  );
  @override
  Widget build(BuildContext context) {
    // 头部内容
    Widget headerText = Container(
      margin: EdgeInsets.only(top: 30.0, bottom: 90.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'COIN',
            style: TextStyle(
              fontSize: 36.0,
              fontFamily: 'DIN Alternate Bold',
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'CARE',
            style: TextStyle(
              fontSize: 36.0,
              fontFamily: 'DIN Alternate Bold',
              color: Color(0xFF5C78CC),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
    // 中间内容
    Widget centerText = Container(
      padding: EdgeInsets.only(left: 24.0, right: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$titleName',
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: '苹方-简 常规体',
              color: Color(0xFF323745),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: TextField(
              keyboardType: TextInputType.phone,
              controller: _phoneInput,
              onChanged: (val) {
              },
              decoration: InputDecoration(
                prefixText: '+86',
                hintText: '请输入手机号',
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Color(0x80323745),
                  ),
                  onPressed: () {
                    setState(() {
                      _phoneInput.text = '';
                    });
                  },
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x1A323745),
                    width: 1, 
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x1A323745),
                    width: 1,
                  ),
                )
              )
            )
            // PinInputTextField(
            //   decoration: _pinDecoration
            // ),
            ),
        ],
      ),
    );
    // 底部内容
    Widget bottomText = Offstage(
      offstage: nextBtn,
      child: Container(
        margin: EdgeInsets.only(top: 121.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              child: new Text(
                '$btnName',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: '苹方-简 中黑体',
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.0))
              ),
              onPressed: () {

              },
              padding: EdgeInsets.only(
                  top: 10.0, right: 51.0, bottom: 10.0, left: 51.0),
              color: Color(0xFF5C78CC),
              textColor: Colors.white,
              disabledColor: Color(0xFFB8B8C5),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '我已阅读并同意',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Coincare用户协议',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color(0xFF5C78CC),
                        // decoration: TextDecoration.underline,
                        // decorationStyle: TextDecorationStyle.solid,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('@@@@');
                        },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(''),
          backgroundColor: Colors.white,
        ),
        body: new ListView(
          children: <Widget>[
            headerText,
            centerText,
            bottomText,
          ],
        ));
  }
}
