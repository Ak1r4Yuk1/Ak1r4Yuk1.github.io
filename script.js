document.cookie = 'expires=Thu, 18 Dec 2022 12:00:00 UTC; SameSite=Lax';

$(document).ready(function(){
  $('.sidenav').sidenav();
});

$(document).ready(function(){
  $('.datepicker').datepicker();
});

function prendi(){
  var inputValue = document.getElementById("input").value;
  document.documentElement.innerHTML = "<p class=\"center-align\">"+ "Hai selezionato: " +inputValue + "</p>";
}

function irc_pass(){
    var pass = "#AnarchyFS#";
    console.log(pass);
}



