# puppet-hsflowd module

Simple module to install hsflowd and configure /etc/hsflowd.conf.

## Params 
$nflog = false

enable nflog module, see sample firewall config below

$testing = true

point to localhost as collector for testing

$ovs = false

sync config to openvswitch

$kvm = false 

use kvm module to get vm statistics

$dns_sd = true

Use DNS-SD module to find collector

$collector = '140.221.249.136'

If $testing and $dns_sd are false, use this as the collector IP setting

$domain = '.sc16.org' 

Domain to configure in DNS-SD config if $dns_sd is true


Sample to use nflog firewall config:

<pre>
MOD_STATISTIC="-m statistic --mode random --probability 0.0025"
NFLOG_CONFIG="--nflog-group 5 --nflog-prefix SFLOW"
-I INPUT -j NFLOG $MOD_STATISTIC $NFLOG_CONFIG
-I OUTPUT -j NFLOG $MOD_STATISTIC $NFLOG_CONFIG
</pre>

## Example:
<pre>
class { 'hsflowd': 
	dns_sd => true,
	testing => false,
	ovs => true,
	kvm => true
}
</pre>
  