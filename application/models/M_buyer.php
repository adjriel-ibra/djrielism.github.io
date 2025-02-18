<?php
class M_buyer extends CI_Model {
    public function update_buyer($buyer_name, $data) {
        $this->db->where('buyer_name', $buyer_name);
        $this->db->update('buyers', $data);
    }
    public function get_buyer_by_name($buyer_name) {
        $this->db->where('buyer_name', $buyer_name);
        $query = $this->db->get('buyers');

        if ($query->num_rows() == 1) {
            return $query->row();
        }
        return false; 
    }
    public function get_buyer($username, $password) {
        $this->db->where('buyer_name', $username);
        $this->db->where('password', $password); 
        $query = $this->db->get('buyers');

        if ($query->num_rows() == 1) {
            return $query->row();
        }
        return false; 
    }
}
