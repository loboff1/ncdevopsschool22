zone                  = "europe-west2-a"
machine_type          = "e2-small"
network               = "default"
ssh_user              = "lobofffailodrom"
main_tags             = ["tcp-5000", "tcp-8080"]
registry_tags         = ["tcp-8080"]
registry_network_ip   = "10.128.0.5"
registry_nat_ip       = "35.225.221.195"

