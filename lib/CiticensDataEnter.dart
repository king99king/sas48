import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;


class AddItemToStore extends StatefulWidget {
  const AddItemToStore({Key? key}) : super(key: key);

  @override
  State<AddItemToStore> createState() => _AddItemToStoreState();
}

class _AddItemToStoreState extends State<AddItemToStore> {
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
  late LatLng currentPostion=const LatLng(23.334543, 57.530217) ;
  void _getUserLocation() async {
    await Geolocator.requestPermission();
    var permission = await Geolocator.requestPermission();
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    if (permission == LocationPermission.denied) {
      setState(() {
        currentPostion = const LatLng(23.334543, 57.530217);
      });
    }
    setState(() {
      currentPostion = LatLng(position.latitude, position.longitude);
    });
  }
  @override
  void initState()  {
    super.initState();
    _getUserLocation();
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
              'Add your data',
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height / 15,),

                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff895263),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 60,
                    child: TextFormField(
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.person,
                            size: 30,
                            color: Color(0xdaefceda),
                          ),
                        ),
                        hintText: 'name',
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a Item Name';
                        }
                        return null;


                      },
                      onChanged: (value) {
                        _itemName = value;
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff895263),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 60,
                    child: TextFormField(
                      cursorColor: Colors.black,
                      //  autofillHints:[AutofillHints.name] ,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        //  hintText:'Name' ,
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.credit_card_sharp,
                            size: 30,
                            color: Color(0xdaefceda),
                          ),
                        ),
                        hintText: 'Civil id',
                        counterText: "",
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 8,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ){
                          return '';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _itemPrice = double.parse(value);
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff895263),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 60,
                    child: TextFormField(
                      cursorColor: Colors.black,
                      //  autofillHints:[AutofillHints.name] ,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        //  hintText:'Name' ,
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.onetwothree_outlined,
                            size: 30,
                            color: Color(0xdaefceda),
                          ),
                        ),
                        hintText: 'Phone Number',
                        counterText: "",
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 8,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ){
                          return 'P';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _itemQuantity = value;
                      },
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff895263),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 60,
                    child: TextFormField(
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.people_alt_outlined,
                            size: 30,
                            color: Color(0xdaefceda),
                          ),
                        ),
                        hintText: 'Number of individuals',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the number of individuals';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          numberOfIndividuals = int.tryParse(value) ?? 0;
                        });
                      },
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    itemCount: numberOfIndividuals,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff895263),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            width: size.width/2.5,
                            height: 60,
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration:  InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'name ${index + 1}',
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
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff895263),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            width: size.width/2.5,
                            height: 60,
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration:  InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'health status Notes ${index + 1}',
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
                        ],
                      );
                    },
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
                                Icons.photo,
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
                          'House picture',
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
                        child: Text("Enter My Data",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'round',
                              fontSize: 25,
                            )),
                      ),
                    ),
                  )
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
