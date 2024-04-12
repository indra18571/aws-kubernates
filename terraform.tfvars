vpc-name          = "custom"
vpc-cidr          = "10.0.0.0/20"
ig-name           = "custom"
public-sg-name    = "public-sg"
private-sg-name   = "private-sg"
public-rt-name    = "public-rt"
private-rt-name   = "private-rt"
default-nacl-name = "public-nacl"
private-nacl-name = "private-nacl"
anywhere-cidr     = "0.0.0.0/0"
public-cidr       = "10.0.0.0/24"
private-cidr      = "10.0.1.0/24"


public-name = "public-subnet"
public-subnets = {
  subnet1 = {
    name = "public1"
    cidr = "10.0.0.0/24"
    az   = "eu-west-2a"
  },
  subnet2 = {
    name = "public2"
    cidr = "10.0.1.0/24"
    az   = "eu-west-2b"
  }
  
}

