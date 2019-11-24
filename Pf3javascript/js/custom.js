
$(document).ready(function() {

  // Smooth scrolling
  $(function() {
    $('a[href*="#"]:not([href="#"])').click(function() {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
        var target = $(this.hash);
        target = target.length ? target : $('[name=' + this.hash.slice(1) +']');

        if (target.length) {

          if ( $(this).parents('.nav-menu').length ) {
            $('.nav-menu .menu-active').removeClass('menu-active');
            $(this).closest('li').addClass('menu-active');
          }

          if ( $('body').hasClass('mobile-nav-active') ) {
              $('body').removeClass('mobile-nav-active');
              $('#mobile-nav-toggle i').toggleClass('fa-times fa-bars');
              $('#mobile-body-overly').fadeOut();
          }
          return false;
        }
      }
    });
  });

  // Initiate superfish on nav menu
  $('.nav-menu').superfish({
    animation: {opacity:'show'},
    speed: 400
  });

  // Mobile Navigation
  if( $('#nav-menu-container').length ) {
      var $mobile_nav = $('#nav-menu-container').clone().prop({ id: 'mobile-nav'});
      $mobile_nav.find('> ul').attr({ 'class' : '', 'id' : '' });
      $('body').append( $mobile_nav );
      $('body').prepend( '<button type="button" id="mobile-nav-toggle"><i class="fa fa-bars"></i></button>' );
      $('body').append( '<div id="mobile-body-overly"></div>' );
      $('#mobile-nav').find('.menu-has-children').prepend('<i class="fa fa-chevron-down"></i>');

      $(document).on('click', '.menu-has-children i', function(e){
          $(this).next().toggleClass('menu-item-active');
          $(this).nextAll('ul').eq(0).slideToggle();
          $(this).toggleClass("fa-chevron-up fa-chevron-down");
      });

      $(document).on('click', '#mobile-nav-toggle', function(e){
          $('body').toggleClass('mobile-nav-active');
          $('#mobile-nav-toggle i').toggleClass('fa-times fa-bars');
          $('#mobile-body-overly').toggle();
      });

      $(document).click(function (e) {
          var container = $("#mobile-nav, #mobile-nav-toggle");
          if (!container.is(e.target) && container.has(e.target).length === 0) {
             if ( $('body').hasClass('mobile-nav-active') ) {
                  $('body').removeClass('mobile-nav-active');
                  $('#mobile-nav-toggle i').toggleClass('fa-times fa-bars');
                  $('#mobile-body-overly').fadeOut();
              }
          }
      });
  } else if ( $("#mobile-nav, #mobile-nav-toggle").length ) {
      $("#mobile-nav, #mobile-nav-toggle").hide();
  }

  // Stick the header at top on scroll
  $("#header").sticky({topSpacing:0, zIndex: '50'});

  // Tooltip & popovers
  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover();

  // Background image via data tag
  $('[data-block-bg-img]').each(function() {
    // @todo - invoke backstretch plugin if multiple images
    var $this = $(this),
      bgImg = $this.data('block-bg-img');

      $this.css('backgroundImage','url('+ bgImg + ')').addClass('block-bg-img');
  });

//Carga el contendio inicial
cargarContenido('about.html');

//Carga las noticias
cargarNoticias();

//llamada a bienvenida con retardo
setTimeout('bienvenida()',5000);

});

/* Funcion de carga asincrona desde fichero externo XML */
function cargarNoticias() {
  //leemos el archivo.
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      mostrar(this);
    }
  };
  xhttp.open("GET", "assets/noticias.xml", true);
  xhttp.send();
  //cargamos usando variables.
  function mostrar(xml) {
    var i, cadena;
    var objHttp = xml.responseXML;
    cadena = "";
    titular = objHttp.getElementsByTagName('titular');
    encabezado = objHttp.getElementsByTagName('encabezado');
    fecha = objHttp.getElementsByTagName('fecha');
    imagen = objHttp.getElementsByTagName('imagen');
    url = objHttp.getElementsByTagName('url');
    for (i = 0 ; i <titular.length; i++) {
      cadena += "<div class='noticia'><div class='foto-fecha'><div class='foto'>";
      cadena += "<img src='" + imagen[i].childNodes[0].nodeValue + "' alt='" + titular[i].childNodes[0].nodeValue + "'></div>";
      cadena += "<div class='fecha'>" + fecha[i].childNodes[0].nodeValue + "</div></div>";
      cadena += "<a class='titular' href='" + url[i].childNodes[0].nodeValue + "' target='_blank'>";
      cadena += "<h4>" + titular[i].childNodes[0].nodeValue + "</h4></a>";
      cadena += "<div class='encabezado'>" + encabezado[i].childNodes[0].nodeValue + "</div></div>";
    }
    document.getElementById("noticias").innerHTML += cadena;
  }
}

/* Funcion de carga asíncrona del contenido principal de la página */
function cargarContenido(seccion){
  var objHttp=null;
  if(window.XMLHttpRequest) { objHttp = new XMLHttpRequest(); }
  else if(window.ActiveXObject) { objHttp = new ActiveXObject("Microsoft.XMLHTTP"); }
   objHttp.open("GET", seccion, true);
   objHttp.onreadystatechange = function() {
                                             if (objHttp.readyState==4) {
                                               document.getElementById('contenedor-principal').innerHTML = objHttp.responseText;
                                               if (seccion=='donde.html') {
                                                 pintarMapa();
                                               }
                                             }
                                           }
  objHttp.send(null);
}

function activarItem(id) {
  $('.activo').removeClass('activo');
  $('#'+id).addClass('activo');
}

// mensaje de bienvenida
function bienvenida() {
  alert("Bienvenid@s a mi web");
}

// Función para calcular el presupuesto
function calcularPresupuesto(p) {
  var cont = 0;
  var checkboxes = p.Seccion;

  p.Precio.value = p.Tipo.value;
  switch (p.Tipo.value) {
    case "Completa":
      p.Precio.value = 2000;
      break;
    case "Premium":
      p.Precio.value = 3000;
      break;
    default:
      p.Precio.value = 1000;
  }

  if (p.Plazo.value >= 4) {
    p.Precio.value -= p.Precio.value*0.2 ;
  }
  else if (p.Plazo.value >= 3) {
    p.Precio.value -= p.Precio.value*0.15 ;
  }
  else if (p.Plazo.value >= 2) {
    p.Precio.value -= p.Precio.value*0.1 ;
  }
  else {
    p.Precio.value -= p.Precio.value*0.05 ;
  }

  for (var i=0; i < checkboxes.length; i++) {
    if (checkboxes[i].checked) {
      cont += 1;
    }
  }
  p.Precio.value = + p.Precio.value + (cont * 400);
  p.Precio.value += '€';
}

// Función para validar el formulario de presupuesto
function validarPresupuesto(fp) {
  var ok = true;
  var mensaje = '';

  var email = /^(.+\@.+\..+)$/;
  if(!email.test(fp.Email.value)) {
    ok = false;
    mensaje += 'El email no tiene un formato válido\n';
  }

  if(ok == false)
    alert(mensaje);
  return ok;
}

// Función para validar el formulario de contacto
function validarContacto(fc) {
  var ok = true;
  var mensaje = '';

  var email = /^(.+\@.+\..+)$/;
  if(!email.test(fc.Email.value)) {
    ok = false;
    mensaje += 'El email no tiene un formato válido\n';
  }

  var fecha = /^(.+\-.+\-.+)$/;
  if(!fecha.test(fc.Fecha.value)) {
    ok = false;
    mensaje += 'La fecha no tiene un formato válido (dd-mm-aaaa)\n';
  }
  else if(!validarFecha(fc.Fecha.value)) {
    ok = false;
    mensaje += 'La fecha no es correcta\n';
  }

  if(fc.Motivo.value.length<3) {
    ok = false;
    mensaje += 'El motivo de la reunión es demasiado breve\n';
  }

  if(ok == false)
    alert(mensaje);
  return ok;
}

function validarFecha(fechaRecibida){
  var Fecha = new String(fechaRecibida); // Crea un string
  var RealFecha = new Date(); // Para sacar la fecha de hoy
  var Ano = new String( Fecha.substring(Fecha.lastIndexOf("-") + 1, Fecha.length) );
  var Mes = new String( Fecha.substring(Fecha.indexOf("-") + 1, Fecha.lastIndexOf("-")) );
  var Dia = new String(Fecha.substring(0, Fecha.indexOf("-")));
  if (isNaN(Ano) || Ano.length < 4 || parseFloat(Ano) < 1900) {
    return false;
  }
  if (isNaN(Mes) || parseFloat(Mes) < 1 || parseFloat(Mes) > 12) {
    return false;
  }
  if (isNaN(Dia) || parseInt(Dia) < 1 || parseInt(Dia) > 31) {
    return false;
  }
  if (Mes == 4 || Mes == 6 || Mes == 9 || Mes == 11 || Mes == 2)  {
    if ((Mes == 2 && Dia > 28) || Dia > 30) {
      return false;
    }
  }
  return true;
}

// Mapa de OpenstretMap
function pintarMapa() {
  var mimapa = L.map('mapa').setView([37.885442, -4.784491], 15);

  //colocamos la capa del mapa
  L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 18,
    attribution:  'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>'
  }).addTo(mimapa);

  //añadimos un marcador
  L.marker([37.885442, -4.784491], {draggable: false}).addTo(mimapa).bindPopup("<b>AELÓPEZ</b><br>web developer");

  var ruta = L.Routing.control({
    waypoints: [ L.latLng(37.885967, -4.790385), L.latLng(37.885442, -4.784491) ],
    routeWhileDragging: false
  });
  ruta.addTo(mimapa);

  mimapa.on("click", function(e) {
    var pixelPosition = e.layerPoint;
    var latLng = mimapa.layerPointToLatLng(pixelPosition);
    calcularRuta(latLng, mimapa, ruta);
  });

}

// Calcular la ruta en el mapa
function calcularRuta(desde, mimapa, ruta) {
  //añadimos un control de ruta
  var ruta = L.Routing.control({
    waypoints: [ desde, L.latLng(37.885442, -4.784491) ],
    routeWhileDragging: false
  });
  // ruta.addTo(mimapa);
}
