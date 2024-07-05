<%@page import="java.util.List"%>

<%@page import="logica.Producto"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Head -->
<%@include file="/Components/head.jsp"%>
<!-- Menu -->
<%@include file="/Components/menu.jsp"%>
 <!doctype html>
 

     <h2 class="tit">Productos registrados en el sistema
         
         <!--Filtro de la tabla -->                                                        
        <input id="gfg" type="text" placeholder="Buscar Producto">
     </h2> 
     <script>
            $(document).ready(function() {
                $("#gfg").on("keyup", function() {
                    var value = $(this).val().toLowerCase();
                    $("#geeks tr").filter(function() {
                        $(this).toggle($(this).text()
                        .toLowerCase().indexOf(value) > -1)
                    });
                });
            });
     </script>
     
    
     
     <div style="width:130%;overflow-y:auto;height:400px; padding-left: 10px;">
        <table style="width:100%" cellspacing="0" id="miTabla"> 
            <thead>
                 <tr>
                    <th style="color:white;">Id</th>
                    <th style="color:white;">Nombre</th>
                    <th style="color:white;">Precio compra</th>
                    <th style="color:white;">Precio venta</th>
                    <th style="color:white;">Utilidad</th>
                    <th style="color:white;">Existencia</th>
                    <th style="color:white;">Editar</th>
                    <th style="color:white;">Eliminar</th>
                </tr>
            </thead>
   
              <% 
                 List<Producto> listaProducto = (List)request.getSession().getAttribute("listaProductos"); 
              %>
  
            <tbody id="geeks">
             <!-- Se realiza un ciclo for que recorra la tabla producto en la BD y los muestre en la tabla del jsp  -->
             
             <% for(Producto pro:listaProducto){ %>
             
                <tr>
                    <td style="text-align:center;"><%=pro.getId_producto()%></td>
                    <td style="text-align:center;"><%=pro.getNombreProducto()%></td>
                    <td style="text-align:center;"><%=pro.getPrecioCompra()%></td>
                    <td style="text-align:center;"><%=pro.getPrecioVenta()%></td>
                    <td style="text-align:center;"><%=pro.getUtilidad()%></td>
                    <td style="text-align:center;"><%=pro.getExistencia()%></td>
        
            <!-- Funciones para editar -->
            
                    <td style="text-align:center;">
                        <form name="editar" action="SvEditarPro" method="GET">      
                            <button type="submit" style="background-color:#ffbb59; color:white; border:1px solid black;cursor:pointer;">
                             Editar
                            </button>
                            <input type="hidden" name="id" value="<%=pro.getId_producto()%>">
                        </form>
                    </td>
                    
            <!-- Funciones para eliminar -->
            
                    <td style="text-align:center;">
                        <form name="eliminar" action="SvEliminarPro" method="POST">      
                            <button type="submit" style="background-color:#ec4747; color:white; border:1px solid black;cursor:pointer;">
                            Eliminar
                            </button>
                            <input type="hidden" name="id" value="<%=pro.getId_producto()%>">
                        </form>
                    </td>
                </tr>
              <%}%>
            </tbody>
        </table>
    </div>


            <!-- Formulario para ingresar productos -->
    
    <div class="contenedorverpro">
        <h2 id="hh">Registro de Productos</h2>
            <div id="prueba">
                
                <form id="form-da" action="SvProducto" method="POST">
                    <input type="text"  name="nombre" placeholder="Nombre" required>
                    <input type="number" name="precioc" id="caja1" placeholder="Precio compra" required>
                    <input type="number"  name="preciov" id="caja2" placeholder="Precio venta" required>
                    <input type="number" name="utili" id="caja3" placeholder="Utilidad" required>
                    
                    <!-- Script para restar los primeros inputs -->
                    <script>
                            let precio1 = document.getElementById("caja1")
                            let precio2 = document.getElementById("caja2")
                            let precio3 = document.getElementById("caja3")
        
                            precio2.addEventListener("change", () => {
                            precio3.value = parseFloat(precio2.value) - parseFloat(precio1.value)

                            })
                    </script>
                    
                    <input type="number" name="exist" placeholder="Existencia" required>
                    
                    <button id="btn-agregar" type="submit">Agregar</button>
                </form>
            </div>

            <form action="tienda.jsp">
                <button id="btn-cancelar" type="submit">Regresar</button>
            </form>
    </div>
            
<!-- footer -->
<%@include file="/Components/footer.jsp"%>
