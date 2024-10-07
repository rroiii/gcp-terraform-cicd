package terraform

import input.planned_values as tfplan

deny[msg] {
    bucket := tfplan.root_module.resources[_]
    bucket.type == "google_storage_bucket"
    bucket.values.public_access_prevention != "enforced"
    msg := sprintf("Bucket %v must have public_access_prevention set to 'enforced'", [bucket.values.name])
}