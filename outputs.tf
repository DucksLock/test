# Outputs are a great way to output information about your apply.

output "webserver_ips" {
  value = esxi_guest.webserver[*].ip_address
}

output "db_ip" {
  value = esxi_guest.databaseserver.ip_address
}
