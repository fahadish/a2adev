class Property {
  final String? id;  // Add an 'id' field to uniquely identify each property document

  final String? areaCommunity;
  final String? areaSize;
  final bool? areaCommunityBool;
  final String? bathrooms;
  final String? bedrooms;
  final String? building;
  final String? email;
  final String? finishing;
  final String? floor;
  final String? handoverDate;
  final bool? maidroom;
  final String? moreInfo;
  final String? negotiation;
  final String? occupancy;
  final String? op;
  final String? paymentPlan;
  final String? paymentTerms;
  final String? phoneNumber;
  final String? project;
  final String? propertyDescription;
  final List<String>? propertyImages;
  final String? propertyTitle;
  final String? propertyType;
  final String? purpose;
  final String? roi;
  final int? serviceCharge;
  final String? source;
  final String? sp;
  final String? typeSeries;
  final String? whatsappNumber;

  Property({
    this.id,  // Include 'id' in the constructor
    this.areaCommunity,
    this.areaSize,
    this.areaCommunityBool,
    this.bathrooms,
    this.bedrooms,
    this.building,
    this.email,
    this.finishing,
    this.floor,
    this.handoverDate,
    this.maidroom,
    this.moreInfo,
    this.negotiation,
    this.occupancy,
    this.op,
    this.paymentPlan,
    this.paymentTerms,
    this.phoneNumber,
    this.project,
    this.propertyDescription,
    this.propertyImages,
    this.propertyTitle,
    this.propertyType,
    this.purpose,
    this.roi,
    this.serviceCharge,
    this.source,
    this.sp,
    this.typeSeries,
    this.whatsappNumber,
  });

  // Define a factory constructor to create a Property object from a Map
  factory Property.fromMap(String id, Map<dynamic, dynamic> map) {
    return Property(
      id: id,
      areaCommunity: map['area_community'],
      areaSize: map['area_size'],
      areaCommunityBool: map['areaCommunityBool'],
      bathrooms: map['bathrooms'],
      bedrooms: map['bedrooms'],
      building: map['building'],
      email: map['email'],
      finishing: map['finishing'],
      floor: map['floor'],
      handoverDate: map['handover_date'],
      maidroom: map['maidroom'],
      moreInfo: map['moreInfo'],
      negotiation: map['negotiation'],
      occupancy: map['occupancy'],
      op: map['op'],
      paymentPlan: map['paymentPlan'],
      paymentTerms: map['paymentTerms'],
      phoneNumber: map['phoneNumber'],
      project: map['project'],
      propertyDescription: map['property_description'],
      propertyImages: map['property_images']?.cast<String>(),
      propertyTitle: map['property_title'],
      propertyType: map['propertyType'],
      purpose: map['purpose '],
      roi: map['roi'],
      serviceCharge: map['serviceCharge'],
      source: map['source'],
      sp: map['sp'],
      typeSeries: map['typeSeries'],
      whatsappNumber: map['whatsappNumber'],
    );
  }
}
