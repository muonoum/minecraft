# minecraft

## hugepages

    # 13.25GiB/2048KiB = 6784
    sysctl vm.nr_hugepages=6784
    tee -a /etc/sysctl.d/local.conf
    vm.nr_hugepages=6784
    ^D
    grep -E 'HugePages_(Total|Free)' /proc/meminfo

## motd

    sed -i 's/ENABLED=1/ENABLED=0/' /etc/default/motd-news
    chmod -x /etc/update-motd.d/10-help-text
    touch /var/lib/update-notifier/hide-esm-in-motd

## needrestart

    # /etc/needrestart/needrestart.conf
    $nrconf{override_rc} = {
        qr(^minecraft) => 0,
