@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Header CDS Interface View'
define root view entity ZI_FK_TRAVEL_HDR
  as select from /dmo/travel as _Travel
  composition [0..*] of ZI_FK_BOOKING as _Booking
  association [0..1] to /DMO/I_Customer as _Customer on $projection.CustomerId = _Customer.CustomerID
  association [0..1] to /DMO/I_Agency as _Agency on $projection.AgencyId = _Agency.AgencyID
{
  key travel_id     as TravelId,
      agency_id     as AgencyId,
      customer_id   as CustomerId,
      begin_date    as BeginDate,
      end_date      as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee   as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price   as TotalPrice,
      currency_code as CurrencyCode,
      description   as Description,
      status        as Status,
      lastchangedat as Lastchangedat,
      _Booking, // Make association public
      _Customer,
      _Agency
}
