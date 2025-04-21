resource "null_resource" "cluster" {
  count = var.environment == "dev" ? 3 : 1
  provisioner "file" {
    source      = "user-data.sh"
    destination = "/tmp/user-data.sh"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("kops-key.pem")
      host        = element(aws_instance.public-instance.*.public_ip, count.index)

    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/user-data.sh",
      "sudo /tmp/user-data.sh",
      "sudo apt-update",
      "sudo apt install jq unzip -y",
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("kops-key.pem")
      host        = element(aws_instance.public-instance.*.public_ip, count.index)
    }

  }

}