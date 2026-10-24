version = "v1"

# tera-init: this file is authored by `tera init`.
# Delete the line above to take ownership: a later run then leaves this file
# alone and reports the difference instead of rewriting it.
#
# ── A derived type: what this repository changes about a shared kind of work ──
#
# `tera init --use-case dev-pipeline`, for the harness it dispatches on, wrote this type over its base. The type is
# the base with the attributes below substituted in: each one declared here
# replaces the base's whole value, and everything else is the base's — its
# harness, its inputs, its instructions, its postconditions — and follows an
# edit to the base with no edit here. `tera workorder types <name>`
# shows, attribute by attribute, which came from where.
#
# The base's contract (input_schema, output_schema, postconditions, tags and
# the other attributes a derived type may not declare) cannot be declared
# here: a different contract is a different type.

work_order_type "gs-ci" {
  based_on    = "plugin.dev-pipeline/work-order-types/dev-filer-task"
  description = "Implement and review changes to tally, a dependency-free Go CLI that counts words and lines; make check (go vet + go test) is the whole gate."

  # This repository implied no declared toolchain when it was resolved, so the
  # requirement is the base's. Declaring toolchains here replaces the base's
  # list as a whole.
}
# tera-init-digest: sha256:bb42e5de9f536c00cd10caff2568af64e51f639e93c367c6a8b1c3108f099365 (edit this file and it is yours: init then replaces it only with --force <path>)
