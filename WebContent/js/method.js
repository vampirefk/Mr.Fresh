/*����id��ȡ����*/
function $(str) {
    return document.getElementById(str);
}
 
//var addrShow = $('addr-show');
//var btn = document.getElementsByClassName('met1')[0];
var prov = $('prov');
var city = $('city');
var country = $('country');
 
 
/*���ڱ��浱ǰ��ѡ��ʡ����*/
var current = {
    prov: '',
    city: '',
    country: ''
};
 
/*�Զ�����ʡ���б�*/
(function showProv() {
    //btn.disabled = true;
    var len = provice.length;
    for (var i = 0; i < len; i++) {
        var provOpt = document.createElement('option');
        provOpt.innerText = provice[i]['name'];
        //provOpt.value = i;
        provOpt.value = provice[i]['name'];
        provOpt.val=i;
        prov.appendChild(provOpt);
    }
})();
 
/*������ѡ��ʡ������ʾ�����б�*/
function showCity(obj) {
    //var val = obj.options[obj.selectedIndex].value;
	var val = obj.options[obj.selectedIndex].val;
    if (val != current.prov) {
        current.prov = val;
        //addrShow.value = '';
        //btn.disabled = true;
    }
    //console.log(val);
    if (val != null) {
        city.length = 1;
        var cityLen = provice[val]["city"].length;
        for (var j = 0; j < cityLen; j++) {
            var cityOpt = document.createElement('option');
            cityOpt.innerText = provice[val]["city"][j].name;
            cityOpt.val = j;
            cityOpt.value = provice[val]["city"][j].name;
            city.appendChild(cityOpt);
        }
    }
}
 
/*������ѡ�ĳ�������ʾ�����б�*/
function showCountry(obj) {
    //var val = obj.options[obj.selectedIndex].value;
    var val = obj.options[obj.selectedIndex].val;
    current.city = val;
    if (val != null) {
        country.length = 1; //���֮ǰ������ֻ����һ��Ĭ��ѡ��
        var countryLen = provice[current.prov]["city"][val].districtAndCounty.length;
        if (countryLen == 0) {
            //addrShow.value = provice[current.prov].name + '-' + provice[current.prov]["city"][current.city].name;
            return;
        }
        for (var n = 0; n < countryLen; n++) {
            var countryOpt = document.createElement('option');
            countryOpt.innerText = provice[current.prov]["city"][val].districtAndCounty[n];
            countryOpt.val = n;
            countryOpt.value = provice[current.prov]["city"][val].districtAndCounty[n];
            country.appendChild(countryOpt);
        }
    }
}
 
/*ѡ������֮��Ĵ�����*/
function selecCountry(obj) {
    current.country = obj.options[obj.selectedIndex].val;
    // current.country = obj.options[obj.selectedIndex].value;
    if ((current.city != null) && (current.country != null)) {
        //btn.disabled = false;
    }
}
 
/*���ȷ����ť��ʾ�û���ѡ�ĵ�ַ*/
function showAddr() {
    addrShow.value = provice[current.prov].name + '-' + provice[current.prov]["city"][current.city].name + '-' + provice[current.prov]["city"][current.city].districtAndCounty[current.country];
}