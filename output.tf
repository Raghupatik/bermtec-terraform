# output "instance_id_list" {
#   description = "Resource Id"
#   value       = ["${aws_instance.terraform_wapp.*.id}"]
# }

# output "Ec2_public_ip" {
#   description = "Resource Id"
#   value       = ["${aws_instance.terraform_wapp.*.public_ip}"]
# }

# output "my_security_group" {
#   description = "SG"
#   value       = ["${aws_security_group.my_security_group.id}"]
# }

# output "bucketid" {
#   value = aws_s3_bucket.blah.id
#   description = "output value of bucket name after execution"
# }


# output "bucket_domain_name" {
#   value = aws_s3_bucket.blah.bucket_domain_name
#   description = "output value of bucket name after execution"
# }