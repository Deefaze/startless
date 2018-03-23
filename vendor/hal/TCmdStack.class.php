<?php

/**
 * TCmdStack 
 */
class TCmdStack extends TObject
{
  const ivkSuccess         = 0;
  const ivkError           = -2;
  const ivkNoAction        = -4;

  const ivkScrTableIsEmpty = -100;
  const ivkScrIsUnknown    = -101;
  const ivkScrMissing      = -102;
  
  const ivkCmdTableIsEmpty = -200;
  const ivkCmdIsUnknow     = -201;
  const ivkCmdMissing      = -202;

  const ivkArgIsUnknown    = -301;
  const ivkArgMissing      = -302;
  const ivkArgTooMuch      = -303;



  function __construct($aOwner = null)
  {
    parent::__construct( $aOwner );
    $this->cmds = [];
    $this->errors = isset( ${$aOwner} ) ? ${$aOwner}->errors : new TError();
  }

  public function register(string $aScript, string $aName, array $aParams, bool $aStrictParams, callable $aInvoke)
  {
    $this->cmds[$aScript][ $aName ] = [
      "script" => $aScript,
      "cmd"   => $aName,
      "params" => array_combine(array_values($aParams), array_pad([], count($aParams), null)),
      "strictParams" => $aStrictParams,
      "invoke" => $aInvoke,
    ];
    $this;
  }  

  public function invoke()
  {
    global $argc, $argv;
    // SCRIPT
    // get script name
    $script = $argc > 0 ? $argv[0] : null;
      // theres is no script registered
      if( count( $this->cmds ) == 0) return self::ivkScrTableIsEmpty;
      // user have'nt call script
      if( empty($script) ) return self::ivkScrMissing;
      // user call an unknown script
      if( !array_key_exists( $script, $this->cmds )) return self::ivkScrIsUnknown;
    // store
    $script = &$this->cmds[ $script ];

    // COMMANDS
    // get command name
    $cmd = $argc > 1 ? $argv[1] : null;
      // there is no command registered
      if( count( $script ) == 0) return self::ivkCmdTableIsEmpty;
      // user have'nt call command
      if( empty($cmd) ) return self::ivkCmdMissing;
      // user call an unknown command
      if( !array_key_exists( $cmd, $script )) return self::ivkCmdIsUnknow;
    // store
    $cmd = &$script[ $cmd ];

    // action is not defined
    if( !is_callable($cmd['invoke']) ) return self::ivkNoAction;

    // PARAMS
    // get parameters
    $params  = $argc > 2 ? array_slice($argv, 2) : [];
    $paramsC = count($params);
    if( $cmd['strictParams'] )
    {
      // too few arguments
      if( $paramsC < count($cmd['params']) ) return self::ivkArgMissing;
      // too much arguments
      if( $paramsC > count($cmd['params']) ) return self::ivkArgTooMuch;
      // WARNING ! in strict mode, passed params order equal stored params order
      $cmd['params'] = array_combine(array_keys($cmd['params']), $params);
    }
    else
    {
      // get empty parameters storage
      // parse parameters
      foreach($params as $param)
      {
        // dynamic parameters sound like [key]:[value]
        list($key, $value) = explode(':', $param);
        if( array_key_exists($key, $cmd['params']) )
        {
          $cmd['params'][ $key ] = $value;
        }
        else
        {
          return self::ivkArgIsUnknown;
        }
      }
    }

    // ACTION
    $cmd['invoke']((object)$cmd['params']);
  }
}