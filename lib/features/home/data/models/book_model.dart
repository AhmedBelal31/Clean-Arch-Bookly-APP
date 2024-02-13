import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';

// class BookModel extends BookEntity {
//   int? totalItems;
//   List<BookModelItems> items = [];
//   String? kind;
//
//   BookModel({
//     required this.totalItems,
//     required this.items,
//     required this.kind,
//   }) : super(
//           bookId: items.first.id!,
//           imageUrl: items[0].volumeInfo.imageLinks.thumbnail!,
//           title: items[0].volumeInfo.title!,
//           authorName: items[0].volumeInfo.authors[0],
//           price: items[0].saleInfo!.listPrice!.amount!,
//           rating: items[0].volumeInfo.averageRating!,
//         );
//
//   factory BookModel.fromJson(Map<String, dynamic> json) {
//     return BookModel(
//         kind : json['kind'],
//         totalItems : json['totalItems'],
//       items: (json['items'] as List<dynamic>)
//           .map((item) => BookModelItems.fromJson(item))
//           .toList(),
//
//     );
//
//
//
//
//   }
// }
class AllBooksModel {
  int? totalItems;
  List<BookModel> items = [];
  String? kind;

  AllBooksModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    totalItems = json['totalItems'];
    json['items'].forEach((item) {
      items.add(BookModel.fromJson(item));
    });
  }
}

class BookModel extends BookEntity {
  String? id;

  String? etag;
  late BookModelVolumeInfo volumeInfo;

  BookModelAccessInfo? accessInfo;

  BookModelSaleInfo? saleInfo;

  BookModel({
    required this.id,
    required this.accessInfo,
    required this.etag,
    required this.volumeInfo,
    required this.saleInfo,
  }) : super(
            bookId: id ?? 'No-Id',
            imageUrl: volumeInfo.imageLinks.thumbnail ,
            title: volumeInfo.title ?? 'No Title',
            authorName: volumeInfo.authors.isNotEmpty
                ? volumeInfo.authors[0]
                : 'No Name',
            rating: volumeInfo.averageRating ?? 4,
            price: saleInfo!.listPrice?.amount ?? 0,
            previewLink: volumeInfo.previewLink ?? 'No LinK',
            publishedDate: volumeInfo.publishedDate ?? '3/1/2001');

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] ?? '',
      etag: json['etag'] ?? '',
      volumeInfo: BookModelVolumeInfo.fromJson(json['volumeInfo']),
      accessInfo: BookModelAccessInfo.fromJson(json['accessInfo']),
      saleInfo: BookModelSaleInfo.fromJson(json['saleInfo']),
    );
  }
}

class BookModelVolumeInfo {
  String? title;

  String? subTitle;

  List<String> authors = [];

  List<String> categories = [];
  String? publishedDate;

  String? publisher;

  String? description;

  num? averageRating;

  num? ratingsCount;

  String? previewLink;

  late BookModelVolumeInfoImageLinks imageLinks;

  BookModelVolumeInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json['subtitle'];
    publishedDate = json['publishedDate'];
    publisher = json['publisher'];
    ratingsCount = json['ratingsCount'];
    averageRating = json['averageRating'];
    description = json['description'];
    previewLink = json['previewLink'];

    if (json['authors'] != null) {
      json['authors'].forEach((author) {
        authors.add(author);
      });
    }

    if (json['categories'] != null) {
      json['categories'].forEach((category) {
        categories.add(category);
      });
    }
    imageLinks = BookModelVolumeInfoImageLinks.fromJson(json['imageLinks']);
  }
}

class BookModelVolumeInfoImageLinks {
  String? smallThumbnail;
  String? thumbnail;

  BookModelVolumeInfoImageLinks.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      smallThumbnail = json['smallThumbnail'];
      thumbnail = json['thumbnail'];
    }
  }
}

class BookModelSaleInfo {
  String? saleability;
  String? buyLink;
  BookModelSaleInfoListPrice? listPrice;

  BookModelSaleInfo.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      saleability = json['saleability'];
      buyLink = json['buyLink'];
      listPrice = BookModelSaleInfoListPrice.fromJson(json['listPrice']);
    }
  }
}

class BookModelSaleInfoListPrice {
  num? amount;
  String? currencyCode;

  BookModelSaleInfoListPrice.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      amount = json['amount'];
      currencyCode = json['currencyCode'];
    }
  }
}

class BookModelAccessInfo {
  BookModelAccessInfoPdf? pdf;

  String? country;

  BookModelAccessInfo.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      country = json['country'];
      pdf = BookModelAccessInfoPdf.fromJson(json['pdf']);
    }
  }
}

class BookModelAccessInfoPdf {
  bool? isAvailable;

  String? acsTokenLink;

  BookModelAccessInfoPdf.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      isAvailable = json['isAvailable'];
      acsTokenLink = json['acsTokenLink'];
    }
  }
}
