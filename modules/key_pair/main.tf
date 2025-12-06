# نولّد SSH key جديد كل مرة (آمن ومش محتاج تديره يدوي)
resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# نرفع الـ public key على AWS
resource "aws_key_pair" "this" {
  key_name   = var.key_name_prefix
  public_key = tls_private_key.this.public_key_openssh

  tags = {
    Name = var.key_name_prefix
  }
}

# نحفظ الـ private key على جهازك عشان تستخدمها في GitHub Actions بعدين
resource "local_file" "private_key" {
  content         = tls_private_key.this.private_key_pem
  filename        = "${path.module}/../../${var.key_name_prefix}.pem"
  file_permission = "0600"
}