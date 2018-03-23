<?php


    if( !class_exists('TCmdStack') ) require join('/', [__DIR__, 'TCmdStack.class.php']);
    if( !class_exists('TError') ) require join('/', [__DIR__, 'TCmdStack.class.php']);

/**
 * do not say anything about this.
 */
class TIA2328 extends TObject
{
  function __construct($aName)
  {
    parent::__construct();

    $this->cmds = new TCmdStack( $aName );
    $this->errors = new TError( $aName );
  }
}