<div class="">
    <!-- Button trigger modal -->
<button type="button" class="btn <?php echo e($id ? 'btn-primary btn-icon' : 'btn-dark'); ?>" data-bs-toggle="modal" data-bs-target="#formKategori<?php echo e($id  ?? ''); ?>">
  <?php if($id): ?>
      <i class="fas fa-edit">

      </i>
  <?php else: ?>
      <span>Produk Baru</span>
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
        <h1 class="modal-title fs-5" id="formKategoriLabel">Form Produk</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="form-group">
            <label for="kategori_produk_id" class="form-label">Kategori Produk</label>
            <select name="kategori_produk_id" id="kategori_produk_id" class="form-control">
                <option value="">Pilih Kategori</option>
                <?php $__currentLoopData = $kategori; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <option value="<?php echo e($item->id); ?>"<?php echo e(old('kategori_produk_id', $kategori_produk_id ?? '') == $item->id ? 'selected' : ''); ?>><?php echo e($item->nama_kategori); ?></option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </select>
            <?php $__errorArgs = ['kategori_produk_id'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                <small class="text-danger">
                    <?php echo e($message); ?>

                </small>
            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
        </div>
        <div class="form-group">
            <label for="nama_produk" class="form-label">Nama Produk</label>
            <input type="text" name="nama_produk" id="nama_produk" class="form-control" value="<?php echo e(old('nama_produk', $nama_produk ?? '')); ?>">
            <?php $__errorArgs = ['nama_produk'];
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
        <div class="form-group">
            <label for="deskripsi_produk" class="form-group">Deskripsi Produk</label>
            <textarea name="deskripsi_produk" id="deskripsi_produk" cols="30" rows="5" class="form-control">
                <?php echo e(old('deskripsi_produk', $deskripsi_produk ?? '')); ?>

            </textarea>
            <?php $__errorArgs = ['deskripsi_produk'];
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
</div>

<?php /**PATH C:\INFORMATIKA\Semester5\tugas-akhir\backend\resources\views/components/produk/form-produk.blade.php ENDPATH**/ ?>