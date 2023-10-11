@EndUserText.label: 'Travel Header CDS Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true

@UI.headerInfo: {

typeName: 'Travel',
typeNamePlural: 'Travels',
title: { label: 'Travel',
         type: #STANDARD,
         value: 'TravelId'
 }

}
define root view entity ZC_FK_TRAVEL_HDR
  provider contract transactional_query
  as projection on ZI_FK_TRAVEL_HDR
{
      @UI.facet: [{
        label: 'Travel',
        id: 'TravelID',
        position: 10,
        type: #IDENTIFICATION_REFERENCE
       },
       {
        label: 'Booking',
        id: 'BookingID',
        position: 20,
        type: #LINEITEM_REFERENCE,
        targetElement: '_Booking'
       }
       ]

      @UI.lineItem: [{ position: 10, importance: #HIGH }]
      @UI.identification: [{ position: 10 }]
      @UI.selectionField: [{ position: 10 }]
  key TravelId,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Agency', element: 'AgencyID'} }]
      @ObjectModel.text.element: ['AgencyName']
      @Search.defaultSearchElement: true

      @UI.lineItem: [{ position: 20, importance: #HIGH }]
      @UI.identification: [{ position: 20 }]
      @UI.selectionField: [{ position: 20 }]
      AgencyId,
      _Agency.Name        as AgencyName,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID'} }]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true

      @UI.lineItem: [{ position: 30, importance: #HIGH }]
      @UI.identification: [{ position: 30 }]
      @UI.selectionField: [{ position: 30 }]
      CustomerId,
      _Customer.FirstName as CustomerName,

      @UI.identification: [{ position: 40 }]
      BeginDate,
      @UI.identification: [{ position: 50 }]
      EndDate,
      @UI.identification: [{ position: 60 }]
      BookingFee,
      @UI.lineItem: [{ position: 40, importance: #HIGH }]
      @UI.identification: [{ position: 70 }]
      TotalPrice,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency'} }]
      @Semantics.currencyCode: true
      CurrencyCode,
      @UI.identification: [{ position: 80 }]
      Description,
      @UI.lineItem: [{ position: 50, importance: #HIGH }]
      @UI.identification: [{ position: 90 }]
      Status,
      Lastchangedat,
      /* Associations */
      _Agency,
      _Customer,
      _Booking : redirected to composition child ZC_FK_BOOKING
}
