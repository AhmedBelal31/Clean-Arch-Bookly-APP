import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../const.dart';
import '../../controller/search_cubit/search_cubit.dart';

// import '../../view_models/search_cubit/search_cubit.dart';

// class CustomTextField extends StatelessWidget {
//    CustomTextField({super.key ,});
//
//   var searchController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: searchController,
//       onChanged: (query) {
//         BlocProvider.of<SearchCubit>(context).fetchSearchedBooks(bookName: query);
//         kQuery = query ;
//       },
//       style: const TextStyle(letterSpacing: 1.8),
//       decoration: InputDecoration(
//         enabledBorder: buildOutlineInputBorder(),
//         focusedBorder: buildOutlineInputBorder(),
//         hintText: 'Search ',
//         suffixIcon: const Opacity(
//           opacity: 0.8,
//           child: Icon(
//             FontAwesomeIcons.magnifyingGlass,
//           ),
//         ),
//         hintStyle: const TextStyle(
//           letterSpacing: 2.0,
//         ),
//       ),
//     );
//   }
//
//   OutlineInputBorder buildOutlineInputBorder() {
//     return OutlineInputBorder(
//       borderSide: const BorderSide(
//         color: Colors.white,
//       ),
//       borderRadius: BorderRadius.circular(12.0),
//     );
//   }
// }
