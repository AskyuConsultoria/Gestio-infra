resource "aws_key_pair" "main-public" {
  key_name   = "pbkey-ges"
  public_key = file("~/.ssh/pbkey-ges.pub")
}

resource "aws_key_pair" "main-private" {
  key_name   = "pvkey-ges"
  public_key = file("~/.ssh/pvkey-ges.pub")
}