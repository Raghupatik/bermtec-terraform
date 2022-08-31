output "instance_id_list" {
  description = "Resource Id"
  value       = ["${aws_instance.terraform_wapp.*.id}"]
}

output "Ec2_public_ip" {
  description = "Resource Id"
  value       = ["${aws_instance.terraform_wapp.*.public_ip}"]
}