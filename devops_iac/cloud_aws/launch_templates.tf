resource "aws_launch_template" "frontend_host" {
  image_id               = var.ami_id
  instance_type          = var.EC2_TYPE
  vpc_security_group_ids = [aws_security_group.front_instance_security_group.id]
  key_name               = aws_key_pair.vhjt_key.key_name

  /* user_data = base64encode(templatefile(var.common_start_sh_path, {
    run = "sudo docker run -p 8080:8080 --restart=always -d -e PORT=8080 -e AUTH_API_ADDRESS=http://${aws_instance.host-auth.private_ip}:8000 -e TODOS_API_ADDRESS=http://${aws_instance.todos_host.private_ip}:8082 victoremilio/devops_rampup_front:1.0"
  })) */

  tag_specifications {
    resource_type = "volume"

    tags = {
      project     = var.project,
      responsible = var.responsible
    }
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      project     = var.project,
      responsible = var.responsible,
      Name        = "frontend_host"
    }
  }

}
