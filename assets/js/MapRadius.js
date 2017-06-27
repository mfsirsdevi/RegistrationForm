$(document).ready(function() {
    function GMapCircle(rad){

        var uri = 'https://maps.googleapis.com/maps/api/staticmap?';
        var staticMapSrc = 'center=' + lat + ',' + lng;
        staticMapSrc += '&size=900x300';
        staticMapSrc += '&path=color:0xff0000ff:weight:1';

        var lat = 20.349375;                 // Current Latitude
        var lng = 85.807450;                 // Current Longitude
        var r    = 6371;                     // Earth Radius
        var pi   = Math.PI;
        var _lat  = (lat * pi) / 180;
        var _lng  = (lng * pi) / 180;
        var d    = (rad/1000) / r;
        var i = 0;

        var detail = 8;
        for(i = 0; i <= 360; i+=detail) {
            var brng = i * pi / 180;

            var pLat = Math.asin(Math.sin(_lat) * Math.cos(d) + Math.cos(_lat) * Math.sin(d) * Math.cos(brng));
            var pLng = ((_lng + Math.atan2(Math.sin(brng) * Math.sin(d) * Math.cos(_lat), Math.cos(d) - Math.sin(_lat) * Math.sin(pLat))) * 180) / pi;
            pLat = (pLat * 180) / pi;

           staticMapSrc += "|" + pLat + "," + pLng;
        }
        staticMapSrc += '&key=AIzaSyC2RIqiYE92YSCPEwsRpZMo6-mLP9CX_YM';
        return uri + encodeURI(staticMapSrc);
    }

    $("#radius").on("change", function() {

        var mapLat = '20.349375';
        var mapLng =  '85.807450';
        var mapRadius = $(this).val();
        var mapFill = 'E85F0E';
        var mapBorder = '91A93A';
        var mapWidth = 900;
        var mapHeight = 300;

        var encString = GMapCircle(mapRadius);
        var mapApi = 'http://maps.google.com/maps/api/staticmap?';
        var mapUrl = mapApi+'center='+mapLat+','+mapLng+'&size='+mapWidth+'x'+mapHeight+'&maptype=roadmap&markers=color:red%7Clabel:U%7C'+mapLat+',' + mapLng + '&path=fillcolor:0x'+mapFill+'33%7Ccolor:0x'+mapBorder+'00%7Cenc:'+encString+'&sensor=false';
        $(document).find('#map-image').attr('src', mapUrl);
    });
    $("#radius").trigger("change");
});