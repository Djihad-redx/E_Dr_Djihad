import 'package:e_comerce/Models/Profile.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Utlitis/API_Dr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UpdateProfile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static Profile result = null;
  bool isloading= false;
  @override
  void initState() {

    if(result==null){
      setState(() {
        isloading =true;
      });
      Api.ShowProfile().then((value) {
        result = value;
        setState(() {
          isloading = false;
        });
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isloading == true?Loading():Stack(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .19,
          color: Colors.blue,
        ),
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey.shade100),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 40, 0, 10),
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.shade100,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/dr.png'))),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(top: 17, left: 10),
                                  child: Text(
                                    result.data.name,
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          "Mobile:",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Text(
                                        result.data.mobile,
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          "Email:",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Text(
                                        result.data.email,
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          "Role:",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Text(
                                        result.data.role,
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        right: 10,
                        top: 5,
                        child: InkWell(
                          onTap: () async{
                            var reload = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpadateProfile(result: result,pic: 'dr.png',),));

                            if(reload){
                              setState(() {
                                isloading = true;
                                Api.ShowProfile().then((value) {
                                  result = value;
                                  setState(() {
                                    isloading =false;
                                  });
                                });
                                print('reload');
                              });
                            }
                          },
                          child: Icon(
                            Icons.edit,
                            size: 30,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),

      ],
    );
  }
}

