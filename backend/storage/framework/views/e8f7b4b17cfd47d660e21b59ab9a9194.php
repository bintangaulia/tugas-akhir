<?php $__env->startSection('page_title',$pageTitle); ?>
<?php $__env->startSection('content'); ?>
<div class="card">
    <div class="card-body py-5">
        <div class="row align-item-center">
            
            <div class="row col-10"></div>
            
            
            <div class="col-2 d-flex justify-content-end">
                <?php if (isset($component)) { $__componentOriginal5b2ec28abcaebf2b210103da093a5e1c = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal5b2ec28abcaebf2b210103da093a5e1c = $attributes; } ?>
<?php $component = App\View\Components\Produk\FormProduk::resolve([] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('produk.form-produk'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\Produk\FormProduk::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal5b2ec28abcaebf2b210103da093a5e1c)): ?>
<?php $attributes = $__attributesOriginal5b2ec28abcaebf2b210103da093a5e1c; ?>
<?php unset($__attributesOriginal5b2ec28abcaebf2b210103da093a5e1c); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal5b2ec28abcaebf2b210103da093a5e1c)): ?>
<?php $component = $__componentOriginal5b2ec28abcaebf2b210103da093a5e1c; ?>
<?php unset($__componentOriginal5b2ec28abcaebf2b210103da093a5e1c); ?>
<?php endif; ?>
            </div>
            
        </div>
        <table class="table mt-5">
            <thead>
                <tr>
                    <th class="text-center" style="width: 15px ">No</th>
                    <th>Data</th>
                    <th>Kategori</th>
                    <th class="text-center" style="width: 100px">Opsi</th>
                </tr>
            </thead>
            <tbody>
                <?php $__empty_1 = true; $__currentLoopData = $produk; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <tr>
                        <td><?php echo e($index + 1); ?></td>
                        <td><?php echo e($item->nama_produk); ?></td>
                        <td><?php echo e($item->kategori->nama_kategori); ?></td>
                        <td>
                            <div class="d-flex align-items-center gap-1">
                                <?php if (isset($component)) { $__componentOriginal73f36b44041cfc386eb521d3e76b4de7 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal73f36b44041cfc386eb521d3e76b4de7 = $attributes; } ?>
<?php $component = App\View\Components\ConfirmDelete::resolve(['id' => ''.e($item->id).'','route' => 'master-data.produk.destroy'] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('confirm-delete'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\ConfirmDelete::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal73f36b44041cfc386eb521d3e76b4de7)): ?>
<?php $attributes = $__attributesOriginal73f36b44041cfc386eb521d3e76b4de7; ?>
<?php unset($__attributesOriginal73f36b44041cfc386eb521d3e76b4de7); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal73f36b44041cfc386eb521d3e76b4de7)): ?>
<?php $component = $__componentOriginal73f36b44041cfc386eb521d3e76b4de7; ?>
<?php unset($__componentOriginal73f36b44041cfc386eb521d3e76b4de7); ?>
<?php endif; ?>
                        </td>
                    </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <tr>
                        <td colspan="4" class="text-center">Data Produk tidak tersedia</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
        <?php echo e($produk->links()); ?>

    </div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.kai', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH C:\INFORMATIKA\Semester5\tugas-akhir\backend\resources\views/produk/index.blade.php ENDPATH**/ ?>