<div class="sidebar" data-background-color="white">
        <div class="sidebar-logo">
          <!-- Logo Header -->
          <div class="logo-header" data-background-color="dark">
            <a href="/home" class="logo">
              <img
                src="<?php echo e(asset('template')); ?>/assets/img/kaiadmin/logo_light.svg"
                alt="navbar brand"
                class="navbar-brand"
                height="20"
              />
            </a>
            <div class="nav-toggle">
              <button class="btn btn-toggle toggle-sidebar">
                <i class="gg-menu-right"></i>
              </button>
              <button class="btn btn-toggle sidenav-toggler">
                <i class="gg-menu-left"></i>
              </button>
            </div>
            <button class="topbar-toggler more">
              <i class="gg-more-vertical-alt"></i>
            </button>
          </div>
          <!-- End Logo Header -->
        </div>
        <div class="sidebar-wrapper scrollbar scrollbar-inner">
          <div class="sidebar-content">
            <ul class="nav nav-secondary">
                <?php $__currentLoopData = $links; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $link): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php if($link['is_dropdown']): ?>
                    <li class="nav-item active <?php echo e($link['is_active'] ? 'active' : ''); ?>">
                <a
                  data-bs-toggle="collapse"
                  href="#dashboard"
                  class="collapsed"
                  aria-expanded="false"
                >
                  <i class="<?php echo e($link['icon']); ?>"></i>
                  <p><?php echo e($link['label']); ?></p>
                  <span class="caret"></span>
                </a>
                <div class="collapse" id="dashboard">
                  <ul class="nav nav-collapse">
                    <?php $__currentLoopData = $link['items']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <li>
                      <a href="<?php echo e(route($item['route'])); ?>">
                        <span class="sub-item"><?php echo e($item['label']); ?></span>
                      </a>
                    </li>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    
                  </ul>
                </div>
              </li>
              <?php else: ?>
              <li class="nav-item <?php echo e($link['is_active'] ? 'active' : ''); ?>">
                <a href="<?php echo e(route($link['route'])); ?>">
                  <i class="<?php echo e($link['icon']); ?>"></i>
                  <p><?php echo e($link['label']); ?></p>
                </a>
              </li>
              <?php endif; ?>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
              
              
            </ul>
          </div>
        </div>
      </div><?php /**PATH C:\INFORMATIKA\Semester5\tugas-akhir\backend\resources\views/components/sidebar.blade.php ENDPATH**/ ?>