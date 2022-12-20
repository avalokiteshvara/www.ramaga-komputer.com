
         <table class="table table-first-column-number ">
            <thead>
               <tr>
                  <th style="padding-left: 1em;">#</th>
                  <th>Gambar</th>
                  <th>Kode</th>
                  <th>Nama</th>                        
                  <th>Jenis</th>
                  <th>Sub Jenis</th>
                  
                  <th>Promo</th>
                  <th>Harga</th>
                  <th>Harga Lama</th>
                  <!-- <th>Aktif</th> -->
                  <th colspan="3"></th>
               </tr>
            </thead>
            <tbody>
               <?php 
                  $i = $start_number + 1;
                  foreach ($tabel_produk->result() as $produk) { 
                  ?>
               <tr class="<?php echo $produk->aktif !== 'Y' ? 'error' : '';  ?>">
                  <td><?php echo $i; ?></td>
                  <td><img src="<?php echo base_url() . 'assets/web/images/image-produk/' .$produk->gambar ;?> " width="50"></td>
                  <td><?php echo $produk->kode;?></td>
                  <td><?php echo $produk->nama;?></td>
                  <td><?php echo ucfirst($produk->jenis);?></td>
                  <td><?php echo ucfirst($produk->nama_jenis);?></td>
                  
                  <td><?php echo $produk->promo;?></td>
                  <td><?php echo format_rupiah($produk->harga);?></td>
                  <td><?php echo format_rupiah($produk->harga_lama);?></td>
                  <!-- <td><?php echo $produk->aktif;?></td> -->
                  <td>
                     <a href="<?php echo base_url() . 'admin/produk/edit/' . $produk->slug; ?>" style="color:blue;text-decoration:underline"> 
                     <button type="button" class="btn btn-primary btn-mini">Edit</button>   
                     </a>
                  </td>

                  <td>
                     <a href="<?php echo base_url() . 'admin/produk/delete/' . $produk->slug; ?>" style="color:blue;text-decoration:underline"> 
                     <button type="button" class="btn btn-primary btn-mini">Hapus</button>   
                     </a>
                  </td>
                  
                  <td>
                     <a href="<?php echo base_url() . 'admin/produk/images/' . $produk->slug; ?>" style="color:blue;text-decoration:underline"> 
                     <button type="button" class="btn btn-primary btn-mini">Gambar</button>
                     </a>
                  </td>
               </tr>
               <?php $i++;} ?>  
            </tbody>
         </table>
         <div class="paging_bootstrap pagination" id="paging">
            <ul>
               <?php echo $this->pagination->create_links();?>
            </ul>
         </div>
