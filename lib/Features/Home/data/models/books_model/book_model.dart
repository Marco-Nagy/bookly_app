/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

class BookModel {
  BookModel({
    required this.totalItems,
    required this.kind,
    required this.items,
  });

  int totalItems;
  String kind;
  List<Item> items;

  factory BookModel.fromJson(Map<dynamic, dynamic> json) => BookModel(
        totalItems: json["totalItems"] ?? "",
        kind: json["kind"] != null ? json["kind"].toString() : '',
        items: json["items"] != null
            ? (json["items"] as List).map((e) => Item.fromJson(e)).toList()
            : [],
      );
}

class Item {
  Item({
    required this.saleInfo,
    required this.searchInfo,
    required this.kind,
    required this.volumeInfo,
    required this.etag,
    required this.id,
    required this.accessInfo,
    required this.selfLink,
  });

  SaleInfo saleInfo;
  SearchInfo searchInfo;
  String kind;
  VolumeInfo volumeInfo;
  String etag;
  String id;
  AccessInfo accessInfo;
  String selfLink;

  factory Item.fromJson(Map<dynamic, dynamic> json) => Item(
        saleInfo: json["saleInfo"] != null
            ? SaleInfo.fromJson(json["saleInfo"])
            : SaleInfo(
                country: '',
                isEbook: false,
                saleability: '',
                offers: [],
                buyLink: '',
                retailPrice: SaleInfoListPrice(amount: 0.0, currencyCode: ''),
                listPrice: SaleInfoListPrice(amount: 0.0, currencyCode: '')),
        searchInfo: json["searchInfo"] == null
            ? SearchInfo(textSnippet: '')
            : SearchInfo.fromJson(json["searchInfo"]),
        kind: json["kind"] ?? "",
        volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
        etag: json["etag"] ?? "",
        id: json["id"] ?? "",
        accessInfo: json["accessInfo"] != null
            ? AccessInfo.fromJson(json["accessInfo"])
            : AccessInfo(
                accessViewStatus: '',
                country: 'country',
                viewability: 'viewability',
                pdf: Epub(isAvailable: false, acsTokenLink: ''),
                webReaderLink: '',
                epub: Epub(isAvailable: false, acsTokenLink: ''),
                publicDomain: false,
                quoteSharingAllowed: false,
                embeddable: false,
                textToSpeechPermission: ''),
        selfLink: json["selfLink"] ?? "",
      );
}

class AccessInfo {
  AccessInfo({
    required this.accessViewStatus,
    required this.country,
    required this.viewability,
    required this.pdf,
    required this.webReaderLink,
    required this.epub,
    required this.publicDomain,
    required this.quoteSharingAllowed,
    required this.embeddable,
    required this.textToSpeechPermission,
  });

  String accessViewStatus;
  String country;
  String viewability;
  Epub pdf;
  String webReaderLink;
  Epub epub;
  bool publicDomain;
  bool quoteSharingAllowed;
  bool embeddable;
  String textToSpeechPermission;

  factory AccessInfo.fromJson(Map<dynamic, dynamic> json) => AccessInfo(
        accessViewStatus: json["accessViewStatus"] ?? "",
        country: json["country"] ?? "",
        viewability: json["viewability"] ?? "",
        pdf: json["pdf"] != null
            ? Epub.fromJson(json["pdf"])
            : Epub(isAvailable: false, acsTokenLink: ''),
        webReaderLink: json["webReaderLink"] ?? "",
        epub: json["epub"] != null
            ? Epub.fromJson(json["epub"])
            : Epub(isAvailable: false, acsTokenLink: ''),
        publicDomain: json["publicDomain"],
        quoteSharingAllowed: json["quoteSharingAllowed"],
        embeddable: json["embeddable"],
        textToSpeechPermission: json["textToSpeechPermission"] ?? "",
      );
}

class Epub {
  Epub({
    required this.isAvailable,
    required this.acsTokenLink,
  });

  bool isAvailable;
  String acsTokenLink;

  factory Epub.fromJson(Map<dynamic, dynamic> json) => Epub(
        isAvailable: json["isAvailable"],
        acsTokenLink: json["acsTokenLink"] ?? "",
      );
}

class SaleInfo {
  SaleInfo({
    required this.country,
    required this.isEbook,
    required this.saleability,
    required this.offers,
    required this.buyLink,
    required this.retailPrice,
    required this.listPrice,
  });

  String country;
  bool isEbook;
  String saleability;
  List<Offer> offers;
  String buyLink;
  SaleInfoListPrice retailPrice;
  SaleInfoListPrice listPrice;

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json["country"] ?? "",
        isEbook: json["isEbook"],
        saleability: json["saleability"] ?? "",
        offers: json["offers"] == null
            ? []
            : (json["offers"] as List).map((e) => Offer.fromJson(e)).toList(),
        buyLink: json["buyLink"] ?? "",
        retailPrice: json["retailPrice"] != null
            ? SaleInfoListPrice.fromJson(json["retailPrice"])
            : SaleInfoListPrice(amount: 0.0, currencyCode: ''),
        listPrice: json["listPrice"] != null
            ? SaleInfoListPrice.fromJson(json["listPrice"])
            : SaleInfoListPrice(amount: 0.0, currencyCode: ''),
      );
}

class SaleInfoListPrice {
  SaleInfoListPrice({
    required this.amount,
    required this.currencyCode,
  });

  double amount;
  String currencyCode;

  factory SaleInfoListPrice.fromJson(Map<dynamic, dynamic> json) =>
      SaleInfoListPrice(
        amount: json["amount"].toDouble() ?? 0.0,
        currencyCode:
            json["currencyCode"] != null ? json["currencyCode"].toString() : '',
      );
}

class Offer {
  Offer({
    required this.finskyOfferType,
    required this.retailPrice,
    required this.listPrice,
  });

  int finskyOfferType;
  OfferListPrice retailPrice;
  OfferListPrice listPrice;

  factory Offer.fromJson(Map<dynamic, dynamic> json) => Offer(
        finskyOfferType: json["finskyOfferType"] ?? "",
        retailPrice: OfferListPrice.fromJson(json["retailPrice"]),
        listPrice: OfferListPrice.fromJson(json["listPrice"]),
      );
}

class OfferListPrice {
  OfferListPrice({
    required this.amountInMicros,
    required this.currencyCode,
  });

  int amountInMicros;
  String currencyCode;

  factory OfferListPrice.fromJson(Map<dynamic, dynamic> json) => OfferListPrice(
        amountInMicros: json["amountInMicros"] ?? "",
        currencyCode: json["currencyCode"] ?? "",
      );
}

class SearchInfo {
  SearchInfo({
    required this.textSnippet,
  });

  String textSnippet;

  factory SearchInfo.fromJson(Map<dynamic, dynamic> json) => SearchInfo(
        textSnippet: json["textSnippet"] ?? "",
      );
}

class VolumeInfo {
  VolumeInfo({
    required this.industryIdentifiers,
    required this.pageCount,
    required this.printType,
    required this.readingModes,
    required this.previewLink,
    required this.canonicalVolumeLink,
    required this.description,
    required this.language,
    required this.title,
    required this.imageLinks,
    required this.panelizationSummary,
    required this.publisher,
    required this.publishedDate,
    required this.categories,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.authors,
    required this.infoLink,
    required this.subtitle,
  });

  List<IndustryIdentifier> industryIdentifiers;
  int pageCount;
  String printType;
  ReadingModes readingModes;
  String previewLink;
  String canonicalVolumeLink;
  String description;
  String language;
  String title;
  ImageLinks imageLinks;
  PanelizationSummary panelizationSummary;
  String publisher;
  String publishedDate;
  List<String> categories;
  String maturityRating;
  bool allowAnonLogging;
  String contentVersion;
  List<String> authors;
  String infoLink;
  String subtitle;

  factory VolumeInfo.fromJson(Map<dynamic, dynamic> json) => VolumeInfo(
        industryIdentifiers: json["industryIdentifiers"]!=null?(json["industryIdentifiers"] as List).map((e) => IndustryIdentifier.fromJson(e)).toList():[],
        pageCount: json["pageCount"] ??0,
        printType: json["printType"] ?? "",
        readingModes: ReadingModes.fromJson(json["readingModes"]),
        previewLink: json["previewLink"] ?? "",
        canonicalVolumeLink: json["canonicalVolumeLink"] ?? "",
        description: json["description"] ?? "",
        language: json["language"] ?? "",
        title: json["title"] ?? "",
        imageLinks: json["imageLinks"] != null
            ? ImageLinks.fromJson(json["imageLinks"])
            : ImageLinks(thumbnail: '', smallThumbnail: ''),
        panelizationSummary:json["panelizationSummary"]!=null?
            PanelizationSummary.fromJson(json["panelizationSummary"]):PanelizationSummary(containsImageBubbles: false, containsEpubBubbles: false),
        publisher: json["publisher"] ?? "",
        publishedDate: json["publishedDate"] ?? "",
        categories: json["categories"] == null
            ? []
            : (json["categories"] as List)
                .map((e) => e != null ? e.toString() : '')
                .toList(),
        maturityRating: json["maturityRating"] ?? "",
        allowAnonLogging: json["allowAnonLogging"] ?? "",
        contentVersion: json["contentVersion"] ?? "",
        authors: json["authors"] == null
            ? []
            : (json["authors"] as List)
                .map((e) => e != null ? e.toString() : '')
                .toList(),
        infoLink: json["infoLink"] ?? "",
        subtitle: json["subtitle"] ?? "",
      );
}

class ImageLinks {
  ImageLinks({
    required this.thumbnail,
    required this.smallThumbnail,
  });

  String thumbnail;
  String smallThumbnail;

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        thumbnail:
            json["thumbnail"] != null ? json["thumbnail"].toString() : '',
        smallThumbnail: json["smallThumbnail"] != null
            ? json["smallThumbnail"].toString()
            : '',
      );
}

class IndustryIdentifier {
  IndustryIdentifier({
    required this.identifier,
    required this.type,
  });

  String identifier;
  String type;

  factory IndustryIdentifier.fromJson(Map<dynamic, dynamic> json) =>
      IndustryIdentifier(
        identifier: json["identifier"] ?? "",
        type: json["type"] ?? "",
      );
}

class PanelizationSummary {
  PanelizationSummary({
    required this.containsImageBubbles,
    required this.containsEpubBubbles,
  });

  bool containsImageBubbles;
  bool containsEpubBubbles;

  factory PanelizationSummary.fromJson(Map<dynamic, dynamic> json) =>
      PanelizationSummary(
        containsImageBubbles: json["containsImageBubbles"] ?? "",
        containsEpubBubbles: json["containsEpubBubbles"] ?? "",
      );
}

class ReadingModes {
  ReadingModes({
    required this.image,
    required this.text,
  });

  bool image;
  bool text;

  factory ReadingModes.fromJson(Map<dynamic, dynamic> json) => ReadingModes(
        image: json["image"] ?? "",
        text: json["text"] ?? "",
      );
}
