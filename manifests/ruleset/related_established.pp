class iptables::ruleset::related_established (
  $chains          = [ 'INPUT', 'OUTPUT', 'FORWARD' ],
  $target          = $iptables::default_target,
  $protocol        = '',
  $order           = 9000,
  $log             = false,
  $log_prefix      = $iptables::log_prefix,
  $log_limit_burst = $iptables::log_limit_burst,
  $log_limit       = $iptables::log_limit,
  $log_level       = $iptables::log_level,
) {

  $discard = iptables_declare_multiple('iptables::rule', $chains,
                                       'example42-established-filter-###name###', {
    table           => 'filter',
    chain           => '###name###',
    protocol        => $protocol,
    explicit_matches => { 'state' => { 'state' => 'RELATED,ESTABLISHED'} },
    target          => $target,
    order           => $order,
    log             => $log,
    log_prefix      => $log_prefix,
    log_limit_burst => $log_limit_burst,
    log_limit       => $log_limit,
    log_level       => $log_level
  })

}
