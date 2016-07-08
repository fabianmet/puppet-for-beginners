file { '/opt/puppet_code':
  ensure => directory,
}

file { '/opt/puppet_code/our_file.txt':
  content => 'Hello everyone!',
}

package { 'httpd':
  ensure => installed,
}

user { 'fabian':
  ensure => present,
}
