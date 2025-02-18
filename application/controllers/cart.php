<?php
class Cart extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('M_cart');
    }

    public function index() {
        $buyer_name = $this->session->userdata('buyer_name');
        $data['cart_items'] = $this->M_cart->get_cart($buyer_name);

        // Menghitung total harga per toko
        $total_per_seller = [];
        foreach ($data['cart_items'] as $item) {
            if (!isset($total_per_seller[$item['store_name']])) {
                $total_per_seller[$item['store_name']] = 0;
            }
            $total_per_seller[$item['store_name']] += $item['total_price'];
        }

        $data['total_per_seller'] = $total_per_seller;
        $this->load->view('cart', $data);
        $this->load->view('template/footer');
    }

    public function add() {
        $buyer_name = $this->session->userdata('buyer_name');
        $product_id = $this->input->post('product_id');
        $quantity = 1;
        $product_price = $this->input->post('product_price');

        $this->M_cart->add_to_cart($buyer_name, $product_id, $quantity, $product_price);
        $this->session->set_flashdata('message', 'Produk berhasil ditambahkan ke keranjang.');
        redirect('cart');
    }

    public function update() {
        $cart_item_id = $this->input->post('cart_item_id');
        $quantity = $this->input->post('quantity');
        $this->M_cart->update_quantity($cart_item_id, $quantity);
        redirect('cart');
    }

    public function remove($cart_item_id) {
        $this->M_cart->remove_item($cart_item_id);
        redirect('cart');
    }

    public function checkout($store_name) {
        $buyer_name = $this->session->userdata('buyer_name');
        $items = $this->M_cart->get_cart_by_seller($buyer_name, urldecode($store_name));

        if (!empty($items)) {
            $this->session->set_userdata('checkout_items', $items);
            $this->session->set_userdata('store_name', $store_name);
            redirect('checkout/index');
        } else {
            $this->session->set_flashdata('error', 'Keranjang kosong.');
            redirect('cart');
        }
    }

    public function confirm_purchase($store_name) {
        $buyer_name = $this->session->userdata('buyer_name');
        $total_price = $this->input->post('total_price');

        $items = $this->M_cart->get_cart_items_by_seller($buyer_name, urldecode($store_name));
        foreach ($items as $item) {
            $this->M_cart->remove_item($item['cart_item_id']);
        }

        $this->session->set_flashdata('message', 'Pembelian berhasil dikonfirmasi.');
        redirect('cart');
    }
}
?>
