@EndUserText.label: 'Invoice Header CDS View Consumption'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI.headerInfo: {
typeName: 'Invoice',
typeNamePlural: 'Invoices',
title.value: 'Invoice',
description: { label: 'Invoice' , value: 'Invoice' }
}
define root view entity ZC_FK_INV_HDR
  provider contract transactional_query
  as projection on ZI_FK_INV_HDR
{
      @UI.facet: [{
          id: 'InvoiceData',
          purpose: #STANDARD,
          position: 10,
          type: #IDENTIFICATION_REFERENCE,
          label: 'Invoice'
       },
       {
          id: 'AttchmentData',
          position: 20,
          purpose: #STANDARD,
          type: #LINEITEM_REFERENCE,         
          targetElement: '_Attachment',
          label: 'Invoice Attachment'
       }
       ]
      @UI.identification: [{ label: 'Invoice', position: 10 }]
      @UI.selectionField: [{ position: 10 }]
      @UI.lineItem: [{ position: 10 }]
  key Invoice,
      @UI.identification: [{ label: 'Customer', position: 20 }]
      @UI.selectionField: [{ position: 20 }]
      @UI.lineItem: [{ position: 20 }]
      VendorId,
      @UI.identification: [{ label: 'Customer', position: 30 }]
      @UI.lineItem: [{ position: 30 }]
      Name,
      @UI.lineItem: [{ position: 40 }]
      @UI.identification: [{ label: 'Create By', position: 40 }]
      LocalCreatedBy,
      @UI.lineItem: [{ position: 50 }]
      @UI.identification: [{ label: 'Changed By', position: 50 }]
      LocalLastChangedBy,
      @UI.lineItem: [{ position: 60 }]
      @UI.identification: [{ label: 'Changed At', position: 60 }]
      LocalLastChangedAt,
      //@UI.identification: [{ label: 'Changed At', position: 70 }]
      //@UI.lineItem: [{ position: 70 }]
      LastChangedAt,
      /* Associations */
      _Attachment : redirected to composition child ZC_FK_INV_ATTACH,
      _Customer
}
