@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Invoice Attachment CDS View'
define view entity ZI_FK_INV_ATTACH
  as select from ztfk_inv_attach
  association to parent ZI_FK_INV_HDR as _Header on $projection.Invoice = _Header.Invoice
{
  key attach_id  as AttachId,
      @EndUserText.label: 'Invoice'
      invoice    as Invoice,
      @EndUserText.label: 'Comments'
      comments   as Comments,
      @EndUserText.label: 'Attachment Data'
      @Semantics.largeObject: {
      fileName: 'Filename',
      mimeType: 'Mimetype',
      contentDispositionPreference: #INLINE
      }
      attachment as Attachment,
      @EndUserText.label: 'Mime Type'
      mimetype   as Mimetype,
      @EndUserText.label: 'File Name'
      filename   as Filename,
      _Header.LastChangedAt as LastChangedAt,
      _Header
}
