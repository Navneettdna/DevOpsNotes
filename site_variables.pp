$httpdservice = $osfamily?{
  'Redhat' => 'httpd',
  'Debian' => 'apache2',
  'default' => 'httpd',
}
node slave1.example.com{
  class{'linux':}
}
class linux{
  $admintools = ['git', 'httpd', 'nano']
  file {'/opt/info.txt':
  ensure => 'present',
  content => "Created by puppet master"
  }
  package{$admintools:
  ensure => 'present',
  }
  service{$admintools:
  ensure => 'running',
  enable => 'true'
  }
}
