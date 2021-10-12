import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

_showDialog(context, item) {
  var tel = "+233540209195"; 
    showDialog(
        context: context,
        builder: (_) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.black, width: .1)
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              item.title,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Container(
                                  height: 150,
                                  width: double.infinity - 50,
                                  child: Image.asset(
                                    item.image.toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                height: 150,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: .1),),
                                      padding: EdgeInsets.all(20),
                                      
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: .1)),
                                      padding: EdgeInsets.all(20),
                                      
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: .1)),
                                      padding: EdgeInsets.all(20),
                                      
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(item.description),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Text("PRICE: GHS "),
                                Text(
                                  item.price.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      // padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.black, width: .1)
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Seller Info"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("TEST BUSINESS"),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 18,
                              ),
                              Text("Asafo - Kumasi")
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                size: 18,
                              ),
                              Text("+233247549967")
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    Row(
                      children: [
                        TextButton(
                          onPressed: (){
                            item.saved = !item.saved;
                            Navigator.pop(context);
                          }, child: Icon(Icons.favorite, color: item.saved? Colors.red : Colors.grey[500],)),
                          SizedBox(width: 10,),
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).buttonColor),
                              onPressed: () {
                                launch("tel:" + tel);
                              },
                              child: Icon(Icons.call)),
                        ),
                          
                      ],
                    )
                  ],
                ),
              ),
            ));
  }

  buildListItem(var item, BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDialog(context, item);
      },
      child: Container(
        width: 200,
        child: Card(
          child: Column(
            children: [
              Expanded(
                child: Container(
                    // height: 189,
                    width: 221,
                    child: Image.asset(
                      item.image.toString(),
                      fit: BoxFit.cover,
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      item.title.toString(),
                      style: TextStyle(
                          color: Color(0xff691CCB),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      item.description.toString(),
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("GHS" + item.price.toString(),
                        style: TextStyle(
                            color: Color(0xff691CCB),
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
