import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({Key? key}) : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  List<String> lst = ['Maharashtra', 'Gujarat', 'Goa', 'UP', 'MP', 'Mizoram', 'Nagaland', 'Kerala'];
  String? dropDownValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: DropdownButtonFormField<String>(
        alignment: Alignment.bottomCenter,
        isExpanded: true,
        dropdownColor: Colors.white,
        value: dropDownValue,
        decoration:  const InputDecoration(
          prefixIcon: Icon(Icons.location_on_outlined),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color:Colors.black,),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          fillColor: Colors.white,
          filled: true,
          labelText: 'State',
          labelStyle: TextStyle(
              color: Colors.grey,
              fontSize: 13
          ),
        ),
        items: lst.map((String value){
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
        onChanged:(String? newValue) {
          setState(() {
            dropDownValue = newValue!;
          });
        },
      ),
    );
  }
}
