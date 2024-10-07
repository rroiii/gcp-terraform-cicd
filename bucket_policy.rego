package terraform

import input as tfplan

deny[msg] {
    resource := tfplan.resource_changes[_]
    resource.type == "google_storage_bucket"
    
    not resource.change.after.public_access_prevention
    msg := sprintf("Bucket %v is missing public_access_prevention", [resource.change.after.name])
} {
    resource := tfplan.resource_changes[_]
    resource.type == "google_storage_bucket"
    
    resource.change.after.public_access_prevention != "enforced"
    msg := sprintf("Bucket %v must have public_access_prevention set to 'enforced', current value: %v", [resource.change.after.name, resource.change.after.public_access_prevention])
}

# This rule will always print the structure of the first google_storage_bucket resource for debugging
print_bucket_info[msg] {
    resource := tfplan.resource_changes[_]
    resource.type == "google_storage_bucket"
    
    msg := sprintf("Debug info for bucket %v: %v", [resource.change.after.name, resource.change.after])
}