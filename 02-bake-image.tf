

resource "null_resource" "base_image" {
  depends_on = [
    openstack_networking_router_interface_v2.router_interface_1
  ]
  provisioner "local-exec" {
    command = "packer build -var 'source_image=${var.image_id}' -var 'networks=[${openstack_networking_network_v2.network_1.id}]' -var 'flavor=${var.flavor_id}'  -var 'image_name=${var.base_image_name}' -var 'script=./cloud-inits/base_image.sh'  packer.json"

  }
}


resource "null_resource" "wordpress_image" {

  depends_on = [
    openstack_networking_router_interface_v2.router_interface_1
  ]
  provisioner "local-exec" {
    command = "packer build -var 'source_image=${var.image_id}' -var 'networks=[${openstack_networking_network_v2.network_1.id}]' -var 'flavor=${var.flavor_id}'  -var 'image_name=${var.wordpress_image_name}' -var 'script=./cloud-inits/wordpress.sh' packer.json"

  }
}


# database image creation requires a flavor with more ram ...(TODO remove hard coded variables.)
resource "null_resource" "db_image" {

  depends_on = [
    openstack_networking_router_interface_v2.router_interface_1
  ]
  provisioner "local-exec" {
    command = "packer build -var 'source_image=${var.image_id}' -var 'networks=[${openstack_networking_network_v2.network_1.id}]' -var 'flavor=c1-r1-d10'  -var 'image_name=${var.db_image_name}' -var 'script=./cloud-inits/db.sh' packer.json"

  }
}





