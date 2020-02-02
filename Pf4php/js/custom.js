
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
cargarContenido('noticias.php');

});

/* Funcion de carga asíncrona del contenido principal de la página */
function cargarContenido(seccion, nombrefuncion){
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
                                               if (nombrefuncion) {
                                                 nombrefuncion();
                                               }
                                             }
                                           }
  objHttp.send(null);
}

function activarItem(id) {
  $('.activo').removeClass('activo');
  $('#'+id).addClass('activo');
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

  //control para calcular la ruta Hasta el destino
  var ruta = L.Routing.control({
    waypoints: [ null, L.latLng(37.885442, -4.784491)],
    routeWhileDragging: false,
    addWaypoints: true,
    draggableWaypoints: true,
    geocoder: L.Control.Geocoder.nominatim()
  });
  ruta.addTo(mimapa);
}

// Funcion para cargar los datos del proyecto a editar
function cargarDatosProyecto(idproyecto){
  var objHttp=null;
  if(window.XMLHttpRequest) { objHttp = new XMLHttpRequest(); }
  else if(window.ActiveXObject) { objHttp = new ActiveXObject("Microsoft.XMLHTTP"); }
  objHttp.open("GET", "cargarDatosProyecto.php?id="+idproyecto, true);
  objHttp.onreadystatechange = function() {
    if (objHttp.readyState==4 && objHttp.status==200) {
      var objProyecto = JSON.parse(objHttp.responseText);
      document.getElementById('form-title').innerHTML = "Actualizar proyecto seleccionado";
      document.getElementById('p-idproyecto').value = objProyecto.idproyecto;
      document.getElementById('p-nombre').value = objProyecto.nombre;
      document.getElementById('p-altimagen').value = objProyecto.altimg;
      document.getElementById('p-datos').value = objProyecto.datos;
      document.getElementById('p-tecnologia').value = objProyecto.tecnologia;
      document.getElementById('p-tiempo').value = objProyecto.tiempo;
    }
  }
  objHttp.send(null);
}

// Funcion para guardar los datos del proyecto en la bbdd
function guardarProyecto(){
  var datap = new FormData();
  var idproyecto = document.getElementById('p-idproyecto').value;
  var nombre = document.getElementById('p-nombre').value;
  var nombreimagen = '';
  var uploadfile = document.getElementById('p-imagen').files[0];
  if (uploadfile) {
    datap.append('fileimg', uploadfile);
    nombreimagen = uploadfile.name;
  }
  var altimg = document.getElementById('p-altimagen').value;
  var datos = document.getElementById('p-datos').value;
  var tecnologia = document.getElementById('p-tecnologia').value;
  var tiempo = document.getElementById('p-tiempo').value;
  // var url = "guadarDatosProyecto.php?idproyecto="+idproyecto+"&nombre="+nombre+"&imagen="+nombreimagen+"&altimg="+altimg+"&datos="+datos+"&tecnologia="+tecnologia+"&tiempo="+tiempo;
  var url = "guadarDatosProyecto.php";

  datap.append('idproyecto', idproyecto);
  datap.append('nombre', nombre);
  datap.append('imagen', nombreimagen);
  datap.append('altimg', altimg);
  datap.append('datos', datos);
  datap.append('tecnologia', tecnologia);
  datap.append('tiempo', tiempo);

  var objHttp=null;
  if(window.XMLHttpRequest) { objHttp = new XMLHttpRequest(); }
  else if(window.ActiveXObject) { objHttp = new ActiveXObject("Microsoft.XMLHTTP"); }
  objHttp.open("POST", url, true);
  // objHttp.setRequestHeader("X-File-Name", encodeURIComponent(nombreimagen));
  // objHttp.setRequestHeader("Content-Type", "multipart/form-data");
  objHttp.onreadystatechange = function() {
    if (objHttp.readyState==4 && objHttp.status==200) {
      document.getElementById('result').innerHTML = objHttp.responseText;
      setTimeout('cargarContenido("aproyectos.php");$(window).scrollTop(300);',3500);
    }
  }
  objHttp.send(datap);
}

// Función para procesar el registro de usuarios
function procesarRegistro(userForm) {
  var email = /^(.+\@.+\..+)$/;
  if(!email.test(document.getElementById('u-username').value)) {
    document.getElementById('u-result').innerHTML = 'El usuario debe ser un email con formato válido';
    limpiarFormularioUsuario();
  }
  else { // si el nombre de usuario es un email váilido se agrega a la bbdd
    nuevoUsuario();
  }
}

// Funcion para agregar nuevos usuarios a la bbdd
function nuevoUsuario(){
  var datau = new FormData();
  var username = document.getElementById('u-username').value;
  var pass = document.getElementById('u-pass').value;
  var url = "crearNuevoUsuario.php";

  datau.append('username', username);
  datau.append('pass', pass);

  var objHttp=null;
  if(window.XMLHttpRequest) { objHttp = new XMLHttpRequest(); }
  else if(window.ActiveXObject) { objHttp = new ActiveXObject("Microsoft.XMLHTTP"); }
  objHttp.open("POST", url, true);
  objHttp.onreadystatechange = function() {
    if (objHttp.readyState==4 && objHttp.status==200) {
      document.getElementById('u-result').innerHTML = objHttp.responseText;
      limpiarFormularioUsuario();
    }
  }
  objHttp.send(datau);
}

// Funcion para limpiar formulario de acceso y reistro de usuarios
function limpiarFormularioUsuario(){
  document.getElementById('u-username').value = '';
  document.getElementById('u-pass').value = '';
}

// Funcion de login para usuarios
function accesoUsuario(){
  var datau = new FormData();
  var username = document.getElementById('u-username').value;
  var pass = document.getElementById('u-pass').value;
  var url = "loginUsuario.php";

  datau.append('username', username);
  datau.append('pass', pass);

  var objHttp=null;
  if(window.XMLHttpRequest) { objHttp = new XMLHttpRequest(); }
  else if(window.ActiveXObject) { objHttp = new ActiveXObject("Microsoft.XMLHTTP"); }
  objHttp.open("POST", url, true);
  objHttp.onreadystatechange = function() {
    if (objHttp.readyState==4 && objHttp.status==200) {
      document.getElementById('u-result').innerHTML = objHttp.responseText;
      window.location = "index.php";
    }
    else if (objHttp.status==401) {
      document.getElementById('u-result').innerHTML = objHttp.responseText;
      setTimeout('limpiarFormularioUsuario()',2500);
    }
  }
  objHttp.send(datau);
}

// Funcion para modificar datos de clientes de la bbdd
function editarDatosPersonales(){
  var datac = new FormData();
  var idcliente = document.getElementById('c-idcliente').value;
  var nombre = document.getElementById('c-nombre').value;
  var apellidos = document.getElementById('c-apellidos').value;
  var telefono = document.getElementById('c-telefono').value;
  var url = "guadarDatosCliente.php";

  datac.append('idcliente', idcliente);
  datac.append('nombre', nombre);
  datac.append('apellidos', apellidos);
  datac.append('telefono', telefono);

  var objHttp=null;
  if(window.XMLHttpRequest) { objHttp = new XMLHttpRequest(); }
  else if(window.ActiveXObject) { objHttp = new ActiveXObject("Microsoft.XMLHTTP"); }
  objHttp.open("POST", url, true);
  objHttp.onreadystatechange = function() {
    if (objHttp.readyState==4 && objHttp.status==200) {
      document.getElementById('c-result').innerHTML = objHttp.responseText;
    }
  }
  objHttp.send(datac);
}
// Funcion para cerrar sesion de usuario
function cerrarSesion(){
  var url = "cerrarSesion.php";

  var objHttp=null;
  if(window.XMLHttpRequest) { objHttp = new XMLHttpRequest(); }
  else if(window.ActiveXObject) { objHttp = new ActiveXObject("Microsoft.XMLHTTP"); }
  objHttp.open("POST", url, true);
  objHttp.onreadystatechange = function() {
    if (objHttp.readyState==4 && objHttp.status==200) {
      location.reload();
    }
  }
  objHttp.send(null);
}
