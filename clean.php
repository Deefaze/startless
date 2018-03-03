<?php

array_map('unlink', glob("./vendor/composer/*"));
rmdir('./vendor/composer');

array_map('unlink', glob("./vendor/*"));
rmdir('./vendor');

?>