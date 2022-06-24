class puppetrepo::params {

    if $::operatingsystemmajrelease {
        $os_maj_release = $::operatingsystemmajrelease
    } else {
        $os_versions    = split($::operatingsystemrelease, '[.]')
        $os_maj_release = $os_versions[0]
    }

    # failovermethod has been removed in EL8
    if versioncmp($os_maj_release,'8') >= 0 {
        $failovermethod = 'absent'
    } else {
        $failovermethod = 'priority'
    }

    $puppetrepo_baseurl = "http://yum.puppetlabs.com/puppet6/el/${::operatingsystemmajrelease}/\$basearch"
    $puppetrepo_enabled = '1'
    $puppetrepo_failovermethod = $failovermethod
    $puppetrepo_gpgcheck = '1'
    $puppetrepo_gpgkey = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppet'
    $puppetrepo_priority = undef

    $puppetrepo_source_baseurl = "http://yum.puppetlabs.com/puppet6/el/${::operatingsystemmajrelease}/SRPMS"
    $puppetrepo_source_enabled = '0'
    $puppetrepo_source_failovermethod = $failovermethod
    $puppetrepo_source_gpgcheck = '1'
    $puppetrepo_source_gpgkey = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppet'
    $puppetrepo_source_priority = undef

}
