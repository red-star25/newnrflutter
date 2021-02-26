import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:nrlifecare/controller/CategoryController/categoryController.dart';
import 'package:nrlifecare/view/SearchProduct/searchResultListView.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static const historyLength = 5;

  final categoryController = Get.find<CategoryController>();

  List<String> _searchHistory = [
    'NRCOF-TR',
    'NRPro',
    'NRVita',
    'NRMet',
  ];

  List<String> filteredSearchHistory;

  String selectedTerm;

  List<String> filterSearchTerms({
    @required String filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((term) => term.toLowerCase().startsWith(filter.toLowerCase()))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }

    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }

    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  FloatingSearchBarController controller;

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloatingSearchBar(
        backdropColor: Colors.white,
        automaticallyImplyBackButton: false,
        leadingActions: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 25.h,
              color: AppColors.primaryColor,
            ),
            onPressed: () async {
              Get.find<CategoryController>().isSearchVisible.value = false;
              await FirebaseFirestore.instance
                  .collection("Categories")
                  .get()
                  .then((value) {
                categoryController.setCategoryId(value
                    .docs[Get.find<CategoryController>()
                        .selectedCategoryIndex
                        .value]
                    .id
                    .toString());
              });
              Get.toNamed("/category");
            },
          )
        ],
        controller: controller,
        body: FloatingSearchBarScrollNotifier(
          child: SearchResultsListView(
            searchTerm: selectedTerm,
          ),
        ),
        transition: CircularFloatingSearchBarTransition(),
        physics: const BouncingScrollPhysics(),
        title: Text(
          selectedTerm ?? 'Search...',
          style: AppTextDecoration.bodyText4,
        ),
        hint: 'Search and find out...',
        actions: [
          FloatingSearchBarAction.searchToClear(),
        ],
        onQueryChanged: (query) {
          setState(() {
            filteredSearchHistory = filterSearchTerms(filter: query);
          });
        },
        onSubmitted: (query) {
          if (!query.isBlank || !query.isEmpty) {
            setState(() {
              addSearchTerm(query);
              selectedTerm = query;
              Get.find<CategoryController>().addSearchedProducts(query);
            });
            controller.close();
          } else {
            controller.close();
          }
        },
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.white,
              elevation: 4,
              child: Builder(
                builder: (context) {
                  if (filteredSearchHistory.isEmpty &&
                      controller.query.isEmpty) {
                    return Container(
                      height: 56,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Search Product',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextDecoration.bodyText4,
                      ),
                    );
                  } else if (filteredSearchHistory.isEmpty) {
                    return ListTile(
                      title: Text(controller.query),
                      leading: const Icon(Icons.search),
                      onTap: () {
                        setState(() {
                          addSearchTerm(controller.query);
                          selectedTerm = controller.query;
                        });
                        controller.close();
                      },
                    );
                  } else {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: filteredSearchHistory
                          .map(
                            (term) => ListTile(
                              title: InkWell(
                                onTap: () {
                                  setState(() {
                                    addSearchTerm(term);
                                    selectedTerm = term;
                                    Get.find<CategoryController>()
                                        .addSearchedProducts(term);
                                  });
                                  controller.close();
                                },
                                child: Text(
                                  term,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              leading: const Icon(Icons.history),
                              trailing: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    deleteSearchTerm(term);
                                  });
                                },
                              ),
                              onTap: () {
                                setState(() {
                                  putSearchTermFirst(term);
                                  selectedTerm = term;
                                });
                                controller.close();
                              },
                            ),
                          )
                          .toList(),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
