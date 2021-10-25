






resource "null_resource" "base-image" {

  depends_on = [
    openstack_networking_subnet_v2.subnet_1
  ]
  provisioner "local-exec" {
    command = "packer build -var 'source_image=${var.image_id}' -var 'networks=[${openstack_networking_network_v2.network_1.id}]' -var 'flavor=${var.flavor_id}'  -var 'image_name=${var.base_image_name}' -var 'script=./cloud-inits/base_image.sh'  packer.json"

  }
}

# Find the image id from the base_image
data "openstack_images_image_v2" "base_image_id" {
  name        = var.base_image_name
  most_recent = true

  depends_on = [null_resource.base-image]
  properties = {
    key = "value"
  }
}

resource "null_resource" "wordpress-image" {

  depends_on = [
    null_resource.base-image
  ]
  provisioner "local-exec" {
    command = "packer build -var 'source_image=${data.openstack_images_image_v2.base_image_id.id}' -var 'networks=[${openstack_networking_network_v2.network_1.id}]' -var 'flavor=${var.flavor_id}'  -var 'image_name=${var.wordpress_image_name}' -var 'script=./cloud-inits/wordpress.sh' packer.json"

  }
}



