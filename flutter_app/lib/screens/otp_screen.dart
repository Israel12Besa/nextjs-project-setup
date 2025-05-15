import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final int _otpLength = 6;
  List<String> _otpValues = [];

  void _onKeyPressed(String value) {
    setState(() {
      if (value == 'DEL') {
        if (_otpValues.isNotEmpty) {
          _otpValues.removeLast();
        }
      } else {
        if (_otpValues.length < _otpLength) {
          _otpValues.add(value);
        }
      }
    });
  }

  void _submitOtp() {
    if (_otpValues.length == _otpLength) {
      // Handle OTP verification logic here
      Navigator.pushReplacementNamed(context, '/dashboard');
    }
  }

  Widget _buildOtpDisplay() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_otpLength, (index) {
        return Container(
          width: 40,
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.blue,
                width: 2,
              ),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            index < _otpValues.length ? _otpValues[index] : '',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        );
      }),
    );
  }

  Widget _buildKey(String label) {
    return GestureDetector(
      onTap: () {
        _onKeyPressed(label);
      },
      child: Container(
        width: 70,
        height: 70,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(35),
        ),
        alignment: Alignment.center,
        child: label == 'DEL'
            ? Icon(Icons.backspace, color: Colors.white)
            : Text(
                label,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text('Enter OTP'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Enter the 6-digit code sent to your email',
            style: TextStyle(color: Colors.grey[400], fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          _buildOtpDisplay(),
          SizedBox(height: 40),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              for (var i = 1; i <= 9; i++) _buildKey(i.toString()),
              _buildKey('DEL'),
              _buildKey('0'),
              GestureDetector(
                onTap: _submitOtp,
                child: Container(
                  width: 70,
                  height: 70,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.check, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
