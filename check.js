var check = function() {
  if (document.getElementById('password').value == "31102021") {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = '#NiceTry#';
    next();
  } else {

  }
}

var next = function() {
  document.getElementById("hidden").style.visibility = "visible";
}
