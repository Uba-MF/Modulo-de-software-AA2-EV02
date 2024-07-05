
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Producto;


@WebServlet(name = "SvEditarPro", urlPatterns = {"/SvEditarPro"})
public class SvEditarPro extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        // Traer el id del producto a editar
        int id = Integer.parseInt(request.getParameter("id"));
        
        // Solicita a la controladora que traiga el id de la controladora de persistencia
        // La controladora de persistencia trae el id de la BD
        Producto pro = control.traerProducto(id);
        
        // Crear la session 
        HttpSession misession = request.getSession();
        misession.setAttribute("EditarPro",pro);
        
        // Redirección al jsp con el formulario para modificar
        response.sendRedirect("EditarPro.jsp");
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        // Recibe los datos modificados del formulario
        // Este proceso es similar al de registrar 
        // Trae el id del input con los campos modificados
        String nombre = request.getParameter("nombre"); 
        int precioc = Integer.parseInt(request.getParameter("precioc"));
        int preciov =  Integer.parseInt(request.getParameter("preciov"));
        int utili = Integer.parseInt(request.getParameter("utili"));
        int exist = Integer.parseInt(request.getParameter("exist"));
        
        
        // Recibe los datos modificados y los envía a la controladora lógica
        // La controladora lógica los pasa a la controladora de persistencia 
        // La controladora de persistencia hace los cambios en la BD
        Producto pro = (Producto) request.getSession().getAttribute("EditarPro");
        pro.setNombreProducto(nombre);
        pro.setPrecioCompra(precioc);
        pro.setPrecioVenta(preciov);
        pro.setUtilidad(utili);
        pro.setExistencia(exist);
        
        control.editarProducto(pro);
        
        response.sendRedirect("SvProducto");  
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
