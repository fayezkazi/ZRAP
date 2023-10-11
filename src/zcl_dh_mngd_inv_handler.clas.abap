CLASS zcl_dh_mngd_inv_handler DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: get_instance RETURNING VALUE(ro_handler) TYPE REF TO zcl_dh_mngd_inv_handler.

    METHODS get_next_inv_number RETURNING VALUE(rv_invoice) TYPE ztfk_inv_hdr-invoice.
    METHODS get_next_attach_id RETURNING VALUE(rv_attachid) TYPE ztfk_inv_attach-attach_id.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA: mo_handler TYPE REF TO zcl_dh_mngd_inv_handler.
    DATA: mt_invoice TYPE SORTED TABLE OF ztfk_inv_hdr    WITH UNIQUE KEY invoice,
          mt_attach  TYPE SORTED TABLE OF ztfk_inv_attach WITH UNIQUE KEY attach_id.
ENDCLASS.



CLASS zcl_dh_mngd_inv_handler IMPLEMENTATION.
  METHOD get_instance.
    IF mo_handler IS NOT BOUND.
      mo_handler = NEW #(  ).
    ENDIF.

    ro_handler = mo_handler.
  ENDMETHOD.

  METHOD get_next_inv_number.
    IF mt_invoice IS INITIAL.
      SELECT MAX( invoice ) FROM ztfk_inv_hdr INTO @rv_invoice.
    ELSE.
      rv_invoice = mt_invoice[ lines( mt_invoice ) ]-invoice.
    ENDIF.
    rv_invoice = rv_invoice + 1.
    rv_invoice = |{ rv_invoice ALPHA = IN }|.
    INSERT VALUE #( invoice = rv_invoice ) INTO TABLE mt_invoice.
  ENDMETHOD.

  METHOD get_next_attach_id.
    IF mt_attach IS INITIAL.
      SELECT MAX( attach_id ) FROM ztfk_inv_attach INTO @rv_attachid.
    ELSE.
      rv_attachid = mt_attach[ lines( mt_attach ) ]-invoice.
    ENDIF.
    rv_attachid =  rv_attachid + 1.
    rv_attachid = |{ rv_attachid alpha = IN }|.
    INSERT VALUE #( attach_id = rv_attachid ) INTO TABLE mt_attach.
  ENDMETHOD.

ENDCLASS.
