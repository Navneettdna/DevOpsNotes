$httpdservice = $osfamily?{
  'Redhat' => 'httpd',
  'Debian' => 'apache2',
  'default' => 'httpd',
}
node slave1.example.com{
  file {'/opt/info.txt':
  ensure => 'present',
  content => "Created by puppet master"
  }
  package{'httpd':
  ensure => 'absent',
  }
  service{'httpd':
  ensure => 'running',
  enable => 'true'
  }
}
