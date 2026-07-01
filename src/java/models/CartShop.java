/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.HashMap;

/**
 *
 * @author HUNG NGHI
 */
import java.util.HashMap;
import java.util.Map;

public class CartShop {
    private HashMap<String, Integer> items;

    public CartShop() {
        items = new HashMap<>();
    }

    public HashMap<String, Integer> getItems() {
        return items;
    }

    public void setItems(HashMap<String, Integer> items) {
        this.items = items;
    }

    // Thêm sản phẩm vào giỏ
    public void add(String prdId) {
        if (items.containsKey(prdId)) {
            items.put(prdId, items.get(prdId) + 1);
        } else {
            items.put(prdId, 1);
        }
    }

    // Xóa hẳn 1 sản phẩm khỏi giỏ
    public void remove(String prdId) {
        items.remove(prdId);
    }

    // Tăng số lượng
    public void increaseQ(String prdId) {
        if (items.containsKey(prdId)) {
            items.put(prdId, items.get(prdId) + 1);
        } else {
            items.put(prdId, 1);
        }
    }

    // Giảm số lượng, nếu còn 1 thì xóa luôn
    public void decreaseQ(String prdId) {
        if (items.containsKey(prdId)) {
            int quantity = items.get(prdId);
            if (quantity > 1) {
                items.put(prdId, quantity - 1);
            } else {
                items.remove(prdId);
            }
        }
    }

    // Tổng số lượng sản phẩm trong giỏ
    public int getTotalQuantity() {
        int total = 0;
        for (int quantity : items.values()) {
            total += quantity;
        }
        return total;
    }

    // Tính tổng tiền
    public int calculateValue() {
        int kq = 0;
        ProductsJpaController pj = new ProductsJpaController();

        for (Map.Entry<String, Integer> entry : items.entrySet()) {
            String prdId = entry.getKey();
            int quantity = entry.getValue();

            Products p = pj.findProducts(Integer.parseInt(prdId));
            if (p != null) {
                int price = p.getDiscountPrice().intValue();
               kq += price * quantity;
            }
        }
        return kq;
    }

    // Xóa toàn bộ giỏ hàng
    public void clear() {
        items.clear();
    }

    // Kiểm tra giỏ hàng rỗng
    public boolean isEmpty() {
        return items.isEmpty();
    }
}