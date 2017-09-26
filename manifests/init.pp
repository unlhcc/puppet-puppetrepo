#
# Class puppetrepo
#
# Sets up Puppet Labs PC1 Repositories
#
class puppetrepo (

    $puppetrepo_baseurl            = $puppetrepo::params::puppetrepo_baseurl,
    $puppetrepo_enabled            = $puppetrepo::params::puppetrepo_enabled,
    $puppetrepo_failovermethod     = $puppetrepo::params::puppetrepo_failovermethod,
    $puppetrepo_gpgcheck           = $puppetrepo::params::puppetrepo_gpgcheck,
    $puppetrepo_gpgkey             = $puppetrepo::params::puppetrepo_gpgkey,
    $puppetrepo_priority           = $puppetrepo::params::puppetrepo_priority,

    $puppetrepo_source_baseurl        = $puppetrepo::params::puppetrepo_source_baseurl,
    $puppetrepo_source_enabled        = $puppetrepo::params::puppetrepo_source_enabled,
    $puppetrepo_source_failovermethod = $puppetrepo::params::puppetrepo_source_failovermethod,
    $puppetrepo_source_gpgcheck       = $puppetrepo::params::puppetrepo_source_gpgcheck,
    $puppetrepo_source_gpgkey         = $puppetrepo::params::puppetrepo_source_gpgkey,
    $puppetrepo_source_priority       = $puppetrepo::params::puppetrepo_source_priority,

) inherits puppetrepo::params {

    if $::osfamily == 'RedHat' and $::operatingsystem !~ /Fedora|Amazon/ {

        yumrepo { 'puppet5':
            descr          => "Puppet 5 Repository el ${::os_maj_version} - \$basearch",
            baseurl        => $puppetrepo_baseurl,
            enabled        => $puppetrepo_enabled,
            failovermethod => $puppetrepo_failovermethod,
            gpgcheck       => $puppetrepo_gpgcheck,
            gpgkey         => $puppetrepo_gpgkey,
            priority       => $puppetrepo_priority,
        }

        yumrepo { 'puppet5-source':
            descr          => "Puppet 5 Repository el ${::os_maj_version} - Source",
            baseurl        => $puppetrepo_source_baseurl,
            enabled        => $puppetrepo_source_enabled,
            failovermethod => $puppetrepo_source_failovermethod,
            gpgcheck       => $puppetrepo_source_gpgcheck,
            gpgkey         => $puppetrepo_source_gpgkey,
            priority       => $puppetrepo_source_priority,
        }

        file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-puppet5':
            ensure => present,
            owner  => 'root',
            group  => 'root',
            mode   => '0644',
            source => 'puppet:///modules/puppetrepo/RPM-GPG-KEY-puppet5',
        }

        puppetrepo::rpm_gpg_key { 'RPM-GPG-KEY-puppet5':
            path   => '/etc/pki/rpm-gpg/RPM-GPG-KEY-puppet5',
        }

    } else {
        notice ("No Puppet Labs PC1 repository available for ${::operatingsystem}")
    }

}
