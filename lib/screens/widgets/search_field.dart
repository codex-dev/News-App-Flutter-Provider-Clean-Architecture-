// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/constants/app_strings.dart';

import '../../providers/news_provider.dart';

class SearchField extends ConsumerStatefulWidget {
  const SearchField({super.key});

  @override
  ConsumerState<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends ConsumerState<SearchField> {
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

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromHeight(50.0),
      child: TextField(
        style: TextStyle(
          fontSize: 18,
        ),
        controller: _searchController,
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            ref.read(newsProvider.notifier).loadSearchedNews(value);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Please input search query"),
            ));
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
                  onPressed: _clearSearchText, icon: Icon(Icons.close_rounded))
              : null,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(15.0),
          ),
          /*errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.red),
            borderRadius: BorderRadius.circular(15.0),
          ),*/
        ),
      ),
    );
  }
}
