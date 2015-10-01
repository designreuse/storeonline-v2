package yeamgood.data;

import yeamgood.model.Menu;

import java.util.List;

public class MenuList {

    private Menu menu;
    private List<MenuList> menuList;

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }

    public List<MenuList> getMenuList() {
        return menuList;
    }

    public void setMenuList(List<MenuList> menuList) {
        this.menuList = menuList;
    }
}
