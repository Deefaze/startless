function includeHTML() {
  var z, i, elmnt, file, xhttp;

  /*loop through a collection of all HTML elements:*/
  z = document.querySelectorAll("section[include]");

  for (i = 0; i < z.length; i++) 
  {
    elmnt = z[i];
  
    file = 'pages/' + elmnt.getAttribute("include") + '.html';

    if (file) 
    {
      xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function () {
        if (this.readyState == 4) {
          if (this.status == 200) { elmnt.innerHTML = this.responseText; }
          if (this.status == 404) { elmnt.innerHTML = "<i>Page not found.</i>"; }
          elmnt.removeAttribute("include");
          includeHTML();
        }
      }
      xhttp.open("GET", file, true);
      xhttp.send();
      return;
    }
  }
}
