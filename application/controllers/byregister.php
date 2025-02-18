<?php
class byRegister extends CI_Controller {
    public function index() {
        $this->load->view('byregister_view');
    }

    public function process() {
        $this->load->database();

        $data = [
            'buyer_name' => $this->input->post('buyer_name'),
            'email'      => $this->input->post('email'),
            'password'   => $this->input->post('password'),
            'buyer_address'     => $this->input->post('alamat'),
            'buyer_number' => $this->input->post('phone_number'),
        ];

        $this->db->insert('buyers', $data);

        redirect('bylogin');
    }
}
