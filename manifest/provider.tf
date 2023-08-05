terraform {
  required_version = ">=1.0"
  required_provider {
     kubectl = {
        source = "gavinbunney/kubectl"
        version = ">= 1.7.0"
     }
  }
}