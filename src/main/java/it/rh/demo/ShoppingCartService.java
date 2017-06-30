package it.rh.demo;

import java.util.logging.Logger;

import javax.ws.rs.Path;

import it.rh.demo.model.Product;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Random;

public class ShoppingCartService implements Serializable {

	private static Logger log = Logger.getLogger(ShoppingCartService.class.getName());

	private Hashtable<String,Product> productRepo;
	
	public ShoppingCartService() {
		
		populateRepo();
	}

	
	
	public List<Product> list() {
		log.info("Listing all products....");
		return new ArrayList<Product>(productRepo.values());
	}

	public Product retrieveById(String id) {
		log.info("Getting product by id "+id);
		try{
			Product toRet = productRepo.get(id);
			log.info("Returning product: "+toRet);
			return toRet;
		}catch (NumberFormatException e) {
			log.warning(e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

	public void deleteById(String id) {
		log.info("Deleting product by id "+id);
		productRepo.remove(id);
	}
	
  public void save(String id, Product toSave) throws Exception {
			
		
		if(!id.equalsIgnoreCase(toSave.getId()))
		{
				log.warning("Object id does not match: "+id+" - "+toSave);
				toSave.setId(id);
		}
		
		save(toSave);
	}

  public void clean() {
		
		log.info("Cleaning all");
		
		productRepo.clear();
		
	}

	public void save(Product toSave) {
		
		log.info("Saving object: "+toSave);
		
		productRepo.put(toSave.getId(),toSave);
		
	}
	
	private void populateRepo() {
		
		if(productRepo == null)
		{
			productRepo = new Hashtable<String,Product>();
		}
	}
	
}
