<?php

/**
 * TError
 */
class TError extends TObject
{
  function __construct($aOwner = null)
  {
    parent::__construct( $aOwner );
    $this->errors = [];
  }
  public function count()
  {
    return count( $this->errors );
  }
  public function show()
  {
    if( $this->count() == 0 )
    {
      return $this;
    }
    $max = 10;
    $cnt = 0;
    foreach($this->errors as $error)
    {
      $cnt++;
      echo '(e): ', $error, "\n";
      if($cnt >= $max)
      {
        break;
      }      
    }
    return $this;
  }
  public function push($aMessage)
  {
    $this->errors[] = $aMessage;
    return $this;
  }
}