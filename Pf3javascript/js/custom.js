
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
  // alert("Bienvenid@s a mi web");
}
