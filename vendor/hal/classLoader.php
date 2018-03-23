<?php

class classLoader
{
  static public function load($aClassFile) 
  {
    if( file_exists( $aClassFile ) )
    {
      return include_once( $aClassFile );
    }
    return false;
  }

  static public function ensure()
  {
    $classesNames = func_get_args();
    $classes = (object)[
      "success" => [],
      "fail"    => [],
    ];
    foreach($classesNames as $className)
    {
      if( !class_exists( $className ) )
      {
        $classFile = join('.', [$className, 'class', 'php']);
        if( !self::load( $classFile ) )
        {
          $altClassFile = join('/',[__DIR__, $classFile]);
          if(!self::load( $altClassFile) )
          {
            array_push($classes->fail, $aClassName);
            continue;
          }
        }
      }
      array_push($classes->success, $className);
    }
    return $classes;
  }
}