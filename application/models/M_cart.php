<?php
class M_cart extends CI_Model {

    public function get_products_by_seller($buyer_name, $store_name) {
        $this->db->select('ci.cart_item_id, ci.product_id, ci.quantity, ci.total_price, p.product_name, p.product_price, p.product_img, s.store_name, s.store_address, s.bank_num, s.bank_type');
        $this->db->from('carts c');
        $this->db->join('cart_items ci', 'c.cart_id = ci.cart_id');
        $this->db->join('products p', 'ci.product_id = p.product_id');
        $this->db->join('sellers s', 'p.seller_name = s.seller_name');
        $this->db->where('c.buyer_name', $buyer_name);
        $this->db->where('s.store_name', urldecode($store_name));  // Menggunakan store_name dari seller
        return $this->db->get()->result_array();
    }
    public function get_cart_by_seller($buyer_name, $store_name) {
        $this->db->select('cart_items.*, products.product_name, products.product_price, products.product_img, sellers.seller_name, sellers.store_address, sellers.bank_num, sellers.bank_type');
        $this->db->from('cart_items');
        $this->db->join('products', 'products.product_id = cart_items.product_id');
        $this->db->join('sellers', 'sellers.seller_name = products.seller_name'); // Join dengan tabel sellers menggunakan seller_name
        $this->db->join('carts', 'carts.cart_id = cart_items.cart_id');
        $this->db->where('carts.buyer_name', $buyer_name);
        $this->db->where('sellers.store_name', $store_name);  // Menggunakan store_name dari tabel sellers
        return $this->db->get()->result_array();
    }
    
    
    public function get_cart($buyer_name) {
        $this->db->select('c.cart_id, ci.cart_item_id, ci.product_id, ci.quantity, ci.total_price, p.product_name, p.product_price, p.product_img, s.store_name');
        $this->db->from('carts c');
        $this->db->join('cart_items ci', 'c.cart_id = ci.cart_id');
        $this->db->join('products p', 'ci.product_id = p.product_id');
        $this->db->join('sellers s', 'p.seller_name = s.seller_name');
        $this->db->where('c.buyer_name', $buyer_name);
        return $this->db->get()->result_array();
    }

    public function get_cart_items_by_seller($buyer_name, $seller_name) {
        $this->db->select('ci.cart_item_id, ci.product_id, ci.quantity, ci.total_price, p.product_name, p.product_price');
        $this->db->from('cart_items ci');
        $this->db->join('products p', 'ci.product_id = p.product_id');
        $this->db->join('carts c', 'c.cart_id = ci.cart_id');
        $this->db->where('c.buyer_name', $buyer_name);
        $this->db->where('p.seller_name', $seller_name);
        return $this->db->get()->result_array();
    }
    
    public function get_seller_data($store_name) {
        return $this->db->get_where('sellers', ['store_name' => $store_name])->row_array();
    }

    public function add_to_cart($buyer_name, $product_id, $quantity, $product_price) {
        $cart = $this->db->get_where('carts', ['buyer_name' => $buyer_name])->row_array();
        if (!$cart) {
            $this->db->insert('carts', ['buyer_name' => $buyer_name]);
            $cart_id = $this->db->insert_id();
        } else {
            $cart_id = $cart['cart_id'];
        }

        $item = $this->db->get_where('cart_items', ['cart_id' => $cart_id, 'product_id' => $product_id])->row_array();

        if ($item) {
            $new_quantity = $item['quantity'] + $quantity;
            $this->db->set('quantity', $new_quantity);
            $this->db->set('total_price', $new_quantity * $product_price);
            $this->db->where('cart_item_id', $item['cart_item_id']);
            $this->db->update('cart_items');
        } else {
            $data = [
                'cart_id' => $cart_id,
                'product_id' => $product_id,
                'quantity' => $quantity,
                'total_price' => $quantity * $product_price
            ];
            $this->db->insert('cart_items', $data);
        }
    }

    public function get_buyer_data($buyer_name) {
        return $this->db->get_where('buyers', ['buyer_name' => $buyer_name])->row_array();
    }

    public function create_transaction($buyer_name, $store_name, $total_price, $status) {
        // Menambahkan transaksi ke tabel transactions
        $data = [
            'buyer_name' => $buyer_name,
            'seller_name' => $store_name,
            'total_price' => $total_price,
            'status' => $status,
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s'),
        ];

        $this->db->insert('transactions', $data);
        return $this->db->insert_id(); // Mengembalikan transaction_id
    }
    public function add_items_to_transaction($transaction_id, $items) {
        $data = [];
        foreach ($items as $item) {
            $data[] = [
                'transaction_id' => $transaction_id,
                'product_id' => $item['product_id'],
                'quantity' => $item['quantity'],
                'total_price' => $item['total_price']
            ];
        }
        // Menambahkan data transaksi item ke tabel transaction_items
        $this->db->insert_batch('transaction_items', $data);
    }
    public function update_quantity($cart_item_id, $quantity) {
        $this->db->select('p.product_price');
        $this->db->from('cart_items ci');
        $this->db->join('products p', 'ci.product_id = p.product_id');
        $this->db->where('ci.cart_item_id', $cart_item_id);
        $product = $this->db->get()->row_array();

        if ($product) {
            $total_price = $product['product_price'] * $quantity;
            $this->db->set('quantity', $quantity);
            $this->db->set('total_price', $total_price);
            $this->db->where('cart_item_id', $cart_item_id);
            $this->db->update('cart_items');
        }
    }

    public function remove_item($cart_item_id) {
        $this->db->delete('cart_items', ['cart_item_id' => $cart_item_id]);
    }
}

?>