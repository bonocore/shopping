package it.rh.demo;

import java.util.logging.Logger;


import it.rh.demo.model.Product;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;


public class ProductService implements Serializable {

	private static Logger log = Logger.getLogger(ProductService.class.getName());

	private Hashtable<String,Product> productRepo;
	
	public ProductService() {
		
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



	public void save(Product toSave) {
		
		log.info("Saving object: "+toSave);
		
		productRepo.put(toSave.getId(),toSave);
		
	}
	
	
	
	private void populateRepo() {
		
		if(productRepo == null)
		{
			productRepo = new Hashtable<String,Product>();
			productRepo.put("1", new Product("1","My wonderful product 1","0,065 e/kWh","fa-plug"));
			productRepo.put("2", new Product("2","My wonderful product 2","0,0389 e/kWh","fa-bolt"));
			productRepo.put("3", new Product("3","My wonderful product 3","0,065 e/kWh","fa-thumbs-o-up"));
			productRepo.put("4", new Product("4","My wonderful product 4","4e / Mese","fa-wrench"));
			productRepo.put("5", new Product("5","My wonderful product 5","8.99e / Mese","fa-fire"));
			productRepo.put("6", new Product("6","My wonderful product 6","6.99e / Mese","fa-power-off"));
			productRepo.put("7", new Product("7","My wonderful product 7","8.99e / Mese","fa-tachometer"));
		}
	}
	
}
