package it.rh.demo;

import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import it.rh.demo.model.Product;


@Path("/")
public class ShoppingCartEndpoint {
	private static Logger log = Logger.getLogger(ShoppingCartEndpoint.class.getName());
	
	  
    @Context 
	HttpServletRequest request;
    
    private static final String REPO_SESSION_KEY = "cartRepo";
    private static final String PROD_REPO_SESSION_KEY= "prodRepo";
    @GET
    @Path("/shoppingCart")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Product> list() {
    	 log.info(request.getSession(true).getId()+" Listing all products.... ");   		
         return getShoppingCartService().list();
    }
    
    @GET
    @Path("/shoppingCart/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Product retrieveById(@PathParam("id") String id) {
    	    		
         return getShoppingCartService().retrieveById(id);
    }
    
    @POST
    @Path("/shoppingCart")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public List<Product> save(Product toSave) throws Exception {
    	getShoppingCartService().save(toSave);
    	return getShoppingCartService().list();
      
    }
    
    @POST
    @Path("/shoppingCart/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public List<Product> save(@PathParam("id") String id) throws Exception {
    	
    	getShoppingCartService().save(id,getProductService().retrieveById(id));
    	return getShoppingCartService().list();
      
    }
    @DELETE
    @Path("/shoppingCart")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Product>  deleteById(Product toSave) {
    	 
    	getShoppingCartService().deleteById(toSave.getId());
         return getShoppingCartService().list();
    }
    
    @DELETE
    @Path("/shoppingCart/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Product>  deleteById(@PathParam("id") String id) {
    	 
    	getShoppingCartService().deleteById(id);
         return getShoppingCartService().list();
    }
    
    @GET
    @Path("/shoppingCart/clean")
    @Produces(MediaType.APPLICATION_JSON)
    public  List<Product>  clean() {
    	 log.info(request.getSession(true).getId()+" Removing all products.... ");   		
         getShoppingCartService().clean();
         return null;
    }
    
    private ShoppingCartService getShoppingCartService() {
		if(request.getSession(true).getAttribute(REPO_SESSION_KEY) == null)
		{
			log.info(request.getSession(true).getId()+" Starting new session");   		
			request.getSession(true).setAttribute(REPO_SESSION_KEY, new ShoppingCartService() );
		}
		return (ShoppingCartService)request.getSession(true).getAttribute(REPO_SESSION_KEY);
	}
    private ProductService getProductService() {
		return new ProductService();
	}
}
