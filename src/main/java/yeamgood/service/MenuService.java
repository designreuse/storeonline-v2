package yeamgood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yeamgood.data.MenuList;
import yeamgood.model.Menu;
import yeamgood.repository.MenuRepository;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class MenuService {

    @Autowired
    private MenuRepository menuRepository;

    public Menu findOne(int id){
        return menuRepository.findOne(id);
    }

    public List<Menu> findAll(){
        return (List<Menu>) menuRepository.findAll();
    }

    public void save(Menu menu){
        menuRepository.save(menu);
    }

    public  void delete(Menu menu){
        menuRepository.delete(menu);
    }

    public List<Menu> findAllByLayerLevelAndActiveOrderBySeqAsc(String layerLevel,String active){
        return menuRepository.findAllByLayerLevelAndActiveOrderBySeqAsc(layerLevel,active);
    }

    public List<Menu> findAllByLayerLevelAndParentIdAndActiveOrderBySeqAsc(String layerLevel,String parentId,String active){
        return menuRepository.findAllByLayerLevelAndParentIdAndActiveOrderBySeqAsc(layerLevel,parentId,active);
    }

    public List<MenuList> getMenuViewList() {
        List<MenuList> menuList = new ArrayList<MenuList>();
        String active = "yes";
        String layerLevelMain = "main";
        String layerLevelSub1 = "sub1";
        String layerLevelSub2 = "sub2";
        String parentId = new String();

        MenuList mainMenuTemp, sub1MenuTemp, sub2MenuTemp;
        List<MenuList> sub1MenuListTemp;
        List<MenuList> sub2MenuListTemp;
        List<Menu> menuMainListQuery;
        List<Menu> menuSub1ListQuery;
        List<Menu> menuSub2ListQuery;

        menuMainListQuery = findAllByLayerLevelAndActiveOrderBySeqAsc(layerLevelMain, active);
        for (Menu menuTmp : menuMainListQuery) {
            mainMenuTemp = new MenuList();
            mainMenuTemp.setMenu(menuTmp);

            parentId = String.valueOf(menuTmp.getId());
            menuSub1ListQuery = findAllByLayerLevelAndParentIdAndActiveOrderBySeqAsc(layerLevelSub1, parentId, active);
            sub1MenuListTemp = new ArrayList<MenuList>();
            for (Menu menuSub1Temp : menuSub1ListQuery) {
                sub1MenuTemp = new MenuList();
                sub1MenuTemp.setMenu(menuSub1Temp);

                parentId = String.valueOf(menuSub1Temp.getId());
                menuSub2ListQuery = findAllByLayerLevelAndParentIdAndActiveOrderBySeqAsc(layerLevelSub2, parentId, active);
                sub2MenuListTemp = new ArrayList<MenuList>();
                for (Menu menuSub2Temp : menuSub2ListQuery) {
                    sub2MenuTemp = new MenuList();
                    sub2MenuTemp.setMenu(menuSub2Temp);
                    sub2MenuListTemp.add(sub2MenuTemp);
                }

                sub1MenuTemp.setMenuList(sub2MenuListTemp);
                sub1MenuListTemp.add(sub1MenuTemp);
            }
            mainMenuTemp.setMenuList(sub1MenuListTemp);
            menuList.add(mainMenuTemp);
        }
        return menuList;
    }

}
