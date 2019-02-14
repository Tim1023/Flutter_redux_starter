import 'package:flutter/material.dart';
import 'package:onigiri_app/common/components/inputFields.dart';

class DiscoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              '验证码登录',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          Text(
            '您输入的号码是279123599',
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
          Form(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InputFieldArea(
                  hint: "请输入验证码",
                  obscure: false,
                  icon: Icons.mobile_screen_share,
                ),
              ),
              RaisedButton(
                  onPressed: () => print('pressed!'), child: Text('获取验证码')),
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: RaisedButton(
                  onPressed: () => print('pressed!'), child: Text('登录')),
            ),
          ),
          SimpleDialog(
            title: Text('身份验证'),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SimpleDialogOption(
                  onPressed: () => print('pressed!'),
                  child: Stack(children: [
                    Image.network(
                      'https://via.placeholder.com/200x50',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100.0, top: 10.0),
                      child: Text(
                        '🕺',
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Slider(
                        value: 10,
                        min: 0,
                        max: 100,
                        onChanged: (v) {
                          print(v);
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 28.0, top: 8.0, right: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '💃',
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
