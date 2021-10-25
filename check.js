var check = function() {
        if (document.getElementById('password').value == "311021") {
            document.getElementById('message').style.color = 'green';
            document.getElementById('message').innerHTML = '#NiceTry#';
            x = document.getElementById('hidden');
	      if (x){
              if (x.style.display !== "none") {
                x.style.display = "block";
              } else {
                  x.style.display = "none";
                }}
        }
}
