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


resource "docker_network" "private_network" {
  name = "my_network"
  driver="bridge"
}

resource "docker_image" "zookeeper" {
  name         = "bitnami/zookeeper:latest"
  keep_locally = false
}

resource "docker_image" "kafka" {
  name         = "bitnami/kafka:latest"
  keep_locally = false
}

resource "docker_container" "myzookeeper" {
  image = "bitnami/zookeeper:latest"
  name  = "test-zookeeper"
  ports {
    internal = 2181
    external = 2181
  }
  networks_advanced {
    name="${docker_network.private_network.name}"
  }
  env=["ALLOW_ANONYMOUS_LOGIN=yes","ALLOW_PLAINTEXT_LISTENER=yes"]
  }

  resource "docker_container" "mykafka" {
  image = "bitnami/kafka:latest"
  name  = "kafka"
  ports {
    internal = 9092
    external = 9092
  }
    networks_advanced {
    name="${docker_network.private_network.name}"
  }
  env=["KAFKA_CFG_ZOOKEEPER_CONNECT=${docker_container.myzookeeper.name}:2181","ALLOW_PLAINTEXT_LISTENER=yes"]
  }

