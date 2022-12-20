<?php

class Admin extends CI_Controller{
	

	function __construct(){

		parent::__construct();

		
		$this->load->model(
			array(
				'user_model',
				'trans_header_model',
				'trans_details_model',
				'produk_model',
				'trans_konfirmasi_model',
				'produk_viewed_model',
				'review_model',
				'komputer_model',
				'peripheral_model',
				'software_model',
				'gambar_produk_model',
				'barang_masuk_model',
				'barang_masuk_details_model',
				'stok_model'
			)
		);

	}

	
	function _generate_view($data){

		//latest review
		$this->review_model->limit = 4;
		$this->review_model->offset = 0;
		$this->review_model->sort = 'update_at';
		$this->review_model->order = 'DESC';
		$data['latest_review'] = $this->review_model->get();	

		$this->load->view('admin/view_index',$data);
	}



	function index(){

		if(trim($this->session->userdata('status')) !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}

		$data =array();
		$data['page_name'] = 'beranda';
		$data['page_title'] = 'Admin - Beranda';
		
		$url = base_url() . 'admin/beranda/';
		$res = $this->trans_header_model->trans_header_model->get_status_num('PAYMENT_CONFIRMED');
		$per_page = 10;
		$config = admin_pagination($url,$res,$per_page,3);
		$this->pagination->initialize($config);

		$this->trans_header_model->limit = $per_page;
		if($this->uri->segment(3) == TRUE){
			$this->trans_header_model->offset = $this->uri->segment(3);
		}else{
			$this->trans_header_model->offset = 0;
		}

		$data['start_number'] = $this->trans_header_model->offset;

		$this->trans_header_model->sort = 'created_at';
		$this->trans_header_model->order = 'DESC';

		$data['payment_confirmed'] = $this->trans_header_model->get_status('PAYMENT_CONFIRMED');

		//stok
		$this->stok_model->limit = 10;
		$this->stok_model->offset = 0;
		$this->stok_model->sort = 'stok';
		$this->stok_model->order = 'ASC';
		$data['stok_product'] = $this->stok_model->get();	

		//best-seller
		$this->produk_model->limit = 10;
		$this->produk_model->offset = 0;
		$this->produk_model->sort = 'hasil_penjualan';
		$this->produk_model->order = 'DESC';
		$data['best_seller_product'] = $this->trans_header_model->get_penjualan();	

		
		//best-seller
		$this->produk_viewed_model->limit = 10;
		$this->produk_viewed_model->offset = 0;
		$this->produk_viewed_model->sort = 'view_count';
		$this->produk_viewed_model->order = 'DESC';
		$data['most_viewed'] = $this->produk_viewed_model->get_most_viewed();	



		if ($this->input->post('ajax')) {							
				$this->load->view('admin/payment_ajax',$data);
			}else{
				$this->_generate_view($data);
		}
	}


	function getSubJenis(){

		$this->load->model('basecrud_m');

		$jenis = $_GET['jenis'];
		$id_jenis = $_GET['selected'];
		
		$html = "<option value='pilih-ukuran'>Pilih Sub Jenis</option>";
		$row = $this->basecrud_m->get('tbl_' . $jenis);
		
		foreach ($row->result() as $r) {
			if($r->id == $id_jenis){
				$html .="<option selected value='$r->id'>$r->title</option>";
			}else{
				$html .="<option value='$r->id'>$r->title</option>";	
			}			
		}
		
		echo $html;
	}

/*komputer*/	
	function komputer(){

		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}

		$data = array();

		if(!empty($_POST)){
			$this->form_validation->set_rules('title', 'title', 'xss_clean|required');
			if ($this->form_validation->run() == TRUE)
        	{
        		$data['title'] = $this->input->post('title');
        		$data['slug'] = create_slug($this->input->post('title'),false);  
        		$this->komputer_model->insert($data);        		
        		// echo 'OK';
        	}else{
        		// echo 'ERROR:'.validation_errors();
        	}

        	// redirect(base_url() . 'admin/komputer');
		}

		$data['page_name'] = 'komputer';
		$data['page_title'] = 'Komputer';

		$data['data_komputer'] = $this->komputer_model->get();
		$this->_generate_view($data);
	}

	function komputer_delete($id){
		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}

		$this->komputer_model->delete($id);
		// echo 'OK';
		redirect(base_url() . 'admin/komputer');

	}

	function komputer_edit(){
		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}

	}
/*end komputer*/	

/*peripheral*/	
	function peripheral(){

		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}

		$data = array();

		if(!empty($_POST)){
			$this->form_validation->set_rules('title', 'title', 'xss_clean|required');
			if ($this->form_validation->run() == TRUE)
        	{
        		$data['title'] = $this->input->post('title');
        		$data['slug'] = create_slug($this->input->post('title'),false);  
        		$this->peripheral_model->insert($data);
        		// echo 'OK';
        	}else{
        		// echo 'ERROR:'.validation_errors();
        	}

        	// redirect(base_url() . 'admin/peripheral','refresh');
		}

		$data['page_name'] = 'peripheral';
		$data['page_title'] = 'Master peripheral';

		$data['data_peripheral'] = $this->peripheral_model->get();
		$this->_generate_view($data);
	}

	function peripheral_delete($id){
		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}

		$this->peripheral_model->delete($id);
		redirect(base_url() . 'admin/peripheral');
	}

	function peripheral_edit(){
		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}

	}
/*END peripheral*/	

/*software*/	
	function software(){

		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}

		$data = array();

		if(!empty($_POST)){
			$this->form_validation->set_rules('title', 'title', 'xss_clean|required');
			if ($this->form_validation->run() == TRUE)
        	{
        		$data['title'] = $this->input->post('title');
        		$data['slug'] = create_slug($this->input->post('title'),false);  
        		$this->software_model->insert($data);
        		// echo 'OK';
        	}else{
        		// echo 'ERROR:'.validation_errors();
        	}

        	// redirect(base_url() . 'admin/software');

		}

		$data['page_name'] = 'software';
		$data['page_title'] = 'Master software';

		$data['data_software'] = $this->software_model->get();
		$this->_generate_view($data);
	}

	function software_delete($id){

		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}

		$this->software_model->delete($id);
		redirect(base_url() . 'admin/software');
	}

	function software_edit(){
		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}

	}
/*end komputer*/	

	function login(){

		$data = array();

		if($this->session->userdata('status') ==='ADMIN' ){				
			redirect(base_url() . 'admin/beranda' );						
		}

		if(! empty($_POST) ){

			$this->form_validation->set_rules('email','Email','xss_clean|valid_email|required');
			$this->form_validation->set_rules('password','Password','xss_clean|required');

			if ($this->form_validation->run() == TRUE){
				$data['email'] = $this->input->post('email');
				$data['password'] = $this->input->post('password');

				$result = $this->user_model->admin_login($data);
				echo $result;
		    	return;

        	}else{
        		echo 'ERROR:'.validation_errors();
        		return;
        	}
		}

		$data['page_title'] = 'Login';
		$data['page_name'] = 'login';

		$this->load->view('admin/login',$data);

	}

/**/
	function profile(){

		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}

		$data = array();
		$id = $this->session->userdata('id');

		if(!empty($_POST)){

			$this->form_validation->set_rules('nama_lengkap','Nama Lengkap','xss_clean|required');
			$this->form_validation->set_rules('email','Email','xss_clean|valid_email|required');

			if ($this->form_validation->run() == TRUE){
				//TODO:add update on user_model
				$data['nama_lengkap'] = $this->input->post('nama_lengkap');
				$data['email'] = $this->input->post('email');

				$pass = $this->input->post('password');
				
				if(isset($pass)){
					$data['password'] = md5($this->input->post('password'));
				}

		
				$this->user_model->update($id,$data);
				echo 'Profile telah berhasil diupdate';
				return;

			}else{
				echo 'ERROR:'.validation_errors();
				return;
			}

		}

		$data['user_profile'] = $this->user_model->get_where($id);
		$data['page_name'] = 'profile';
		$data['page_title'] = 'Form Profile';

		$this->_generate_view($data);
	}

	// $route['admin/trans/detail/(:num)'] = 'admin/trans_detail/$1';
	function trans_detail($id){

		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}
		
		$data = array();
		$data['page_title'] = 'Details';
		$data['page_name'] = 'trans_details';
		
		$data['details_pengiriman'] = $this->trans_header_model->get_where($id);
		$data['details_pesanan'] = $this->trans_details_model->get_details($id);
		$data['details_konfirmasi'] =  $this->trans_konfirmasi_model->get_konfirmasi($id);

		$this->_generate_view($data);
	}


	function logout(){

		$this->session->sess_destroy();
        redirect(base_url() .'admin-login', 'refresh');
        
	}

/*BARANG MASUK*/

	function barang_masuk(){

		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}

		$data = array();

		if(!empty($_POST)){

		}

		$url = base_url() . 'admin/barang-masuk/';
		$res = $this->barang_masuk_model->get_num();
		$per_page = 10;
		$config = admin_pagination($url,$res,$per_page,3);
		$this->pagination->initialize($config);

		$this->barang_masuk_model->limit = $per_page;

		if($this->uri->segment(3) == TRUE){
			$this->barang_masuk_model->offset = $this->uri->segment(3);
		}else{
			$this->barang_masuk_model->offset = 0;
		}

		$data['start_number'] = $this->barang_masuk_model->offset;

		$this->barang_masuk_model->sort = 'no_invoice';
		$this->barang_masuk_model->order = 'DESC';		


		$data['tabel_barang_masuk'] = $this->barang_masuk_model->get();

		$data['page_title'] = 'Form Barang Masuk';
		$data['page_name'] = 'barang_masuk';

		if ($this->input->post('ajax')) {							
				$this->load->view('admin/barang_masuk_ajax',$data);
				// echo 'lol';
			}else{
				$data['page_name'] = 'barang_masuk';				
				$this->_generate_view($data);
		}
	}

	// $route['admin/barang-masuk/add'] = 'admin/barang_masuk_add'; 
	function barang_masuk_add(){
		
		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}

		$data = array();

		if(!empty($_POST)){

			$this->form_validation->set_rules('no_invoice','Nomor Invoice','xss_clean|required|is_unique[tbl_barang_masuk.no_invoice]');
			$this->form_validation->set_rules('nama_pegawai','Nama Pegawai','xss_clean|required');
			$this->form_validation->set_rules('nilai_total','Nilai Total','xss_clean|required');
			$this->form_validation->set_rules('kode_proses','Kode Proses','xss_clean|required');
			$this->form_validation->set_rules('masuk_at','Tanggal Masuk','xss_clean|required');

			if ($this->form_validation->run() == TRUE){

				$data['no_invoice'] = $this->input->post('no_invoice');
				$data['nama_pegawai'] = $this->input->post('nama_pegawai');
				$data['nilai_total'] = $this->input->post('nilai_total');
				$data['keterangan'] = $this->input->post('keterangan');
				$data['masuk_at'] = $this->input->post('masuk_at');

				//insert
				$last_id = $this->barang_masuk_model->insert($data);

				//kode1:jumlah,kode2:jumlah,kode3-jumlah
				try{

					$arr_proses = explode(',', trim($_POST['kode_proses']));
					foreach ($arr_proses as $item) {
						
						$arr_detail = explode(':', $item);
						$kode = $arr_detail[0];
						$jumlah = $arr_detail[1];


						$this->barang_masuk_details_model->insert($last_id,$kode,$jumlah);					
					}

				}catch (Exception $e){
					echo "ERROR! Ada Kesalahan Pada Kode Proses!",$e->getMessage(),"\n";
					return;
				}

				redirect(base_url() . 'admin/barang-masuk','refresh');
			}else{

				echo validation_errors();
				return;
			}

		}


		$data['page_name'] = 'barang_masuk_add';
		$data['page_title'] = 'Tambah Data Barang Masuk';

		$this->_generate_view($data);

	}

	//$route['admin/barang-masuk/delete/(:num)'] = 'admin/barang_masuk_delete/$1';
	function barang_masuk_delete($id){

		$this->barang_masuk_model->delete($id);
		$this->barang_masuk_details_model->delete_by_idbarangmasuk($id);
		echo 'OK';
	}

	// $route['admin/barang-masuk/details/(:num)'] = 'admin/barang_masuk_details/$1';
	function barang_masuk_details($id_barang_masuk){
		
		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}


		$data = array();
		$data['page_title'] = 'Details Barang Masuk';
		$data['page_name'] = 'barang_masuk_details';
		$data['tabel_barang_masuk_details'] = $this->barang_masuk_details_model->get_by_idbarangmasuk($id_barang_masuk);

		$this->_generate_view($data);

	}

	// $route['admin/barang-masuk/details/delete/(:num)'] = 'admin/barang_masuk_details_delete$1';
	function barang_masuk_details_delete($id){

		$this->barang_masuk_details_model->delete($id);
		echo 'OK';
	}

/*END BARANG MASUK*/

/*PRODUK*/

	function produk(){

		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}	

		$data = array();

		if(!empty($_POST['kode'])){
			
			$this->form_validation->set_rules('kode','Kode','xss_clean|required|is_unique[tbl_produk.kode]');
            $this->form_validation->set_rules('nama','Nama','xss_clean|required');            
            $this->form_validation->set_rules('harga','Harga','xss_clean|required');            
            // $this->form_validation->set_rules('nama','Nama','xss_clean|required');            


            if ($this->form_validation->run() == TRUE)
            {  
                
                $data['kode'] = $this->input->post('kode');
                $data['nama'] = $this->input->post('nama');                
                $data['slug'] = create_slug($this->input->post('nama'),false);                
                
                $data['jenis'] = $this->input->post('jenis');
                $data['id_jenis'] = $this->input->post('id_jenis');

                //remove all unused char
                $remove_this = array('.','Rp','rp',',00');
                $data['harga'] = str_replace($remove_this, "", $this->input->post('harga'));
                $data['harga_lama'] = $this->input->post('harga_lama');
                $data['promo'] = $this->input->post('promo');
                

                //isi
                $data['deskripsi'] = $this->input->post('deskripsi');


                //gambar
                $config_upload = array();
                $config_upload['upload_path'] = './assets/web/images/image-produk/';
                $config_upload['allowed_types'] = 'jpeg|jpg|png';
                $config_upload['encrypt_name'] = TRUE;
                $this->load->library('upload', $config_upload);  

                if (!$this->upload->do_upload('foto')){
                    // echo $this->upload->display_errors();

                    //return;
                } else{
                    $success = $this->upload->data();
                    $data['gambar'] = $success['file_name'];                
                }   

                //tags


               $this->load->model('basecrud_m');
               $this->basecrud_m->insert("tbl_produk",$data); 


                redirect(base_url() . 'admin/produk','refresh');
            }else{
            	
                //redirect(base_url() . 'admin/produk','refresh');
                echo validation_errors();
            	return;
            }
		}	

		//pagination
		$url = base_url() . 'admin/produk/';
		$res = $this->produk_model->num_page();
		$per_page = 10;
		$config = admin_pagination($url,$res,$per_page,3);
		$this->pagination->initialize($config);

		$this->produk_model->limit = $per_page;
		if($this->uri->segment(3) == TRUE){
			$this->produk_model->offset = $this->uri->segment(3);
		}else{
			$this->produk_model->offset = 0;
		}

		
		$data['start_number'] = $this->produk_model->offset;
		$this->produk_model->sort = 'kode';
		$this->produk_model->order = 'ASC';		

		$data['tabel_produk'] = $this->produk_model->get_for_table();

		if ($this->input->post('ajax')) {							
				$this->load->view('admin/produk_ajax',$data);
				// echo 'lol';
			}else{
				$data['page_name'] = 'produk';
				$data['page_title'] = 'Produk';
				$this->_generate_view($data);
		}



	}

	function produk_add(){

		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}		

		$data['page_title']  = 'Tambah Produk';
		$data['page_name'] = 'produk_add';
		

		$this->_generate_view($data);
	}

	function produk_edit($slug){
		

		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}

		$data = array();

		if(!empty($_POST)){

			/*UPDATE*/			
            $this->form_validation->set_rules('nama','Nama','xss_clean|required');  
            $this->form_validation->set_rules('harga','Harga','xss_clean|required');                      
            
            if ($this->form_validation->run() == TRUE)
            {  
                
                $kode = $this->input->post('kode');
                $data['nama'] = $this->input->post('nama');                
                $data['slug'] = create_slug($this->input->post('nama'),false);                
                
                $data['jenis'] = $this->input->post('jenis');
                $data['id_jenis'] = $this->input->post('id_jenis');

               
                //remove all unused char
                $remove_this = array('.','Rp','rp',',00');
                $data['harga'] = str_replace($remove_this, "", $this->input->post('harga'));
                $data['harga_lama'] = $this->input->post('harga_lama');
                $data['promo'] = $this->input->post('promo');                

                //isi
                $data['deskripsi'] = $this->input->post('deskripsi');


                //gambar
                $config_upload = array();
                $config_upload['upload_path'] = './assets/web/images/image-produk/';
                $config_upload['allowed_types'] = 'jpeg|jpg|png';
                $config_upload['encrypt_name'] = TRUE;
                $this->load->library('upload', $config_upload);  

                if (!$this->upload->do_upload('foto')){
                    // echo $this->upload->display_errors();

                    //return;
                } else{
                    $success = $this->upload->data();
                    $data['gambar'] = $success['file_name'];                
                }   

                $this->produk_model->update($kode,$data); 

                redirect(base_url() . 'admin/produk','refresh');
            }else{
            	echo validation_errors();
            	return;
                //redirect(base_url() . 'admin/produk','refresh');
            }
		}

		$data['page_title']  = 'Edit Produk';
		$data['page_name'] = 'produk_edit';
		$data['produk_details'] = $this->produk_model->get_details($slug);

		$this->_generate_view($data);
	}

	//$route['admin/produk/delete/(:any)'] = 'admin/produk_delete/$1';

	function produk_delete($slug){
		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}

		$this->load->model('basecrud_m');
		$this->basecrud_m->delete("tbl_produk",array("slug" => $slug));

		redirect(base_url() . 'admin/produk');		
		
	}

	// $route['admin/produk/images/(:any)'] = 'admin/produk_images/$1';
	function produk_images($slug){
		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}


		$data = array();
		$data['page_title'] = 'List Gambar Untuk '.$slug;
		$data['page_name'] = 'produk_images';

		$this->gambar_produk_model->limit = 99;
		$this->gambar_produk_model->offset = 0;
		$this->gambar_produk_model->sort = 'gambar';
		$this->gambar_produk_model->order = 'DESC';

		$data['tabel_gambar'] = $this->gambar_produk_model->get($slug);		
		$data['slug'] = $slug;

		$this->_generate_view($data);
	}

	// $route['admin/produk/images/add/(:any)'] = 'admin/produk_images_add/$1';
	function produk_images_add($slug){
		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}


		//gambar
        $config_upload = array();
        $config_upload['upload_path'] = './assets/web/images/image-produk/';
        $config_upload['allowed_types'] = 'jpeg|jpg|png';
        $config_upload['encrypt_name'] = TRUE;
        $this->load->library('upload', $config_upload);  

        if (!$this->upload->do_upload('foto')){
            
        } else{
            $success = $this->upload->data();
            $data['gambar'] = $success['file_name'];  
            $data['kode_produk']  = $this->produk_model->get_id($slug);             
            $this->gambar_produk_model->insert($data);
        }   

        redirect(base_url() . 'admin/produk/images/'.$slug,'refresh');

	}

	// $route['admin/produk/images/delete/(:any)'] = 'admin/produk_images_delete/$1';
	function produk_images_delete($id){
			
		$this->gambar_produk_model->delete($id);
		echo 'OK';
	}

/*END PRODUK*/

/*TRANSAKSI*/
	function transaksi(){

		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}

		if(!empty($_POST)){

			$sort_based_on = $this->input->post('based_on');

			if($sort_based_on === 'ALL'){
				$this->session->unset_userdata('trans_filter');
			}else{
				$this->session->set_userdata('trans_filter',$sort_based_on);		
			}
		}


		$data = array();
		$data['page_name'] = 'transaksi';
		$data['page_title'] = 'Admin - Histori Transaksi';
		
		$url = base_url() . 'admin/transaksi/';
		
		if(!$this->session->userdata('trans_filter')){
			$res = $this->trans_header_model->trans_header_model->get_num_histori();
			$data['based_on'] = 'All';
		}else{
			$res = $this->trans_header_model->trans_header_model->get_status_num($this->session->userdata('trans_filter'));
			$data['based_on'] = $this->session->userdata('trans_filter');			
		}
		
		
		$per_page = 10;
		$config = admin_pagination($url,$res,$per_page,3);
		$this->pagination->initialize($config);

		$this->trans_header_model->limit = $per_page;
		if($this->uri->segment(3) == TRUE){
			$this->trans_header_model->offset = $this->uri->segment(3);
		}else{
			$this->trans_header_model->offset = 0;
		}

		$data['start_number'] = $this->trans_header_model->offset;

		$this->trans_header_model->sort = 'created_at';
		$this->trans_header_model->order = 'DESC';

		if(!$this->session->userdata('trans_filter')){		
			$data['tabel_transaksi'] = $this->trans_header_model->get_histori();
		}else{		
			$data['tabel_transaksi'] = $this->trans_header_model->get_status($this->session->userdata('trans_filter'));
		}		

		if ($this->input->post('ajax')) {							
				$this->load->view('admin/transaksi_ajax',$data);
				// echo 'lol';
			}else{
				$this->_generate_view($data);
		}
	}

/*END TRANSAKSI*/

/*PRODUK REVIEW*/

// $route['admin/produk/review']  = 'admin/produk_review'; 
	function produk_review(){

		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}

		$data = array();
		$data['page_name'] = 'review';
		$data['page_title'] = 'Produk Reviews';
		
		$url = base_url() . 'admin/produk/review/';
		$res = $this->review_model->get_num();
		$per_page = 10;
		$config = admin_pagination($url,$res,$per_page,4);
		$this->pagination->initialize($config);

		$this->review_model->limit = $per_page;
		if($this->uri->segment(4) == TRUE){
			$this->review_model->offset = $this->uri->segment(4);
		}else{
			$this->review_model->offset = 0;
		}

		$data['start_number'] = $this->review_model->offset;

		$this->review_model->sort = 'update_at';
		$this->review_model->order = 'DESC';

		$data['tabel_review'] = $this->review_model->get();

		if ($this->input->post('ajax')) {							
				$this->load->view('admin/review_ajax',$data);
				// echo 'lol';
			}else{
				$this->_generate_view($data);
		}

	}


	// $route['admin/produk/review/accepted/(:num)'] = 'admin/review_accepted/$1';

	function review_accepted($id){

		$this->review_model->accepted($id);
		echo 'OK';

	}

	// $route['admin/produk/review/delete/(:num)'] = 'admin/review_deleted/$1';
	function review_deleted($id){

		$this->review_model->delete($id);
		echo 'OK';

	}
/*END PRODUK REVIEW*/

/*STOK*/

	function stok(){

		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}

		$data = array();		
		
		$url = base_url() . 'admin/stok/';
		$res = $this->stok_model->get_num();
		$per_page = 10;
		$config = admin_pagination($url,$res,$per_page,3);
		$this->pagination->initialize($config);

		$this->stok_model->limit = $per_page;
		if($this->uri->segment(3) == TRUE){
			$this->stok_model->offset = $this->uri->segment(3);
		}else{
			$this->stok_model->offset = 0;
		}

		$this->stok_model->sort = 'stok';
		$this->stok_model->order = 'ASC';

		$data['stok_product'] = $this->stok_model->get();

		if ($this->input->post('ajax')) {							
				$this->load->view('admin/stok_ajax',$data);				
			}else{
				$data['page_name'] = 'stok';
				$data['page_title'] = 'Produk Reviews';
				$this->_generate_view($data);
		}


	}
/*END STOK*/

/*STATUS*/

	function set_status($id,$status){

		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}

		if($status == 0){
			$data = array('status'=> 'PROCESSING');

		}else{
			$data = array('status'=> 'COMPLETE');
		}
		

		$this->trans_header_model->update($id,$data);  
		echo base_url() . 'admin/trans/detail/' . $id;

	}


/*END STATUS*/

/*PENJUALAN*/
	function penjualan(){

		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}

		$data = array();
		
		$url = base_url() . 'admin/penjualan/';
		$res = $this->trans_header_model->num_page_penjualan();
		$per_page = 10;
		$config = admin_pagination($url,$res,$per_page,3);
		$this->pagination->initialize($config);

		$this->trans_header_model->limit = $per_page;

		if($this->uri->segment(3) == TRUE){
			$this->trans_header_model->offset = $this->uri->segment(3);
		}else{
			$this->trans_header_model->offset = 0;
		}

		$data['start_number'] = $this->trans_header_model->offset;

		$this->trans_header_model->sort = 'jml_jual';
		$this->trans_header_model->order = 'DESC';		


		$data['selling_product'] = $this->trans_header_model->get_penjualan();

		$data['page_title'] = 'Penjualan';
		// $data['page_name'] = 'penjualan';

		if ($this->input->post('ajax')) {							
				$this->load->view('admin/penjualan_ajax',$data);
				// echo 'lol';
			}else{
				$data['page_name'] = 'penjualan';				
				$this->_generate_view($data);
		}

	}

	function penjualan_per_hari(){

		if($this->session->userdata('status') !== 'ADMIN' ){				
			redirect(base_url() . 'admin-login');						
		}

		$data = array();
		
		$url = base_url() . 'admin/penjualan_per_hari/';
		$res = $this->trans_header_model->num_page_penjualan_per_hari();
		$per_page = 10;
		$config = admin_pagination($url,$res,$per_page,3);
		$this->pagination->initialize($config);

		$this->trans_header_model->limit = $per_page;

		if($this->uri->segment(3) == TRUE){
			$this->trans_header_model->offset = $this->uri->segment(3);
		}else{
			$this->trans_header_model->offset = 0;
		}

		$data['start_number'] = $this->trans_header_model->offset;

		$this->trans_header_model->sort = 'date(c.created_at)';
		$this->trans_header_model->order = 'DESC';		


		$data['selling_product'] = $this->trans_header_model->get_penjualan_per_hari();

		$data['page_title'] = 'Penjualan Per Hari';
		// $data['page_name'] = 'penjualan';

		if ($this->input->post('ajax')) {							
				$this->load->view('admin/penjualan_per_hari_ajax',$data);
				// echo 'lol';
			}else{
				$data['page_name'] = 'penjualan_per_hari';				
				$this->_generate_view($data);
		}


	}

/*END PENJUALAN*/	



}