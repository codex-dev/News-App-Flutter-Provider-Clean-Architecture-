// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:news_app/constants/app_strings.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController _searchController = TextEditingController();
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchTextChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchTextChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged() {
    setState(() {
      _showClearButton = _searchController.text.isNotEmpty;
    });
  }

  void _clearSearchText() {
    setState(() {
      _searchController.clear();
    });
  }

  void _showMessage() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Searching..."),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        style: TextStyle(fontSize: 16),
        controller: _searchController,
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            //TODO
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: AppStrings.SEARCH,
          hintStyle: TextStyle(fontSize: 16),
          prefixIcon: Icon(Icons.search),
          suffixIcon: _showClearButton
              ? IconButton(
                  onPressed: _showMessage,
                  icon: Icon(Icons.arrow_forward_rounded))
              : null,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(15.0),
          ),
          /*focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(15.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.red),
            borderRadius: BorderRadius.circular(15.0),
          ),*/
        ),
      ),
    );
  }
}
