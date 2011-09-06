class wordpress {
      package { php: ensure => latest }
      package { php-mysql:
                ensure => latest,
                require => Package["php"] }
      package { wordpress:
                ensure => latest,
                require => Package["php-mysql"] }
      file { "/etc/wordpress/wp-config.php":
              content => template('wordpress/wp-config.erb'),
              require => Package["wordpress"]
           }
      service { httpd:
                enable => true,
                ensure => "running",
                require =>  File["/etc/wordpress/wp-config.php"]
              }
}
