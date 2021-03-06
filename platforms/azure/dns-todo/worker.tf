resource "azurerm_dns_a_record" "worker_nodes" {
  resource_group_name = "${azurerm_resource_group.tectonic_azure_dns_resource_group.name}"
  zone_name           = "${azurerm_dns_zone.tectonic_azure_dns_zone.name}"

  count   = "${var.tectonic_worker_count}"
  name    = "${var.tectonic_cluster_name}-worker-${count.index}"
  ttl     = "59"
  records = ["${azurerm_public_ip.worker_node.ip_address[count.index]}"]
  count   = "${var.use_custom_fqdn == "true" ? 1 : 0}"
}
