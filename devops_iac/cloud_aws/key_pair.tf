resource "aws_key_pair" "vhjt_key" {
  key_name   = "vhjt_key"
  public_key = file(var.public_key_path)
}
