class jenkins {
  package { 'wget':
    ensure => installed,
  }

  exec { 'add_jenkins_key':
    command => 'wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -',
    path    => ['/bin', '/usr/bin'],
    require => Package['wget'],
  }

  file { '/etc/apt/sources.list.d/jenkins.list':
    content => 'deb http://pkg.jenkins.io/debian-stable binary/',
    require => Exec['add_jenkins_key'],
  }

  exec { 'apt_update':
    command => 'apt-get update',
    path    => ['/bin', '/usr/bin'],
    require => File['/etc/apt/sources.list.d/jenkins.list'],
  }

  package { 'jenkins':
    ensure => installed,
    require => Exec['apt_update'],
  }

  service { 'jenkins':
    ensure => running,
    enable => true,
    require => Package['jenkins'],
  }
}
