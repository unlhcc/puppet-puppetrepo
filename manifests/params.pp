class puppetrepo::params {

  $puppetrepo_baseurl = "http://yum.puppetlabs.com/puppet6/el/${::operatingsystemmajrelease}/\$basearch"
  $puppetrepo_enabled = '1'
  $puppetrepo_failovermethod = undef
  $puppetrepo_gpgcheck = '1'
  $puppetrepo_gpgkey = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppet'
  $puppetrepo_priority = undef

  $puppetrepo_source_baseurl = "http://yum.puppetlabs.com/puppet6/el/${::operatingsystemmajrelease}/SRPMS"
  $puppetrepo_source_enabled = '0'
  $puppetrepo_source_failovermethod = 'priority'
  $puppetrepo_source_gpgcheck = '1'
  $puppetrepo_source_gpgkey = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppet'
  $puppetrepo_source_priority = undef

}
