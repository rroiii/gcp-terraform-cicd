package terraform

import input as tfplan

deny[msg] {
    resource := tfplan.resource_changes[_]
    resource.type == "google_storage_bucket"
    resource.change.after.public_access_prevention != "enforced"
    
    msg := sprintf("Bucket %v must have public_access_prevention set to 'enforced'", [resource.change.after.name])
}