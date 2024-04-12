vpc-name          = "kubernates-project"
vpc-cidr          = "10.1.0.0/20"
ig-name           = "custom"
public-sg-name    = "kuber-public"
private-sg-name   = "kuber-private"
public-rt-name    = "kuber-public"
private-rt-name   = "kuber-private"
default-nacl-name = "kuber-public"
private-nacl-name = "kuber-private"
anywhere-cidr     = "0.0.0.0/0"
public-cidr       = "10.1.0.0/24"
private-cidr      = "10.1.1.0/24"


public-name = "kuber-public"
public-subnets = {
  subnet1 = {
    name = "kuber-public1"
    cidr = "10.1.2.0/24"
    az   = "eu-west-2a"
  },
  subnet2 = {
    name = "kuber-public2"
    cidr = "10.1.3.0/24"
    az   = "eu-west-2b"
  }
  
}

