@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'FK RAP Test 1'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_FK_RAP_TEST1
  as select from ztfkdbtab
{
  key id       as Id,
      fname    as Fname,
      lastname as Lastname,
      age      as Age,
      gender   as Gender,
      class    as Class,
      school   as School,
      grade    as Grade,
      dob      as Dob,
      status   as Status
}
