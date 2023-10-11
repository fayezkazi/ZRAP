@EndUserText.label: 'Invoice Attachment CDS View Projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZC_FK_INV_ATTACH
  as projection on ZI_FK_INV_ATTACH
{
      @UI.facet: [{
      id: 'AttchmentData',
      position: 10,
      purpose: #STANDARD,      
      type: #IDENTIFICATION_REFERENCE,
      label: 'Upload Attachment'
       }]
  key AttachId,
      @UI.identification: [{ label: 'Invoice', position: 10 }]
      @UI.selectionField: [{ position: 10 }]
      @UI.lineItem: [{ label: 'Invoice', position: 10 }]
      Invoice,
      @UI.identification: [{ label: 'Comments', position: 20 }]
      @UI.lineItem: [{ label: 'Comments', position: 20 }]
      Comments,
      @UI.identification: [{ label: 'Attachment', position: 30 }]
      @UI.lineItem: [{ label: 'Attachments', position: 40 }]
      Attachment,
      //@UI.identification: [{ label: 'Mime Type', position: 40 }]
      //@UI.lineItem: [{ label: 'File Type', position: 50 }]
      Mimetype,
      //@UI.identification: [{ label: 'File Name', position: 50 }]
      //@UI.lineItem: [{ label: 'File Name', position: 60 }]
      Filename,
      /* Associations */
      _Header : redirected to parent ZC_FK_INV_HDR
}
