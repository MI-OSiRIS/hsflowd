class hsflowd (
	$nflog = false,
	$testing = true,
	$ovs = false,
	$kvm = false,
	$dns_sd = true,
	$collector = '140.221.249.136',
	$domain = '.sc16.org',
	$ensure = 'present' 
)
{

	if $ensure == 'present' {
		$running = 'running'
		$enable = true
	} else {
		$running = 'stopped'
		$enable = false
	}

	package { 'hsflowd': ensure => $ensure }

	service { 'hsflowd': 
		ensure => $running,
		enable => $enable,
		require => [ File['/etc/hsflowd.conf'], Package['hsflowd'] ]
	}

	file { '/etc/hsflowd.conf':
		content => template("hsflowd/hsflowd.conf.erb"),
		owner => "root",
		group => "root",
		mode => "0644",
		ensure => $present,
		notify => Service['hsflowd'] 
	}
}