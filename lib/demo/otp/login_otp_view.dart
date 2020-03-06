import 'package:flutter/material.dart';
import 'package:flutter_easy/core/config.dart';
import 'package:flutter_easy/demo/otp/otp_input_formatter.dart';
import 'package:flutter_easy/pages/block/block_shadow.dart';
import 'package:flutter_easy/ui/utility/progress_dialog.dart';

class LoginOTPView extends StatefulWidget {
  @override
  _LoginOTPViewState createState() => _LoginOTPViewState();
}

class _LoginOTPViewState extends State<LoginOTPView> {
  @override
  void initState() {
    super.initState();
    timeStart = DateTime.now();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset < -50) {
        FocusScope.of(context).requestFocus(FocusNode());
      }
    });

    registerStream();
  }

  DateTime timeStart;
  final String phoneNumber = '+84456849333';
  Stream<int> stream;
  int countDown;
  TextEditingController controllerOTP = TextEditingController();
  String _errorText = '';

  String get errorText => _errorText;

  set errorText(String errorText) {
    setState(() {
      _errorText = errorText;
      controllerOTP.text = '';
    });
  }

  void registerStream() {
    countDown = 60 - (DateTime.now().difference(timeStart).inSeconds);
    stream = Stream<int>.periodic(const Duration(seconds: 1), transform);
    stream = stream.takeWhile((value) {
      return countDown > 0;
    });
    listenStream();
  }

  Future listenStream() async {
    await for (final int i in stream) {
      setState(() {
        countDown = i;
      });
    }
  }

  int transform(int value) {
    final int second = DateTime.now().difference(timeStart).inSeconds;
    return 60 - second;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    stream.takeWhile((value) {
      return true;
    });
    super.dispose();
  }

  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nhập mã OTP'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: 30,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 350,
                child: Image.asset('assets/images/ui/pattern.png'),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(defaultPadding),
            child: ListView(
              controller: _scrollController,
              children: <Widget>[
                const SizedBox(height: 120),
                BlockShadow(
                  color: Colors.orange,
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
                  child: Column(
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                              children: [
                                const TextSpan(text: 'Mã OTP đã được gửi đến '),
                                TextSpan(text: phoneNumber),
                              ],
                            ),
                          )),
                      const SizedBox(height: 10),
                      Center(
                        child: SizedBox(
                          width: 200,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:
                                    List.generate(maxOtp, (index) => index)
                                        .map((index) {
                                  return Container(
                                    width: 30,
                                    height: 35,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Colors.white.withAlpha(80),
                                          width: 1,
                                          style: BorderStyle.solid,
                                        )),
                                  );
                                }).toList(),
                              ),
                              TextField(
                                onTap: () {
                                  _scrollController.animateTo(100,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.linear);
                                },
                                controller: controllerOTP,
                                style: otpStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                                showCursor: false,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: '____',
                                  hintStyle: otpStyle(
                                      color: Colors.white.withAlpha(125)),
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                                inputFormatters: [OTPInputFormatter(maxOtp)],
                                onChanged: (value) {
                                  if (checkLength()) {
                                    _validateInput();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.center,
                    child: countDown > 0
                        ? RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.body1,
                              children: [
                                const TextSpan(text: 'Gửi lại mã sau: '),
                                TextSpan(
                                    text: '(00:${timeToString(countDown)})',
                                    style: Theme.of(context).textTheme.body2),
                              ],
                            ),
                          )
                        : null),
                AnimatedCrossFade(
                  firstChild: const SizedBox(height: 70),
                  secondChild: Container(
                    height: 70,
                    alignment: Alignment.center,
                    child: Text(
                      errorText,
                      style: const TextStyle(color: Colors.red),
                      maxLines: 3,
                    ),
                  ),
                  duration: const Duration(milliseconds: 200),
                  crossFadeState: errorText.isEmpty
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
                Center(
                  child: SizedBox(
                    width: 170,
                    child: RaisedButton(
                      child: const Text(
                        'Gủi lại mã',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: countDown <= 0 ? _onResentOTP : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextStyle otpStyle({Color color}) => TextStyle(
      fontWeight: FontWeight.w600,
      letterSpacing: 25,
      fontSize: 16,
      color: color);
  final int maxOtp = 4;

  bool checkLength() {
    final String text = controllerOTP.text.replaceAll('_', '');
    return text.length == maxOtp;
  }

  Future _validateInput() async {
    showLoading(context, message: 'Xác nhận OTP...');
    await Future.delayed(const Duration(seconds: 1));
    hideLoading(context);
    errorText = 'OTP is incorrect. Please try again';
  }

  Future _onResentOTP() async {}

  String timeToString(int second) {
    if (second < 10) {
      return '0$second';
    } else {
      return '$second';
    }
  }
}
