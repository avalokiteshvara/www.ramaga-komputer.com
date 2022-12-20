<?php

class Software_model extends CI_Model{

	function __construct(){

		parent::__construct();

	}

	function get(){

		$rs = $this->db->query('SELECT * FROM tbl_software');
		return $rs;

	}

	function get_slug($id){
		$rs = $this->db->query("SELECT slug FROM tbl_software WHERE id=$id");
		return $rs->row()->slug;
	}

	function delete($id){	

		$this->db->delete('tbl_software',array('id' => $id));

	}

	function insert($data){

		$this->db->insert('tbl_software',$data);

	}

	function update($id,$data){

		$this->db->where('id',$id);
		$this->db->update('tbl_software',$data);
	}

}