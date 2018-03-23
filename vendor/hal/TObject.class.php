<?php

/**
 * TObject
 */
class TObject
{
  private $_owner;
  public function __construct($aOwner = null)
  {
    $this->_owner = $aOwner;
  }
  public function owner()
  {
    return $this->_owner;
  }
}