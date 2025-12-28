<?php $__env->startSection('page_title',$pageTitle); ?>
<?php $__env->startSection('content'); ?>
<div class="card d-flex flex-column flex-md-row align-items-md-center gap-2">
    <div class="card-body py-5">
        <div class="row">
            
            <div class="row col-10 align-items-center justify-content-between">
                <div class="col-1">
                    <?php if (isset($component)) { $__componentOriginal18e7e86833d3c3850dccc63d62d1bf2e = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal18e7e86833d3c3850dccc63d62d1bf2e = $attributes; } ?>
<?php $component = App\View\Components\PerPageOption::resolve([] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('per-page-option'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\PerPageOption::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal18e7e86833d3c3850dccc63d62d1bf2e)): ?>
<?php $attributes = $__attributesOriginal18e7e86833d3c3850dccc63d62d1bf2e; ?>
<?php unset($__attributesOriginal18e7e86833d3c3850dccc63d62d1bf2e); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal18e7e86833d3c3850dccc63d62d1bf2e)): ?>
<?php $component = $__componentOriginal18e7e86833d3c3850dccc63d62d1bf2e; ?>
<?php unset($__componentOriginal18e7e86833d3c3850dccc63d62d1bf2e); ?>
<?php endif; ?>
                </div>
                <div class="col-9">
                    <?php if (isset($component)) { $__componentOriginal37f8fc39859fb17caddc65202dec1208 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal37f8fc39859fb17caddc65202dec1208 = $attributes; } ?>
<?php $component = App\View\Components\FilterByField::resolve(['term' => 'search','placeholder' => 'Cari Kategori'] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('filter-by-field'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\FilterByField::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal37f8fc39859fb17caddc65202dec1208)): ?>
<?php $attributes = $__attributesOriginal37f8fc39859fb17caddc65202dec1208; ?>
<?php unset($__attributesOriginal37f8fc39859fb17caddc65202dec1208); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal37f8fc39859fb17caddc65202dec1208)): ?>
<?php $component = $__componentOriginal37f8fc39859fb17caddc65202dec1208; ?>
<?php unset($__componentOriginal37f8fc39859fb17caddc65202dec1208); ?>
<?php endif; ?>
                </div>
                <div class="col-1">
                    <?php if (isset($component)) { $__componentOriginal76f74df0a4c83b23d505b23851b14571 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal76f74df0a4c83b23d505b23851b14571 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.button-reset-filter','data' => ['route' => 'master-data.kategori-produk.index']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('button-reset-filter'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['route' => 'master-data.kategori-produk.index']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal76f74df0a4c83b23d505b23851b14571)): ?>
<?php $attributes = $__attributesOriginal76f74df0a4c83b23d505b23851b14571; ?>
<?php unset($__attributesOriginal76f74df0a4c83b23d505b23851b14571); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal76f74df0a4c83b23d505b23851b14571)): ?>
<?php $component = $__componentOriginal76f74df0a4c83b23d505b23851b14571; ?>
<?php unset($__componentOriginal76f74df0a4c83b23d505b23851b14571); ?>
<?php endif; ?>
                </div>
            </div>
            
            <div class="col-2 d-flex justify-content-end">
            <?php if (isset($component)) { $__componentOriginal5793cacedaf55c8251cf9ecce4818b36 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal5793cacedaf55c8251cf9ecce4818b36 = $attributes; } ?>
<?php $component = App\View\Components\KategoriProduk\FormKategoriProduk::resolve([] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('kategori-produk.form-kategori-produk'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\KategoriProduk\FormKategoriProduk::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal5793cacedaf55c8251cf9ecce4818b36)): ?>
<?php $attributes = $__attributesOriginal5793cacedaf55c8251cf9ecce4818b36; ?>
<?php unset($__attributesOriginal5793cacedaf55c8251cf9ecce4818b36); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal5793cacedaf55c8251cf9ecce4818b36)): ?>
<?php $component = $__componentOriginal5793cacedaf55c8251cf9ecce4818b36; ?>
<?php unset($__componentOriginal5793cacedaf55c8251cf9ecce4818b36); ?>
<?php endif; ?>
        </div>
        </div>
        
        <table class="table mt-5">
            <thead>
                <tr>
                    <th class="text-center" style="width: 15px">No</th>
                    <th>Nama Kategori</th>
                    <th class="text-center" style="width: 100px">Opsi</th>
                </tr>
            </thead>
            <tbody>
                <?php $__empty_1 = true; $__currentLoopData = $kategori; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <tr>
                        <td><?php echo e($index + 1); ?></td>
                        <td><?php echo e($item->nama_kategori); ?></td>
                        <td>
                            <div class="d-flex align-items-center gap-2">
                               <?php if (isset($component)) { $__componentOriginal5793cacedaf55c8251cf9ecce4818b36 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal5793cacedaf55c8251cf9ecce4818b36 = $attributes; } ?>
<?php $component = App\View\Components\KategoriProduk\FormKategoriProduk::resolve(['id' => ''.e($item->id).''] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('kategori-produk.form-kategori-produk'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\KategoriProduk\FormKategoriProduk::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal5793cacedaf55c8251cf9ecce4818b36)): ?>
<?php $attributes = $__attributesOriginal5793cacedaf55c8251cf9ecce4818b36; ?>
<?php unset($__attributesOriginal5793cacedaf55c8251cf9ecce4818b36); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal5793cacedaf55c8251cf9ecce4818b36)): ?>
<?php $component = $__componentOriginal5793cacedaf55c8251cf9ecce4818b36; ?>
<?php unset($__componentOriginal5793cacedaf55c8251cf9ecce4818b36); ?>
<?php endif; ?> 
                                <?php if (isset($component)) { $__componentOriginal73f36b44041cfc386eb521d3e76b4de7 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal73f36b44041cfc386eb521d3e76b4de7 = $attributes; } ?>
<?php $component = App\View\Components\ConfirmDelete::resolve(['id' => ''.e($item->id).'','route' => 'master-data.kategori-produk.destroy'] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
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
                            </div>
                        </td>
                    </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <tr>
                        <td colspan="3" class="text-center">Data Kategori Kosong</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
        <?php echo e($kategori->links()); ?>

    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.kai', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH C:\INFORMATIKA\Semester5\tugas-akhir\backend\resources\views/kategori-produk/index.blade.php ENDPATH**/ ?>