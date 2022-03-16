var detail;
var count;
var url='https://services3.arcgis.com/6j1KwZfY2fZrfNMR/arcgis/rest/services/Hong_Kong_School_Location_and_Information/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json'
$.getJSON(url,function(data){
    detail=data.features;
    count=0;
    show(count);
    var lat=detail[0].attributes.LATITUDE;
    var lon=detail[0].attributes.LONGITUDE;
    lat=parseFloat(lat);
    lon=parseFloat(lon)
    window.onload = function() {
        document.getElementById('frame').src = 'https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q='+lat+','+lon+'&z=16&output=embed&t=';
        
    }
});

function myFunction() {
    var input, filter, ul, li, a, i, txtValue;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    ul = document.getElementById("myUL");
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        txtValue = a.textContent || a.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}
function show(count){  
    var ul = document.getElementById("myUL");
    var li = ul.getElementsByTagName("li");
    for (var i=count; i<7;i++){
        li[i].textContent=detail[i].attributes.ENGLISH_NAME;
    }

}

function init() {
    map = new OpenLayers.Map("basicMap", {
        controls: [
                   new OpenLayers.Control.Navigation(),
                   new OpenLayers.Control.ArgParser(),
                   new OpenLayers.Control.Attribution()
               ]
           });
    var mapnik         = new OpenLayers.Layer.OSM();
    var fromProjection = new OpenLayers.Projection("EPSG:4326");   // Transform from WGS 1984
    var toProjection   = new OpenLayers.Projection("EPSG:900913"); // to Spherical Mercator Projection
    var position       = new OpenLayers.LonLat(7.55785346031189,50.3625329673905).transform( fromProjection, toProjection);
    var zoom           = 3
    
    map.addLayer(mapnik);
    map.setCenter(position, zoom );
    
    var markers = new OpenLayers.Layer.Markers( "Markers" );
    map.addLayer(markers);
    
    var marker = new OpenLayers.Marker(position);
    
    marker.events.register("click", map , function(e){ alert("click");
    });
    
    markers.addMarker(marker);
    }
