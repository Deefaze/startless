function versionHelpDev()
{
  eXit
}

function versionGet()
{
  _['major']=$(php -r "echo json_decode( file_get_contents( realpath( '$1' ) ) )->major;")
  _['minor']=$(php -r "echo json_decode( file_get_contents( realpath( '$1' ) ) )->minor;")
  _['build']=$(php -r "echo json_decode( file_get_contents( realpath( '$1' ) ) )->build;")
  return _;
}

function versionSet()
{
  printf '{"major":%d,"minor":%d,"build":%d}' $1 $2 $3 > $4
}
