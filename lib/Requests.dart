import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;


class Requests extends StatefulWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  int numberOfIndividuals=0;

  //final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  late String _itemName;
  late String _itemDescription;
  late String _itemType;
  late String _itemImage;
  late double _itemPrice;
  late String _itemExpiry;
  late String _itemQuantity;
  bool _isLoading = false;
  bool passVisable = true;

  @override
  void initState() {
    super.initState();
    _itemType = '1'; // set default value
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> individualFields = List.generate(
      numberOfIndividuals,
          (index) => Container(
        decoration: BoxDecoration(
          color: const Color(0xc050a000),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        height: 60,
        child: TextFormField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(10),
            hintText: 'Individual ${index + 1}',
          ),
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter individual ${index + 1}';
            }
            return null;
          },
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
          title: const Text(
              'Request Help',
              style: TextStyle(
                fontFamily: 'round',
                fontSize: 25,
              )
          )
      ),

      body: SafeArea(
          child: Container(
            height: size.height,
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: size.height / 15,),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xa9895263),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: const TextField(
                      keyboardType: TextInputType.text,
                      maxLines: 10,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.notes_outlined,
                            size: 30,
                            color: Color(0xff692F45),
                          ),
                        ),
                        hintText: 'Write What you need here',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _pickImage();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: const BoxDecoration(
                                color: Color(0xff895263),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                )),
                            child: const Icon(
                                Icons.dataset,
                                size: 45,
                                color: Color(0xdaefceda)),
                          ),
                        ),
                        _pickedImage != null
                            ? Container(
                          width: 80,
                          height: 80,
                          child: Image.file(
                            _pickedImage!,
                            fit: BoxFit.cover,
                          ),
                        )
                            : Text(
                          '(optional) enter photo',
                          style: TextStyle(
                              fontSize: size.width / 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'round'),
                        ),
                      ],
                    ),
                  ),
                  _isLoading
                      ? const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xdaefceda),
                      ))
                      : Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                          padding: MaterialStateProperty.resolveWith(
                                  (states) => const EdgeInsets.all(18)),
                          backgroundColor:
                          MaterialStateProperty.resolveWith(
                                (states) => const Color(0xff895263),
                          )),
                      child: const Center(
                        child: Text("Request Help",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'round',
                              fontSize: 25,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  ///pick image
  File? _pickedImage;
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }


  Future<void> _uploadImages() async {
  }

  late String _uploadedImagePaths = '';
}
