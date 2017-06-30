package it.rh.test;

import static org.junit.Assert.*;

import org.junit.Test;

import it.rh.demo.ProductService;
import it.rh.demo.model.Product;

public class ProductTest {

	@Test
	public void test() {
		ProductService service = new ProductService();
		Product toSave = new Product("1","test", "", "");
		service.save(toSave );
		Product retrieved = service.retrieveById("1");
		assertEquals("Check name", toSave.getDescription(), retrieved.getDescription());
	}

}
