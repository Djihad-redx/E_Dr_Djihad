import 'package:flutter/material.dart';


class CartCard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.grey.shade100
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage('assets/images/img4.jpg'),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               "Product Name",
                style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "150.5 ",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.orange),
                  children: [
                    TextSpan(
                        text: "\$",
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
               padding: EdgeInsets.only(left:3,right: 3,top: 1,bottom: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.green
                ),
                child: Text(
                  "3",
                  style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.bold),
                  maxLines: 2,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
