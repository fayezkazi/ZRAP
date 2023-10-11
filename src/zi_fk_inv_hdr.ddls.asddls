@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Invoice Header CDS View'
define root view entity ZI_FK_INV_HDR
  as select from ztfk_inv_hdr
  composition [1..*] of ZI_FK_INV_ATTACH as _Attachment
  association [1..1] to /DMO/I_Customer  as _Customer on $projection.VendorId = _Customer.CustomerID
{
      @EndUserText.label: 'Invoice'
  key invoice               as Invoice,
      @EndUserText.label: 'Customer ID'
      @Consumption.valueHelpDefinition: [{ entity: { name: '/dmo/i_customer' , element: 'CustomerID' } }]
      @ObjectModel.text.element: ['Name']
      vendor_id             as VendorId,
      _Customer.FirstName   as Name,
      @EndUserText.label: 'Created By'
      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.user.lastChangedBy: true
      @EndUserText.label: 'Last Changed By'
      local_last_changed_by as LocalLastChangedBy,
      @EndUserText.label: 'Last Changed At'
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @EndUserText.label: 'Last Changed At'
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      _Attachment,
      _Customer
}
