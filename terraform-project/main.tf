terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}



resource "docker_image" "demo" {
  name         = "jinmingli/mydemo:v1"
  keep_locally = false
}


resource "docker_container" "mydemo" {
  image = "jinmingli/mydemo:v1"
  name  = "mydemo"
  ports{
    internal="8080"
    external="8080"
  }
  }
