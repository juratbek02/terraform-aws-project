module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"

  # Autoscaling group
  name = "my-asg"

  min_size                  = 1
  max_size                  = 99
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier       = module.vpc.public_subnets




  # Launch template
  launch_template_name        = "example-asg"
  launch_template_description = "Launch template example"
  update_default_version      = true

  image_id          = "ami-ebd02392"
  instance_type     = "t3.micro"
  ebs_optimized     = true
  enable_monitoring = true
}