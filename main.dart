import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:like_button/like_button.dart';

void main() {
  runApp(
    MyApplication(),
  );
}

class MyApplication extends StatelessWidget {
  MyApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.pinkAccent,
          ),
          actions: <Widget>[
            LikeButton(
              circleColor:
                  CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
              bubblesColor: BubblesColor(
                dotPrimaryColor: Color(0xff33b5e5),
                dotSecondaryColor: Color(0xff0099cc),
              ),
              likeBuilder: (bool isLiked) {
                return Icon(
                  Icons.favorite,
                  color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.blueGrey,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: SafeArea(child: FoodPage()),
      ),
    );
  }
}

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  var ratingList = [];
  var ratingCount = 0;
  var ratingSum = 0;
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RatingBar.builder(
            initialRating: 0,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              ratingList.add(rating);
              ratingCount++;
              ratingSum += rating.toInt();
            },
          ),
          Expanded(
            child: Text(ratingCount != 0
                ? (((ratingSum / ratingCount) * 10).round() / 10).toString()
                : ""),
          ),
        ],
      ),
    );
  }
}

Future<bool> onLikeButtonTapped(bool isLiked) async {
  return !isLiked;
}
