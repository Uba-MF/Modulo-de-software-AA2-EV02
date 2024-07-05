<%@page import="java.util.List"%>
<%@page import="logica.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Head -->
<%@include file="/Components/head.jsp"%>
<!-- Menu -->
<%@include file="/Components/menu.jsp"%>


    <h2 class="tit">Productos registrados en el sistema
        <input id="gfg" type="text" placeholder="Buscar Producto"> </h2> 
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

        <body>
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
   
                    
                        <% List<Producto> listaProducto = (List)request.getSession().getAttribute("listaProductos"); %>
  
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
        
                            <!-- Funciones de editar y eliminar -->
                
                            <td style="text-align:center;">
                                <form name="editar" action="SvEditarPro" method="GET">      
                                    <button type="submit" style="background-color:#ffbb59; color:white; border:1px solid black;">
                                    Editar
                                    </button>
                                    <input type="hidden" name="id" value="<%=pro.getId_producto()%>">
                                </form>
                            </td>
        
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
                    
  
            <!-- Formulario para modificar productos -->  
    

            <div class="contenedorverpro">
                <h2 id="hh">Editar Producto</h2>
                
                    <%Producto pro = (Producto) request.getSession().getAttribute("EditarPro");%>
                    
                    <div id="prueba">
                        
                        <form id="form-da" action="SvEditarPro" method="POST">
                            <input type="text" id="nombre" name="nombre" placeholder="Nombre" value="<%=pro.getNombreProducto()%>">
                            <input type="number" id="precioc" name="precioc"  placeholder="Precio compra" value="<%=pro.getPrecioCompra()%>">
                            <input type="number" id="preciov" name="preciov"  placeholder="Precio venta" value="<%=pro.getPrecioVenta()%>">
                            <input type="number" id="utili" name="utili"  placeholder="Utilidad" value="<%=pro.getUtilidad()%>">
                            <input type="number" id="exist" name="exist" placeholder="Existencia" value="<%=pro.getExistencia() %>">
                    
                            <button id="btn-agregar" type="submit">Actualizar</button>
                        </form>
                    </div>
                        
                        <form action="verProducto.jsp">
                            <button id="btn-cancelar" type="submit">Cancelar</button>
                        </form>
            </div>

<!-- footer -->
<%@include file="/Components/footer.jsp"%>
