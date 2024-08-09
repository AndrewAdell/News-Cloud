import 'package:flutter/material.dart';
import 'package:news_app/features/home/presentation/views/widgets/news_list_view_builder.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({
    super.key,
    // required this.category
  });

  // final String category;
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(),
      body: const CustomScrollView(
        slivers: [
          NewsListViewBuilder(
              // category: category,
              ),
        ],
      ),
    );
  }
}
