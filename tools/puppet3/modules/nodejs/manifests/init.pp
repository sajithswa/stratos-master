class nodejs {

  $target = '/mnt'

  if $stratos_app_path {
    $nodejs_home = $stratos_app_path
  } 
  else {
    $nodejs_home = "${target}/nodejs"
  }

  package { ['npm','git-all']:
    ensure => installed,
  }


  file {
	'${nodejs_home}/': 
	   ensure => present;
  }

  exec {
    'Create nodejs home':
      path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
      command => "mkdir -p ${nodejs_home}";
    
    'Install libraries':
      path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
      cwd     => $nodejs_home,
      command => 'npm install express',
      require => [
	File['${nodejs_home}/'],
        Package['npm'],
      ];

    'Start application':
      path      => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
      cwd       => '${nodejs_home}',
      onlyif    => 'test -f web.js',
      command   => 'node web.js > /dev/null 2>&1 &',
      tries     => 100,
      try_sleep => 2,
      require   => Exec['Install libraries'];
  }
}
