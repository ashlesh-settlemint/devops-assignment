data "kubectl_file_document" "docs" {
    content = file("./deployment.yaml")
}

resource "kubectl_manifest" "test" {
    count       = length(data.kubectl_file_document.docs.documents)
    yaml_body   = element(data.kubectl_file_document.docs.documents, count.index)
    wait_for_rollout  = false
    force_new   = true
}