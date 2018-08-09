/*form-actions <script type='text/javascript'>
$(document).ready(function()
{
	/*Menu activo
  function setActive() {
  aObj = document.getElementById('active').getElementsByTagName('a');
  for(i=0;i<aObj.length;i++) { 
    if(document.location.href.indexOf(aObj[i].href)>=0) {
		var c=aObj[i].className;
      	if(c=='btn'){
		aObj[i].className=c+' btn-success active';
		}else
		{
		aObj[i].className=c+' active';
		}
		}
 	 }
	}
	window.onload = setActive;
});
</script>*/
if (typeof(Storage) !== "undefined") {
    var c=localStorage.getItem("CSS-BODY");
    $("body").addClass(c)
} else {

}
$(window).load(function(){
        $('#modal-default').modal('show');
    });

$(document).ready(function()
{

	$.ajaxSetup({
		'beforeSend' : function(xhr) {
			try{
				xhr.overrideMimeType('text/html; charset=iso-8859-1');
				}
				catch(e){
					}
		}});
	
	
	/*muestra el logo cargando validar si es un link normal o uno con ajax*/ 
	/*$('a').click(function(){
		$( ".page-header" ).after("<div style=\"position: absolute;padding-top: 10%;text-align: center;z-index: 1;top: 0;left: 0;right: 0;bottom: 0;\" align=\"center\"><img src=\"/img/ajax-loader1.gif\" /></div>");
		});*/
 	
	
	
	/*validar si es una guia interna o una guia ruc*/
	$('.salida_cambiar').change(function()
	{
		var serie=$(this).val();
		var U = window.location.pathname;
		var U=U.split('/');
		/*para el cambio de ventas internas confecciones*/
		if(jQuery.inArray('hilos',U)>=0){
			switch(serie)
			{
				case '999':
				
				confirm('Esta por cambiar a la serie '+serie+' esta seguro');
				location.href = '/'+U[1]+'/salidasinternas/crearsalidas';
                        break;
				default: alert('La serie indicada no es valida');
                        break;
			}
		}
		if(jQuery.inArray('salidasinternas',U)>=0){
			switch(serie)
			{
				case '002':
				
				confirm('Esta por cambiar a la serie '+serie+' esta seguro');
				location.href = '/'+U[1]+'/hilos/crearsalidas';
                        break;
				default: alert('La serie indicada no es valida');
                        break;
			}
		}
		if(jQuery.inArray('confecciones',U)>=0){
			switch(serie)
			{
				case '002':
				confirm('Esta por cambiar a la serie '+serie+' esta seguro');
				location.href = '/'+U[1]+'/'+U[2]+'/crearsalidas';
                        break;
				case '999':
				
				confirm('Esta por cambiar a la serie '+serie+' esta seguro');
				location.href = '/'+U[1]+'/'+U[2]+'/crearsalida_interna';
                        break;
				default: alert('La serie indicada no es valida');
                        break;
			}
		}
		if(jQuery.inArray('ventasproductos',U)>=0){
			switch(serie)
			{
				case '001':
				confirm('Esta por cambiar a la serie '+serie+' esta seguro');
				location.href = '/'+U[1]+'/'+U[2]+'/crearsalidas';
                        break;
				case '999':
				
				confirm('Esta por cambiar a la serie '+serie+' esta seguro');
				location.href = '/'+U[1]+'/'+U[2]+'/crearsalidas_internas';
                        break;
				default: alert('La serie indicada no es valida');
                        break;
			}
		}
		if(jQuery.inArray('ventasinternas',U)>=0){
			switch(serie)
			{
				case '001':
				confirm('Esta por cambiar a la serie '+serie+' esta seguro');
				location.href = '/'+U[1]+'/ventas/crear_nota';
                        break;
				case '999':
				
				confirm('Esta por cambiar a la serie '+serie+' esta seguro');
				location.href = '/'+U[1]+'/'+U[2]+'/crear_nota';
                        break;
				default: alert('La serie indicada no es valida');
                        break;
			}
		}
		
		if(jQuery.inArray('ventas',U)>=0){
			switch(serie)
			{
				case '001':
				confirm('Esta por cambiar a la serie '+serie+' esta seguro');
				location.href = '/'+U[1]+'/ventas/crear_nota';
                        break;
				case '999':
				
				confirm('Esta por cambiar a la serie '+serie+' esta seguro');
				location.href = '/'+U[1]+'/ventasinternas/crear_nota';
                        break;
				default: alert('La serie indicada no es valida');
                        break;
			}
		}
		
	});
	
	/*VALIDAR los campos con jquery*/
	$('.cost').keyup(function () {
	  this.value = this.value.replace(/[^0-9]/g,'.'); 
	});
	$('.qty').keyup(function () {
	  this.value = this.value.replace(/[^0-9]/g,'.'); 
	});
	
	/*calcular el precio en dolares y en soles */
	
	$("#tesproductos_precio").blur(function(){var v=$(this).val()/$("#cambio_actual").val(); $("#tesproductos_preciod").val(roundNumber(v,2));});
	$("#tesproductos_preciod").blur(function(){var v=$(this).val()*$("#cambio_actual").val(); $("#tesproductos_precio").val(roundNumber(v,2));});
	
	$(function()
	{
	var d = new Date();

	var curr_date = d.getDate();
	
	var curr_month = d.getMonth();
	curr_month=curr_month+1;
	if(curr_month<10)
	{curr_month="0"+curr_month;
	}
	var curr_year = d.getFullYear();
	var fecha=curr_year+"-"+ curr_month + "-" + curr_date;
	$("#testipocambios").find($("#testipocambios_fecha")).val(fecha);
	});
	
//$("span .print").after( '<a href="javascript:;" class="btn botonpdf">Enviar a PDF<i class="icon-file"></i></a>' );

	var cambio = false;
        $('.sidebar-menu li a').each(function(index) {
        //var urls=window.location;
            if(this.href.trim() == window.location){
            	console.log('--1',window.location.pathname)
                $(this).parent().addClass("active");                
                console.log($(this).parent()['0'].dataset.parent_id)
             	$("#"+$(this).parent()['0'].dataset.parent_id).addClass("active");
                cambio = true;
            }
        });
        if(!cambio){
            $('.sidebar-menu li:first').addClass("active");
        }

});
/* FIN DE DOCUMENT READY*/
function roundNumber(number,decimals)
{
  var newString;// The new rounded number
  decimals = Number(decimals);
  if (decimals < 1) {
    newString = (Math.round(number)).toString();
  } else {
    var numString = number.toString();
    if (numString.lastIndexOf(".") == -1) {// If there is no decimal point
      numString += ".";// give it one at the end
    }
    var cutoff = numString.lastIndexOf(".") + decimals;// The point at which to truncate the number
    var d1 = Number(numString.substring(cutoff,cutoff+1));// The value of the last decimal place that we'll end up with
    var d2 = Number(numString.substring(cutoff+1,cutoff+2));// The next decimal, after the last one we want
    if (d2 >= 5) {// Do we need to round up at all? If not, the string will just be truncated
      if (d1 == 9 && cutoff > 0) {// If the last digit is 9, find a new cutoff point
        while (cutoff > 0 && (d1 == 9 || isNaN(d1))) {
          if (d1 != ".") {
            cutoff -= 1;
            d1 = Number(numString.substring(cutoff,cutoff+1));
          } else {
            cutoff -= 1;
          }
        }
      }
      d1 += 1;
    } 
    if (d1 == 10) {
      numString = numString.substring(0, numString.lastIndexOf("."));
      var roundedNum = Number(numString) + 1;
      newString = roundedNum.toString() + '.';
    } else {
      newString = numString.substring(0,cutoff) + d1.toString();
    }
  }
  if (newString.lastIndexOf(".") == -1) {// Do this again, to the new string
    newString += ".";
  }
  var decs = (newString.substring(newString.lastIndexOf(".")+1)).length;
  for(var i=0;i<decimals-decs;i++) newString += "0";
  //var newNumber = Number(newString);// make it a number if you like

  return newString; // Output the result to the form field (change for your purposes)
}
$(function(){
	$('.menu_lateral li a').click(function(event){
		var elem = $(this).next();
		if(elem.is('ul')){
			event.preventDefault();
			$('.menu_lateral ul:visible').not(elem).slideUp();
			elem.slideToggle();
		}
	});

/*/box box-primary*/
$(function() {
	
	$('.print_reporte').click(function() {
		$('div.reporte').printArea();
		return false;
	});
	
});

$(function() {
	
	$('.print_h').click(function() {
		$('div.hoja').printArea();
		return false;
	});
	
});
$(function() {
	
	$('.print').click(function() {
		$('div.page').printArea();
		return false;
	});
	
});



});
/*Fin de READY*/
/* DOCUMENTO EN WORD*//*
function myFunctionWord() {
    window.open("http://"+document.domain+"/utiles/word", "_blank", "toolbar=NO, scrollbars=yes, resizable=yes, top=100, left=250, width=600, height=400");
}*/
//cali rojas
//lewebmonster.com
$(function(){
//funcion para buscar en una tabla con jQuery
	$.fntBuscarEnTabla=function(strCadena,strIDdeTabla)
	{
		//seleccionamos la tabla en la que vamos a buscar
		var $objTabla=$('#'+strIDdeTabla);
		//eliminamos la fila temporal que contiene una leyenda cuando
		//la busqueda no devuelve resultados
		$objTabla.find('#trFilaConMensaje').remove();
		
		//iteramos en todas las filas del body de la tabla
		$objTabla.find('tbody tr').each(function(iIndiceFila,objFila)
		{
	    	//obtenemos todas las celdas de la fila
	        var $objCeldas=$(objFila).find('td');
	        
	        //verificamos que la fila tenga celdas
	        if($objCeldas.length>0){
				var blnLaCadenaExiste=false;
				//recorremos todas las celdas de la fila actual
	            $objCeldas.each(function(iIndiceCelda,objCeldaFila){
	            	//limpiamos la cadena que el usuario esta buscando (de caracteres que puedan chocar con
	            	//codigo JavaScript, lo cual genera un error en runtime)
					var objRegEx=new RegExp(RegExp.escape(strCadena),'i');
					//comparamos si la cadena buscada esta en la celda
					if(objRegEx.test($(objCeldaFila).text())){
						//indicamos que hemos encontrado la cadena
						blnLaCadenaExiste=true;
						//salimos del bucle (el de las celdas o columnas)
						return false;
					}
				});
				//si la cadena fue encontrada, entonces mostramos el contenido de la fila,
				//sino, se oculta la fila por completo
				if(blnLaCadenaExiste===true)$(objFila).show();else $(objFila).hide();
			}
		});
	    
		
	    //si no hay resultados agregamos una fila temporal para decirle al usuario que
	    //no hemos encontrado lo que busca
		if($objTabla.find('tbody tr:visible').length==0){
			//obtenemos la cantidad de columnas para hacer un colspan
			var iColumnas=$objTabla.find('tbody tr:first-child td').length;
			//agregamos al cuerpo de la tabla la fila con el mensaje			
				$('<tr>',{
					id: 'trFilaConMensaje'
				}).append(
					//agregamos a la fila una celda con el mensaje
					$('<td>',{
						colspan: iColumnas,
						align: 'center',
						html: '<em>No hay resultados, intente otra b&uacute;squeda</em>'
					})
				).appendTo($objTabla.find('tbody'));
		}
	}
	
//extendemos RegEx y agregamos un metodo que nos permita limpiar los caracteres
//que el usuario busca en la tabla, esto es para evitar errores de sintaxis en
//tiempo de ejecucion
	RegExp.escape=function(strCadena){
		var strCaracteresEspeciales=new RegExp("[.*+?|()\\[\\]{}\\\\]", "g");
		//devolvemos la cadena limpia
		return strCadena.replace(strCaracteresEspeciales, "\\$&");
	};
	
//hacemos la busqueda en el evento search del control de busqueda
	$('#txtBuscar').on('search',function(){
		//le decimos a la funcion que busque en la tabla tblTabla el
		//valor que contiene el campo actual
		$.fntBuscarEnTabla($(this).val(),'tblTabla');
		
	});
});


 /*Menu activo*/
/*function setActive()
{
  if(document.getElementById('active')){
  aObj = document.getElementById('active').getElementsByTagName('a');
  //alert(aObj);
  for(i=0;i<aObj.length;i++)
  { 
    if(document.location.href.indexOf(aObj[i].href)>=0)
	{ 
	//alert(aObj[i].className);
		var c=aObj[i].className;
      	if(c=='btn')
		{
		//alert('btn');
		aObj[i].className=c+' btn-success active';
		}else
		{
		//alert('active');
		aObj[i].className=c+' active';
		}
	}
   }
  }
}
window.onload = setActive;*/