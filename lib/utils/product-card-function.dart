import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

_showDialog(context, item) {
  var tel = item.jewelRefPhone;
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
                            item.jewelName.toString(),
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
                                
                                    child: (item.jewelUrl2 != null)? Image.network(
                                      item.jewelUrl2,
                                      fit: BoxFit.cover,
                                    ) : Container(),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 150,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 45,
                                    width: 45,
                                    child: (item.jewelUrl2 != null)? Image.network(
                                      item.jewelUrl2,
                                      fit: BoxFit.cover,
                                    ) : Container(),
                                    decoration: BoxDecoration(
                                      // color: Colors.red,
                                      // border: Border.all(
                                      //     color: Colors.black, width: .1),
                                    ),
                                    // padding: EdgeInsets.all(20),
                                  ),
                                  SizedBox(
                                    width: 5,
                                    height: 5,
                                  ),
                                  Container(
                                    height: 45,
                                    width: 45,
                                    
                                    child: (item.jewelUrl2 != null)? Image.network(
                                      item.jewelUrl2,
                                      fit: BoxFit.cover,
                                    ) : Container(),
                                    decoration: BoxDecoration(

                                      // color: Colors.red,
                                        // border: Border.all(
                                        //     color: Colors.black, width: .1)
                                            ),
                                    // padding: EdgeInsets.all(20),
                                  ),
                                  SizedBox(
                                    width: 5,
                                    height: 5,
                                  ),
                                  Container(
                                    height: 45,
                                    width: 45,
                                    
                                    child: (item.jewelUrl2 != null)? Image.network(
                                      item.jewelUrl2,
                                      fit: BoxFit.cover,
                                    ) : Container(),
                                    decoration: BoxDecoration(

                                        // border: Border.all(
                                        //     color: Colors.black, width: .1)
                                            ),
                                    // padding: EdgeInsets.all(20),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(item.jewelDesc.toString()),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Text("PRICE: GHS "),
                              Text(
                                item.jewelPrice.toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
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
                            Text(item.jewelLocation)
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
                            Text(tel.toString())
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
                          onPressed: () {
                            item.saved = !item.saved;
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.favorite,
                            color: item.saved ? Colors.red : Colors.grey[500],
                          )),
                      SizedBox(
                        width: 10,
                      ),
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
                  child: Image.network(
                    item.jewelUrl1,
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
                    item.jewelName.toString(),
                    style: TextStyle(
                        color: Color(0xff691CCB), fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    item.jewelDesc.toString(),
                    maxLines: 5,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("GHS" + item.jewelPrice.toString(),
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
