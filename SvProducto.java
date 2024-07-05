
package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Producto;


@WebServlet(name = "SvProducto", urlPatterns = {"/SvProducto"})
public class SvProducto extends HttpServlet {
 
    Controladora control = new Controladora();
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        // Esto nos permite enlistar para despúes mostrar los datos registrados en la BD
        
        List<Producto> listaProducto = new ArrayList<Producto>();
        listaProducto = control.getProductos();
        
        HttpSession misession = request.getSession();
        misession.setAttribute("listaProductos",listaProducto);
        
        response.sendRedirect("verProducto.jsp");
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        // Para enviar los datos del formulario
        
        String nombreProducto = request.getParameter("nombre"); // Este name es el nombre del input en el formulario
        int precioCompra = Integer.parseInt(request.getParameter("precioc"));// Este name es el nombre del input en el formulario
        int precioVenta =  Integer.parseInt(request.getParameter("preciov"));// Este name es el nombre del input en el formulario
        int utilidad = Integer.parseInt(request.getParameter("utili"));// Este name es el nombre del input en el formulario
        int existencia = Integer.parseInt(request.getParameter("exist"));// Este name es el nombre del input en el formulario
        
        // Pasamos los datos a la controladora lógica
        control.crearProducto(nombreProducto,precioCompra,precioVenta,utilidad,existencia);
        
        // Redirecciona al servlet
        response.sendRedirect("SvProducto");
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
