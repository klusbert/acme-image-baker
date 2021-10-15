






resource "null_resource" "bake_image" {

  depends_on = [
    openstack_networking_subnet_v2.subnet_1
  ]
  provisioner "local-exec" {
    command = "packer build -var 'source_image=${var.image_id}' -var 'networks=[${openstack_networking_network_v2.network_1.id}]' -var 'flavor=${var.flavor_id}'  -var 'image_name=${var.imagename}'  packer.json"

  }
}
