/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$('#confirm-delete').on('show.bs.modal', function(e) {
    console.log('confirm');
    $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
});

$('#modal-detalle').on('show.bs.modal', function(e) {
    console.log('show');
    $(this).find('#modal-detalle-solicitud').attr('src',$(e.relatedTarget).data('href'));
});

$('#modal-detalle').on('hide.bs.modal', function(e) {
    console.log('close');
    $(this).find('#modal-detalle-solicitud').attr('src',' ');
});