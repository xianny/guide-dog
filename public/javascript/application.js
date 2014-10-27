$(document).ready(function() {

    $('#home1').on('click', function(){
        var $$ = $(this)
        if( !$$.is('.checked')){
            $$.addClass('checked');
            $('#home').prop('checked', true);
        } else {
            $$.removeClass('checked');
            $('#home').prop('checked', false);
        }
    })



    $('#outdoor1').on('click', function(){
        var $$ = $(this)
        if( !$$.is('.checked')){
            $$.addClass('checked');
            $('#outdoor').prop('checked', true);
        } else {
            $$.removeClass('checked');
            $('#outdoor').prop('checked', false);
        }
    })



      $('#social1').on('click', function(){
        var $$ = $(this)
        if( !$$.is('.checked')){
            $$.addClass('checked');
            $('#social').prop('checked', true);
        } else {
            $$.removeClass('checked');
            $('#social').prop('checked', false);
        }
    })



    $('#solo1').on('click', function(){
        var $$ = $(this)
        if( !$$.is('.checked')){
            $$.addClass('checked');
            $('#solo').prop('checked', true);
        } else {
            $$.removeClass('checked');
            $('#solo').prop('checked', false);
        }
    })

var mapOptions = {
    center: new google.maps.LatLng(49.282343,-123.108364),
    zoom: 12,
    mapTypeId: google.maps.MapTypeId.ROADMAP
};
var map = new google.maps.Map(document.getElementById('map'), mapOptions);

var markerOptions = {
    position: new google.maps.LatLng(49.282343,-123.108364)
};
var marker = new google.maps.Marker(markerOptions);
marker.setMap(map);

});





