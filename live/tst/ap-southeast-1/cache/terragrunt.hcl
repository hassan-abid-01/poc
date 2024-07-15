include "state" {
  path = find_in_parent_folders("state.hcl")
}

include "module" {
    path = "${abspath(find_in_parent_folders("_env"))}/rds.hcl"
    expose = true
}

terraform {
  source = "${include.module.locals.source_base_url}"#add the specific version
}

#All the unique inputs here.