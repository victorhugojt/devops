resource "aws_key_pair" "vhjt_key" {
  key_name   = "vhjt_key"
  public_key = file("/Users/victor.jimenezt/ssh-keys/vjimenezt_public_key.public")
}
