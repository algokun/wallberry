import 'package:flutter/material.dart';
import 'package:wallberry/constants/thumbs.dart';
import 'package:wallberry/ui/widgets/collection_list.dart';

class Collections extends StatelessWidget with AssetThumbs {
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
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      CollectionGridView(data[index]['name'])));
            },
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
                          child: Image.asset(
                            data[index]['thumb01'],
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 4,
                          child: Image.asset(
                            data[index]['thumb02'],
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3 - 50,
                          height: MediaQuery.of(context).size.height / 5,
                          child: Image.asset(
                            data[index]['thumb03'],
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
                    data[index]['name'],
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
        itemCount: data.length,
      ),
    );
  }
}
