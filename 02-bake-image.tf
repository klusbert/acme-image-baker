

resource "null_resource" "base_image" {
 depends_on = [
    openstack_networking_router_interface_v2.router_interface_1
  ]
  provisioner "local-exec" {
    command = "packer build -var 'source_image=${var.image_id}' -var 'networks=[${openstack_networking_network_v2.network_1.id}]' -var 'flavor=${var.flavor_id}'  -var 'image_name=${var.base_image_name}' -var 'script=./cloud-inits/base_image.sh'  packer.json"

  }
}


resource "null_resource" "wordpress_image" {

  provisioner "local-exec" {
    command = "packer build -var 'source_image=${var.image_id}' -var 'networks=[${openstack_networking_network_v2.network_1.id}]' -var 'flavor=${var.flavor_id}'  -var 'image_name=${var.wordpress_image_name}' -var 'script=./cloud-inits/wordpress.sh' packer.json"

  }
}



