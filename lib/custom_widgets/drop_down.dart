import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({super.key,  required this.data, required this.controller});
  final List<String> data;
  final TextEditingController controller;
  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  // List<String> lst = ['Maharashtra', 'Gujarat', 'Goa', 'UP', 'MP', 'Mizoram', 'Nagaland', 'Kerala'];
  // String? dropDownValue;

  @override
  Widget build(BuildContext context) {
    widget.controller.text = widget.data[0];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: DropdownButtonFormField<String>(
        alignment: Alignment.bottomCenter,
        isExpanded: true,
        dropdownColor: Colors.white,
        value: widget.controller.text,
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
        items: widget.data.map((String value){
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
            widget.controller.text = newValue!;
          });
        },
      ),
    );
  }
}
