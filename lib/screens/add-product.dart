import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:make_jewel/providers/products-provider.dart';
import 'package:make_jewel/widgets/image-picker.dart';

class AddProducts extends StatelessWidget {
  @override
  final TextEditingController _titleController = new TextEditingController();
  final TextEditingController _descriptionController =
      new TextEditingController();
  final TextEditingController _priceController = new TextEditingController();

  _buildTextField(String name, String desc, TextEditingController controller,
      {int? maxline = 1}) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            maxLines: maxline,
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: name,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(desc)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: .5,
        title: Text("Add Products"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(3, (index) => ImagePicker()),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        hint: Text("Select a Category"),
                        isExpanded: true,
                        value: context.read<ProductsProvider>().category,
                        onChanged: (String? value) {
                          context
                              .read<ProductsProvider>()
                              .switchCategories(value.toString());
                        },
                        items: <String>[
                          "Beads",
                          "NeckWear",
                          "Rings",
                          "Earrings",
                          "WristWear",
                          "Anklet"
                        ]
                            .map<DropdownMenuItem<String>>(
                                (String item) => DropdownMenuItem(
                                      value: item,
                                      child: Text(item),
                                    ))
                            .toList()),
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                        "Categories help users to find the related products"))
              ],
            ),
            _buildTextField("Title", "Make your product title stand out!",
                _titleController),

            _buildTextField("Description", "Shortly describe the product",
                _descriptionController,
                maxline: 3),
            _buildTextField(
                "Price", "You can change the currency", _priceController),

            Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                child: MaterialButton(
                  padding: EdgeInsets.all(20),
                  onPressed: () {
                    context.read<ProductsProvider>().postProduct(
                        context.read<ProductsProvider>().category,
                        _titleController.text,
                        _descriptionController.text,
                        _priceController.text);
                  }
                  // _titleController.clear();
                  // _descriptionController.clear();
                  // _priceController.clear();
                  ,
                  child: Text(
                    "Upload Product",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Color(0xff9245F5),
                )),
            // ElevatedButton(onPressed: (){}, child: Text("Add Product"), style: ButtonStyle(),),
          ],
        ),
      ),
    );
  }
}
