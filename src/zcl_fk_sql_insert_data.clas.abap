CLASS zcl_fk_sql_insert_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fk_sql_insert_data IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    DATA: lt_fkdbtab TYPE TABLE OF ztfkdbtab,
*          wa_fkdbtab TYPE ztfkdbtab.
*
*    TRY.
*        lt_fkdbtab = VALUE #( ( client = sy-mandt fname = 'Arfa' lastname = 'Khanom' gender = 'F'
*                                class = 'KG-2' school = 'DPS School' grade = 'A+' dob = '20170904'
*                                id = cl_system_uuid=>if_system_uuid_static~create_uuid_x16(  ) )
*      ( client = sy-mandt fname = 'Arya' lastname = 'Khanna' gender = 'M'
*                                class = 'KG-2' school = 'DPS School' grade = 'A' dob = '20170802'
*                                id = cl_system_uuid=>if_system_uuid_static~create_uuid_x16(  ) )
*  ).
*      CATCH cx_uuid_error.
*        "handle exception
*    ENDTRY.
*
*    IF lt_fkdbtab[] IS NOT INITIAL.
*      TRY.
*          MODIFY ztfkdbtab FROM TABLE @lt_fkdbtab.
*        CATCH cx_root.
*
*      ENDTRY.
*    ENDIF.

    DELETE FROM ztfk_inv_hdr WHERE invoice = '        4'.
    DELETE FROM ztfk_inv_attach WHERE attach_id = '                              4'.


  ENDMETHOD.
ENDCLASS.
