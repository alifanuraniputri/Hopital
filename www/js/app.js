var siteURL = 'http://127.0.0.1:8080/hopital';

function loginCall(url,username,password) {
    var callURL = url+'/hopitaluser/validate?user=' + username + '&psswd=' + password, xmlHttp = null;
    xmlHttp = new XMLHttpRequest();
    xmlHttp.open("POST", callURL, false);
    xmlHttp.send();
    return xmlHttp.responseText;
}

function donateCall(url,id,amount) {
    var callURL = url+'/donation/donate?id=' + id + '&amount=' + amount, xmlHttp = null;
    xmlHttp = new XMLHttpRequest();
    xmlHttp.open("POST", callURL, false);
    xmlHttp.send();
    return xmlHttp.responseText;
}

function getScheduleCall(url,username) {
    var callURL = url+'/schedule?user=' + username, xmlHttp = null;
    xmlHttp = new XMLHttpRequest();
    xmlHttp.open("GET", callURL, false);
    xmlHttp.send();
    return xmlHttp.responseText;
}

function getDonationCall(url) {
    var callURL = url+'/donation/getall', xmlHttp = null;
    xmlHttp = new XMLHttpRequest();
    xmlHttp.open("GET", callURL, false);
    xmlHttp.send();
    return xmlHttp.responseText;
}

function getDataDonasi(url,id) {
    var callURL = url+'/donation/'+id, xmlHttp = null;
    xmlHttp = new XMLHttpRequest();
    xmlHttp.open("GET", callURL, false);
    xmlHttp.send();
    return xmlHttp.responseText;
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
    }
    return "";
}

function validate(username,password){
    
    var data = loginCall(siteURL,username,password);
    var obj = JSON.parse(data);
    if (obj.message=="valid") {
        var d = new Date();
        d.setTime(d.getTime() + (365*24*60*60*1000));
        var expires = "expires="+d.toUTCString();
        document.cookie = "user=" + username + "; " + expires;
        window.location = "menu.html"; // Redirecting to other page.
    } else {
        document.getElementById('errormsg').innerHTML = '<p style="color:red">incorrect username/password</p>';
    }
}

function showSchedule() {
    
    var name=getCookie("user");
    console.log(name);
    var data = getScheduleCall(siteURL,name);
    var jsonData = JSON.parse(data);
    for (var i = 0; i < jsonData.length; i++) {
        document.getElementById('accordion').innerHTML = document.getElementById('accordion').innerHTML + '<div class="panel panel-default"> <div class="panel-heading"> <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#accordion" href="#collapse'+i+'"> <div class="row"> <div class="col-xs-2"> <i class="fa fa-bookmark"> </i> </div> <div class="col-xs-10 pscheduletitle pull-left" align="left"> '+ jsonData[i].scheduleDate +' </div> </div> </a> </h4> </div> <div id="collapse'+i+'" class="panel-collapse collapse in"> <div class="panel-body"> <p class="pcharity">'+ jsonData[i].doctor.name +'</p> <p class="pcharity">'+ jsonData[i].scheduleType +'</p><p class="pcharity">'+ jsonData[i].note +'</p> </div </div> </div>';
    }    
}


function showDonation() {
    
    var data = getDonationCall(siteURL);
    var jsonData = JSON.parse(data);
    for (var i = 0; i < jsonData.length; i++) {
        document.getElementById('donationlist').innerHTML = '<li class="media-list-highlight content"> <span> <div class="row" style="margin-left:5px"> <div class="col-xs-8"> <p class="pcharity"> <i class="fa fa-user fa-fw" style="color:#80174d"></i>'+ jsonData[i].age+' Tahun, '+ jsonData[i].gender+'</p> <p class="pcharity">'+ jsonData[i].disease+'</p> <p class="pcharity">Membutuhkan Rp &nbsp; '+ jsonData[i].donationNeeded +'</p> <p class="pcharitynominal">Masih Mencari Rp &nbsp; '+ jsonData[i].currentDonation +'</p> </div>  <div class="col-xs-4"> <a class="btn btn-success btn-xs" onclick="donate('+jsonData[i].id+')"> <i class="fa fa-heart"></i> donate</a> </div> </div> </span> </li>' + document.getElementById('donationlist').innerHTML;
    }    
}

function donate(id) {
    document.cookie = "iddonasi=" + id;
    window.location = "donate.html";
}

function showDataDonasi() {
    var id = getCookie("iddonasi");
    document.getElementById('iddonate').value=id;
    var data = getDataDonasi(siteURL,id);
    var jsonData = JSON.parse(data);
    document.getElementById('datadonasi').innerHTML = '<p class="pcharity"> <i class="fa fa-user fa-fw" style="color:#80174d"></i> '+ jsonData.age+' Tahun, '+ jsonData.gender+'</p> <p class="pcharity">'+ jsonData.disease+'</p> <p class="pcharity">Membutuhkan Rp &nbsp; '+ jsonData.donationNeed ed +'</p> <p class="pcharitynominal">Masih Mencari Rp &nbsp; '+ jsonData.currentDonation +'</p>';
}

function kirimDonasi(id,amount) {
    
    donateCall(siteURL,id,amount);
    window.location="charity.html";
}
