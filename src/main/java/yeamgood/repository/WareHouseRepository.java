package yeamgood.repository;

import org.springframework.data.repository.CrudRepository;
import yeamgood.model.WareHouse;

import java.util.List;

public interface WareHouseRepository extends CrudRepository<WareHouse, Integer> {
    List<WareHouse> findAllByActive(String active);
}
