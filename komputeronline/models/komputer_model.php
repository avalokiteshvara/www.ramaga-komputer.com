<?php

class Komputer_model extends CI_Model{

	public $limit;
	public $offset;
	public $sort;
	public $order;
	
	function __construct(){

		parent::__construct();

	}

	function get(){

		$rs = $this->db->query('SELECT * FROM tbl_komputer');
		return $rs;

	}

	function get_slug($id){
		$rs = $this->db->query("SELECT slug FROM tbl_komputer WHERE id=$id");
		return $rs->row()->slug;
	}

	function delete($id){	

		$this->db->delete('tbl_komputer',array('id' => $id));

	}

	function insert($data){

		$this->db->insert('tbl_komputer',$data);

	}

	function update($id,$data){

		$this->db->where('id',$id);
		$this->db->update('tbl_komputer',$data);
	}

}