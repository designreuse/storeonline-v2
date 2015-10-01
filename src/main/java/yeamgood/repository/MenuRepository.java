package yeamgood.repository;

import org.springframework.data.repository.CrudRepository;
import yeamgood.model.Menu;

import java.util.List;


public interface MenuRepository  extends CrudRepository<Menu, Integer> {
    List<Menu> findAllByLayerLevelAndActiveOrderBySeqAsc(String layerLevel,String active);

    List<Menu> findAllByLayerLevelAndParentIdAndActiveOrderBySeqAsc(String layerLevel,String ParentId,String active);
}
