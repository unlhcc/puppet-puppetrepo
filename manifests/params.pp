class puppetrepo::params {

    $os_maj_release = $facts['os']['release']['major']

    # failovermethod has been removed in EL8
    if versioncmp($os_maj_release,'8') >= 0 {
        $failovermethod = 'absent'
    } else {
        $failovermethod = 'priority'
    }

    $puppetrepo_baseurl = "http://yum.puppetlabs.com/puppet7/el/${os_maj_release}/\$basearch"
    $puppetrepo_enabled = '1'
    $puppetrepo_failovermethod = $failovermethod
    $puppetrepo_gpgcheck = '1'
    $puppetrepo_gpgkey = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppet'
    $puppetrepo_priority = undef

    $puppetrepo_source_baseurl = "http://yum.puppetlabs.com/puppet7/el/${os_maj_release}/SRPMS"
    $puppetrepo_source_enabled = '0'
    $puppetrepo_source_failovermethod = $failovermethod
    $puppetrepo_source_gpgcheck = '1'
    $puppetrepo_source_gpgkey = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppet'
    $puppetrepo_source_priority = undef

}
