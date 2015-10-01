package yeamgood.repository;

import org.springframework.data.repository.CrudRepository;
import yeamgood.model.Unit;

import java.util.List;

public interface UnitRepository extends CrudRepository<Unit, Integer> {
    List<Unit> findAllByActive(String acrive);
}
