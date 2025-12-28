<div class="">
    <select name="perPage" id="perPage" class="form-control" onchange="window.location.href = '?perPage=' + this.value" style="width:100px;">
        <option value="">Per Page</option>
        <?php $__currentLoopData = $perPageOptions; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <option value="<?php echo e($item); ?>"><?php echo e($item); ?></option>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </select>
</div><?php /**PATH C:\INFORMATIKA\Semester5\tugas-akhir\backend\resources\views/components/per-page-option.blade.php ENDPATH**/ ?>