# Class: tinyproxy
# ===========================
#
class tinyproxy (
  Boolean $use_epel,
  String  $package_ensure,

  Enum['file', 'absent'] $config_ensure,
  String $config_path,
  String $user,
  String $group,
  Integer $port,
  Optional[String] $listen,
  Optional[String] $bind,
  Optional[Boolean] $bind_same,
  Integer $timeout,
  Optional[Hash[Integer, String]] $error_files,
  String $default_error_file,
  Optional[String] $stat_host,
  String $stat_file,
  Optional[String] $log_file,
  Boolean $use_syslog,
  String $pid_file,
  Boolean $use_xtinyproxy,
  Optional[Array[String]] $default_upstreams,
  Optional[Hash[String, Variant[String, Array[String]]]] $upstreams,
  Optional[Array[String]] $no_upstreams,
  Integer $max_clients,
  Integer $min_spare_servers,
  Integer $max_spare_servers,
  Integer $start_servers,
  Integer $max_requests_per_child,
  Optional[String] $allow,
  Optional[String] $deny,
  Optional[Hash[String, String]] $add_headers,
  String $via_proxy_name,
  Boolean $disable_via_header,
  Optional[String] $filter,
  Optional[Boolean] $filter_urls,
  Optional[Boolean] $filter_extended,
  Optional[Boolean] $filter_case_sensitive,
  Optional[Boolean] $filter_default_deny,
  Enum['Critical', 'Error', 'Warning', 'Notice', 'Connect', 'Info'] $log_level,
  Optional[Array[String]] $anonymous,
  Optional[Array[Integer]] $connect_ports,
  Optional[Hash[String, String]] $reverse_paths,
  Optional[Boolean] $reverse_only,
  Optional[Boolean] $reverse_magic,
  Optional[String] $reverse_baseurl,

  Enum['running','stopped'] $service_ensure,
  Boolean                   $service_enable,
){

  class { 'tinyproxy::install':
    use_epel       => $use_epel,
    package_ensure => $package_ensure,
  } ->

  class { 'tinyproxy::config':
    config_ensure          => $config_ensure,
    config_path            => $config_path,
    user                   => $user,
    group                  => $group,
    port                   => $port,
    listen                 => $listen,
    bind                   => $bind,
    bind_same              => $bind_same,
    timeout                => $timeout,
    error_files            => $error_files,
    default_error_file     => $default_error_file,
    stat_host              => $stat_host,
    stat_file              => $stat_file,
    log_file               => $log_file,
    use_syslog             => $use_syslog,
    pid_file               => $pid_file,
    use_xtinyproxy         => $use_xtinyproxy,
    default_upstreams      => $default_upstreams,
    upstreams              => $upstreams,
    no_upstreams           => $no_upstreams,
    max_clients            => $max_clients,
    min_spare_servers      => $min_spare_servers,
    max_spare_servers      => $max_spare_servers,
    start_servers          => $start_servers,
    max_requests_per_child => $max_requests_per_child,
    allow                  => $allow,
    deny                   => $deny,
    add_headers            => $add_headers,
    via_proxy_name         => $via_proxy_name,
    disable_via_header     => $disable_via_header,
    filter                 => $filter,
    filter_urls            => $filter_urls,
    filter_extended        => $filter_extended,
    filter_case_sensitive  => $filter_case_sensitive,
    filter_default_deny    => $filter_default_deny,
    log_level              => $log_level,
    anonymous              => $anonymous,
    connect_ports          => $connect_ports,
    reverse_paths          => $reverse_paths,
    reverse_only           => $reverse_only,
    reverse_magic          => $reverse_magic,
    reverse_baseurl        => $reverse_baseurl,
  } ~>

  class { 'tinyproxy::service':
    service_ensure => $service_ensure,
    service_enable => $service_enable,
  }

}
