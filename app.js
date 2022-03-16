var detail;
var count;
var url='https://services3.arcgis.com/6j1KwZfY2fZrfNMR/arcgis/rest/services/Hong_Kong_School_Location_and_Information/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json'
$.getJSON(url,function(data){
    detail=data.features;
    count=0;
    
    var lat=detail[0].attributes.LATITUDE;
    var lon=detail[0].attributes.LONGITUDE;
    lat=parseFloat(lat);
    lon=parseFloat(lon)
    window.onload = function() {
        document.getElementById("frame").src = "https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q="+lat+","+lon+"&z=16&output=embed&t=";
        
    }
    document.getElementById("myInput").addEventListener("keyup", myFunction);
    document.getElementById("myInput").addEventListener("keyup", myFunction);
    function myFunction() { 
    var table = document.getElementById("myTable");
    var char = document.getElementById("myInput").value;
    table.innerHTML = "";
    for (let i=0;i<detail.length;i++){
        char=char.toUpperCase(); 
        if (detail[i].attributes.ENGLISH_NAME.indexOf(char)>=0){
            var row = table.insertRow();
            cell = row.insertCell();
            let a = document.createElement("a");
            console.log(detail[i].attributes.ENGLISH_NAME);
            a.innerHTML = detail[i].attributes.ENGLISH_NAME;
            //a.href = "/show?id="+(detail[i]._id).toString();
            cell.append(a);
    }
    
    }}
    
    myFunction();
});

/**function myFunction() {
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
}**/
/**function show(count){  
    var ul = document.getElementById("myUL");
    var li = ul.getElementsByTagName("li");
    for (var i=count; i<7;i++){
        li[i].textContent=detail[i].attributes.ENGLISH_NAME;
    }

}
**/

