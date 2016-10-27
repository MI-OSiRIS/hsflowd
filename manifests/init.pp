class hsflowd (
	$nflog = false,
	$testing = true,
	$ovs = false,
	$kvm = false,
	$dns_sd = true,
	$collector = '140.221.249.136',
	$domain = '.sc16.org' 
)
{

	package { 'hsflowd': ensure => present }

	service { 'hsflowd': 
		ensure => running,
		enable => true,
		require => [ File['/etc/hsflowd.conf'], Package['hsflowd'] ]
	}

	file { '/etc/hsflowd.conf':
		content => template("hsflowd/hsflowd.conf.erb"),
		owner => "root",
		group => "root",
		mode => "0644",
		notify => Service['hsflowd'] 
	}
}