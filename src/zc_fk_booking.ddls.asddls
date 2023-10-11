@EndUserText.label: 'Travel Booking CDS Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true
@Search.searchable: true

@UI.headerInfo: {

typeName: 'Booking',
typeNamePlural: 'Bookings',
title: { label: 'Booking',
         type: #STANDARD,
         value: 'BookingId'
 }
}
define view entity ZC_FK_BOOKING
  as projection on ZI_FK_BOOKING
{
      @UI.facet: [{
              label: 'Booking',
              id: 'BookingID',
              position: 20,
              type: #IDENTIFICATION_REFERENCE
       }]
      @Search.defaultSearchElement: true
      @UI.lineItem: [{ position: 10, importance: #HIGH }]
      @UI.identification: [{ position: 10 }]
  key TravelId,
      @Search.defaultSearchElement: true
      @UI.lineItem: [{ position: 20, importance: #HIGH }]
      @UI.identification: [{ position: 20 }]
      @UI.selectionField: [{ position: 10 }]
  key BookingId,
      @UI.lineItem: [{ position: 30 }]
      @UI.identification: [{ position: 30 }]
      BookingDate,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID'} }]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true

      @UI.lineItem: [{ position: 40 }]
      @UI.identification: [{ position: 40 }]
      @UI.selectionField: [{ position: 20 }]
      CustomerId,
      _Customer.FirstName as CustomerName,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Carrier', element: 'AirlineID'} }]
      @ObjectModel.text.element: ['CarrierName']
      @Search.defaultSearchElement: true

      @UI.lineItem: [{ position: 50 }]
      @UI.identification: [{ position: 50 }]
      @UI.selectionField: [{ position: 30 }]
      CarrierId,
      _Carrier.Name       as CarrierName,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Connection_STDVH', element: 'ConnectionID'},
      additionalBinding: [{ element: 'AirlineID', localElement: 'CarrierId' },
                          { element: 'FlightDate', localElement: 'FlightDate' },
                          { element: 'Price', localElement: 'FlightPrice' },
                          { element: 'CurrencyCode', localElement: 'CurrencyCode' }] }]

      @UI.lineItem: [{ position: 60 }]
      @UI.identification: [{ position: 60 }]
      ConnectionId,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Connection_STDVH', element: 'FlightDate'},
      additionalBinding: [{ element: 'AirlineID', localElement: 'CarrierId' },
                          { element: 'ConnectionID', localElement: 'ConnectionId' },
                          { element: 'Price', localElement: 'FlightPrice' },
                          { element: 'CurrencyCode', localElement: 'CurrencyCode' }] }]

      @UI.lineItem: [{ position: 70 }]
      @UI.identification: [{ position: 70 }]
      @UI.selectionField: [{ position: 40 }]
      FlightDate,
      @UI.lineItem: [{ position: 80 }]
      @UI.identification: [{ position: 80 }]
      FlightPrice,
      @Semantics.currencyCode: true
      CurrencyCode,
      Lastchangedat,
      /* Associations */
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent ZC_FK_TRAVEL_HDR
}
