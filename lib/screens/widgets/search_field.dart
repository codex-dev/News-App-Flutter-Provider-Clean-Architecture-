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
  final TextEditingController _searchController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(50.0),
      child: TextField(
        style: const TextStyle(
          fontSize: 18,
        ),
        controller: _searchController,
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            ref.read(newsProvider.notifier).loadSearchedNews(value, 1);
          } else {
            _showErrorPopup();
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: AppStrings.search,
          hintStyle: const TextStyle(fontSize: 16),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _showClearButton
              ? IconButton(
                  onPressed: _clearSearchText,
                  icon: const Icon(Icons.close_rounded))
              : null,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.white),
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

  void _showErrorPopup() {
    ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
        backgroundColor: Colors.red,
        leading: const Icon(
          Icons.error_outline_rounded,
          color: Colors.white,
        ),
        content: const Text(
          AppStrings.errInputSearchQuery,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () => ScaffoldMessenger.of(context)
                  .hideCurrentMaterialBanner(),
              child: const Text("Dismiss",style: TextStyle(color: Colors.white,))),
          /*IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),*/
        ]));
  }
}
