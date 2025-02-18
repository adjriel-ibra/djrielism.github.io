<?php
class byLogin extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->model('M_buyer'); 
        $this->load->library('session'); 
        $this->load->model('M_checkout');
    }

    public function index() {
        $this->load->view('bylogin'); 
    }

    public function tampil() {
        if (!$this->session->userdata('buyer_name')) {
            redirect('bylogin');
        }
        $buyer_name = $this->session->userdata('buyer_name');
        $data['buyer'] = $this->M_buyer->get_buyer_by_name($buyer_name);
        $data['transactions'] = $this->M_checkout->get_transactions_by_buyer($buyer_name);
        $this->load->view('bytampil', $data);
        $this->load->view('template/bubble_chat');
    }

    public function update() {
        $buyer_name = $this->session->userdata('buyer_name');

        $data = array(
            'email' => $this->input->post('email'),
            'password' => $this->input->post('password'),
            'buyer_address' => $this->input->post('buyer_address'),
            'buyer_number' => $this->input->post('buyer_number')
        );
        $this->M_buyer->update_buyer($buyer_name, $data);

        $this->session->set_flashdata('success', 'Profil berhasil diperbarui!');
        redirect('bylogin/tampil');
    }
    public function authenticate() {
        $username = $this->input->post('username');
        $password = $this->input->post('password');

        $buyer = $this->M_buyer->get_buyer($username, $password);

        if ($buyer) {
            $this->session->set_userdata('buyer_name', $buyer->buyer_name);
            redirect('home_control');
        } else {
            $this->session->set_flashdata('error', 'Username atau Password salah!');
            redirect('bylogin');
        }
    }

    public function logout() {
        $this->session->sess_destroy(); 
        redirect('bylogin'); 
    }
}
