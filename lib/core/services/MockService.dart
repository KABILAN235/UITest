import 'package:flutter/material.dart';

class MockService {
  static Future<List> getData(String expected) async {
    if (expected == "Success") {
      return Future.delayed(Duration(seconds: 2)).then((value) {
        return [
          {
            "posted_time": "2021-08-15T07:00:00+0000",
            "likes": 2000,
            "comments": 150,
            "engagement": 2.3,
            "photo_url":
                "https://elviajerofeliz.com/wp-content/uploads/2015/09/paisajes-de-Canada.jpg"
          },
          {
            "posted_time": "2021-08-15T07:00:00+0000",
            "likes": 100,
            "comments": 10,
            "engagement": 0.1,
            "photo_url":
                "https://ladefinicion.com/wp-content/uploads/2019/08/paisaje-natural.jpg"
          },
          {
            "posted_time": "2021-08-15T07:00:00+0000",
            "likes": 545,
            "comments": 23,
            "engagement": 1.5,
            "photo_url":
                "http://s4.thingpic.com/images/Zr/AnBj3tU6qFVqWsezXhEW37xa.jpeg"
          }
        ];
      });
    } else {
      return Future.delayed(Duration(seconds: 3)).then((value) {
        throw ErrorDescription("This Is A Generated Error");
      });
    }
  }
}
