package terraform.s3

deny[msg] {
    input.resource_changes[change]
    change.type == "aws_s3_bucket"

    # Check if server-side encryption is not enabled
    not change.change.after.server_side_encryption_configuration.rule[0].apply_server_side_encryption_by_default.sse_algorithm == "aws:kms"

    msg = "S3 bucket does not have server-side encryption using KMS enabled."
}
