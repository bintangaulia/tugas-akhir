<div class="">
    <!-- Button trigger modal -->
<button type="button" class="btn <?php echo e($id ? 'btn-primary btn-icon' : 'btn-dark'); ?>" data-bs-toggle="modal" data-bs-target="#formKategori<?php echo e($id  ?? ''); ?>">
  <?php if($id): ?>
      <i class="fas fa-edit">

      </i>
  <?php else: ?>
            <span>Kategori Baru</span>
        

  <?php endif; ?>
</button>

<!-- Modal -->
<div class="modal fade" id="formKategori<?php echo e($id ?? ''); ?>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="formKategoriLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="<?php echo e($action); ?>" method="POST">
        <?php echo csrf_field(); ?>
        <?php if($id): ?>
            <?php echo method_field('PUT'); ?>
        <?php endif; ?>
        <div class="modal-header">
        <h1 class="modal-title fs-5" id="formKategoriLabel">Form Kategori</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="form-group">
            <label for="nama_kategori" class="form-label">Nama Kategori</label>
            <input type="text" name="nama_kategori" id="nama_kategori" class="form-control" value="<?php echo e(old('nama_kategori', $nama_kategori ??  '')); ?>">
            <?php $__errorArgs = ['nama_kategori'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                <small class="text-danger"><?php echo e($message); ?></small>
            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-white" data-bs-dismiss="modal">Batal</button>
        <button type="submit" class="btn btn-primary">Simpan</button>
      </div>
      </form>
    </div>
  </div>
</div>
</div><?php /**PATH C:\INFORMATIKA\Semester5\tugas-akhir\backend\resources\views/components/kategori-produk/form-kategori-produk.blade.php ENDPATH**/ ?>