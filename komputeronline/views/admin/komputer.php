<div class="content">
   <div class="container-fluid">
      <div class="row-fluid">
         <!-- content tengah -->
         <div class="span12">
         <div class="span4 main-content">
            <h2><?php echo $page_title;?></h2>
            <form class="form" action="<?php echo base_url() . 'admin/komputer';?>" method="POST" enctype="multipart/form-data" />
               <fieldset>
                  <div class="control-group">
                     <label class="control-label" for="input01">Nama</label>
                     <div class="controls">
                        <input type="text" class="input" name="title" />          
                     </div>
                  </div>
                 
                  <div class="control-group">
                     <div class="controls">
                        <button type="submit" class="btn btn-success pull-right">Simpan</button>
                     </div>
                  </div>
               </fieldset>
            </form>
            
            <div id="content-ajax">
               <table class="table table-first-column-number ">
                  <thead>
                     <tr>
                        <th style="padding-left: 1em;">#</th>
                        <th>Nama</th>                        
                        <th colspan="2"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <?php 
                        $i = 1;
                        foreach ($data_komputer->result() as $komputer) { 
                        ?>
                     <tr>
                        <td><?php echo $i; ?></td>                        
                        <td><?php echo $komputer->title;?></td>   
                        <!--                     
                        <td>
                           <a href="<?php echo base_url() . 'admin/komputer/edit/' . $komputer->id; ?>" style="color:blue;text-decoration:underline"> 
                           <button type="button" class="btn btn-primary btn-mini">Edit</button> 
                           </a>
                        </td>
                        -->
                        <td>
                           <a href="<?php echo base_url() . 'admin/komputer/delete/' . $komputer->id; ?>" style="color:blue;text-decoration:underline">
                           <button type="button" class="btn btn-primary btn-mini">Hapus</button> 
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
            </div>
         </div>         
         <!-- end content tengah --> 
      </div>
      </div>
   </div>
</div>