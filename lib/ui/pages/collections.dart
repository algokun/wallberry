import 'package:flutter/material.dart';

class Collections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return Center(
            child: Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 30.0),
              width: 2,
              height: 50,
              child: Material(
                color: Colors.white,
              ),
            ),
          );
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 3 - 50,
                          height: MediaQuery.of(context).size.height / 5,
                          child: Image.network(
                            "https://www.whats-on-netflix.com/wp-content/uploads/2020/02/money-heist-part-4-preview-netflix.jpg",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 4,
                          child: Image.network(
                            "https://www.whats-on-netflix.com/wp-content/uploads/2020/02/money-heist-part-4-preview-netflix.jpg",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3 - 50,
                          height: MediaQuery.of(context).size.height / 5,
                          child: Image.network(
                            "https://www.whats-on-netflix.com/wp-content/uploads/2020/02/money-heist-part-4-preview-netflix.jpg",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Moodboard $index",
                    style: Theme.of(context).textTheme.headline,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
