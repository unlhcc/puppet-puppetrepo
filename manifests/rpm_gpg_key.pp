# Define puppetrepo::rpm_gpg_key

define puppetrepo::rpm_gpg_key($path) {
    exec { "import-${name}":
        path      => '/bin:/usr/bin:/sbin:/usr/sbin',
        command   => "rpm --import ${path}",
        unless    => "rpm -q gpg-pubkey-$(echo $(gpg -q --batch --with-colons --throw-keyids --keyid-format short < ${path}) | grep pub | cut -d ':' -f 5 | cut --characters=9- | tr '[A-Z]' '[a-z]')",
        require   => File[$path],
        logoutput => 'on_failure',
    }
}
