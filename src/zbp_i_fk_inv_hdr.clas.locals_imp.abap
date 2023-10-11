CLASS lhc_Invoice DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Invoice RESULT result.
    METHODS earlynumbering_cba_Attachment FOR NUMBERING
      IMPORTING entities FOR CREATE Invoice\_Attachment.
    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE Invoice.

ENDCLASS.

CLASS lhc_Invoice IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_create.
    DATA(lo_doc_handler) = zcl_dh_mngd_inv_handler=>get_instance( ).
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<ls_entity>).
      INSERT VALUE #( %cid            = <ls_entity>-%cid
                      %is_draft       = <ls_entity>-%is_draft
                      invoice  = lo_doc_handler->get_next_inv_number( ) ) INTO TABLE mapped-invoice.
    ENDLOOP.
  ENDMETHOD.

  METHOD earlynumbering_cba_Attachment.
    DATA(lo_doc_handler) = zcl_dh_mngd_inv_handler=>get_instance( ).
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<ls_entity>).
      LOOP AT <ls_entity>-%target ASSIGNING FIELD-SYMBOL(<ls_item_create>).
        INSERT VALUE #( %cid            = <ls_item_create>-%cid
                        %is_draft       = <ls_item_create>-%is_draft
                        attachid  = lo_doc_handler->get_next_attach_id(  ) ) INTO TABLE mapped-attachment.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
