class BookModel {
  int? totalItems;
  List<BookModelItems> items = [];
  String? kind;

  BookModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    totalItems = json['totalItems'];
    if (json['items'] != null) {
      json['items'].forEach((item) {
        items.add(BookModelItems.fromJson(item));
      });
    }
  }
}

class BookModelItems {
  String? id;

  String? etag;

  late BookModelVolumeInfo volumeInfo;

  BookModelAccessInfo? accessInfo;

  BookModelSaleInfo? saleInfo;

  BookModelItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    etag = json['etag'];
    volumeInfo = BookModelVolumeInfo.fromJson(json['volumeInfo']);
    saleInfo = BookModelSaleInfo.fromJson(json['saleInfo']);
    accessInfo = BookModelAccessInfo.fromJson(json['accessInfo']);
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
