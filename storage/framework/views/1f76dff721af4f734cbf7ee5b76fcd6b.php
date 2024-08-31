<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <title>Add product</title>
</head>

<body>
    <div class="container mt-3" style="margin-top:20px">
        <h2>Add new product</h2>
        <?php if(Session::has('success')): ?>
            <div class="alert alert-success" role="alert">
                <?php echo e(Session::get('success')); ?>

            </div>
        <?php endif; ?>
        <form action="<?php echo e(url('product-save')); ?>" method="POST">
            <?php echo csrf_field(); ?>
            <div class="mb-3 mt-3">
                <label for="id">Product ID:</label>
                <input type="text" class="form-control" id="id" name="id"
                       placeholder="Enter product id" required >
            </div>
            <div class="mb-3 mt-3">
                <label for="name">Product Name:</label>
                <input type="text" class="form-control" id="name" name="name"
                       placeholder="Enter product name" required >
            </div>
            <div class="mb-3 mt-3">
                <label for="price">Product Price:</label>
                <input type="number" class="form-control" id="price" name="price"
                       placeholder="Enter product price" required >
            </div>
            <div class="mb-3 mt-3">
                <label for="image">Product Image:</label>
                <input type="file" class="form-control" id="image" name="image" required >
            </div>
            <div class="mb-3 mt-3">
                <label for="details">Details:</label>
                <textarea class="form-control" rows="5" id="details" name="details"></textarea>
            </div>
            <div class="mb-3 mt-3">
                <label for="category">Category:</label>
                <select name="category" id="category" class="form-control">
                    <?php $__currentLoopData = $cat; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $c): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <option value="<?php echo e($c->catID); ?>"><?php echo e($c->catName); ?></option>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?> 
                </select >
            </div>
            <button type="submit" class="btn btn-primary">Save</button>
            <a href="<?php echo e(url('product-list')); ?>" class="btn btn-danger">Back</a>
        </form>
    </div>
</body>

</html>
<?php /**PATH C:\xampp\htdocs\CarsSales\resources\views/product-add.blade.php ENDPATH**/ ?>