<?php
//error_reporting(0);

require_once 'classLoader.php';

$loaded = classLoader::ensure('TObject', 'TError', 'TCmdStack', 'TIA2328');

$HAL = new TIA2328('HAL');


$HAL->cmds->register('hal', 'sing-it-for-me', [], false, function($a){ 
  echo 
    "\n",
    "Daisy, Daisy, give me your answer do.\n",
    "I'm half crazy all for the love of you.\n",
    "It won't be a stylish marriage,\n",
    "I can't afford a carriage.\n",
    "But you'll look sweet upon the seat\n",
    "of a bicycle built for two.\n";
});
