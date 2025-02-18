<?php
class Chat extends CI_Controller {
    public function index() {
        $this->load->model('M_chat');
        $data['contacts'] = $this->M_chat->getContacts();

        $contact = $this->input->get('contact'); 
        if ($contact) {
            $data['selectedContact'] = $contact;
            $data['messages'] = $this->M_chat->getMessages($contact, $this->session->userdata('buyer_name'));
        } else {
            $data['selectedContact'] = null;
            $data['messages'] = [];
        }
        $this->load->view('V_chat', $data);
    }

    public function sendMessage() {
        $datetime = new DateTime('now', new DateTimeZone('Asia/Jakarta'));
        $datetime->format('Y-m-d H:i:s');
        $this->load->model('M_chat');
        $data = [
            'sender' => $this->session->userdata('buyer_name'),
            'receiver' => $this->input->post('receiver'),
            'message' => $this->input->post('message'),
            'chat_time' => $datetime->format('Y-m-d H:i:s'),
        ];
        $this->M_chat->sendMessage($data);
        redirect('chat?contact=' . urlencode($data['receiver']));
    }
}

?>