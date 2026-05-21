#!/usr/bin/env bash
# new-engagement.sh
# Bootstrap a new MOSAIC engagement folder from the templates.
#
# Usage:
#   ./scripts/new-engagement.sh <client-shortname> [--code MOS-NNNN] [--overlays "ID-FSI,GLOBAL-CARD"]
#
# Creates:
#   engagements/<client-shortname>/
#     ├── README.md                                (from engagements/_new-engagement/README.md, with token replacement)
#     ├── 01-frame/
#     │   ├── README.md
#     │   └── engagement-charter.md                (from templates/engagement-charter/)
#     ├── 02-capture/
#     │   ├── README.md
#     │   ├── cadre-register.md                    (from templates/cadre-register/)
#     │   └── cadre-register.csv
#     ├── 03-compose/
#     │   ├── README.md
#     │   ├── hld.md                               (from templates/hld/)
#     │   ├── lld.md                               (from templates/lld/)
#     │   └── adrs/
#     │       └── adr-template.md                  (from templates/adr/)
#     ├── 04-calibrate/
#     │   ├── README.md
#     │   ├── quality-scorecard.md                 (from templates/scorecard/)
#     │   └── fitness-calculator.csv
#     ├── 05-commit/
#     │   ├── README.md
#     │   ├── adrs/
#     │   └── operational-spec.md                  (from templates/operational-spec/)
#     └── 06-continue/
#         ├── README.md
#         ├── drift-reports/
#         │   └── drift-report-template.md         (from templates/drift-report/)
#         ├── change-requests/
#         └── audit-findings/

set -euo pipefail

# Locate the repo root (the folder containing this script's parent).
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

usage() {
  cat <<EOF
Usage: $0 <client-shortname> [--code MOS-NNNN] [--overlays "ID-FSI,GLOBAL-CARD"]

Arguments:
  <client-shortname>     kebab-case identifier for the engagement folder
                         (e.g., bank-sejahtera, acme-corp)

Options:
  --code MOS-NNNN        engagement code; written into the engagement README
  --overlays "X,Y"       comma-separated list of overlays to record in the README
  -h, --help             show this help and exit

Examples:
  $0 bank-sejahtera --code MOS-0042 --overlays "ID-FSI"
  $0 acme-corp --code MOS-0103 --overlays "EU-FIN,GLOBAL-CARD"
EOF
}

# Parse arguments.
CLIENT=""
CODE=""
OVERLAYS=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      usage
      exit 0
      ;;
    --code)
      CODE="${2:-}"
      shift 2
      ;;
    --overlays)
      OVERLAYS="${2:-}"
      shift 2
      ;;
    -*)
      echo "ERROR: unknown option: $1" >&2
      usage
      exit 2
      ;;
    *)
      if [[ -z "$CLIENT" ]]; then
        CLIENT="$1"
        shift
      else
        echo "ERROR: unexpected positional argument: $1" >&2
        usage
        exit 2
      fi
      ;;
  esac
done

if [[ -z "$CLIENT" ]]; then
  echo "ERROR: <client-shortname> is required." >&2
  usage
  exit 2
fi

# Validate kebab-case shortname.
if ! [[ "$CLIENT" =~ ^[a-z][a-z0-9-]*$ ]]; then
  echo "ERROR: client-shortname must be lowercase kebab-case (a-z, 0-9, hyphens). Got: $CLIENT" >&2
  exit 2
fi

TARGET="${REPO_ROOT}/engagements/${CLIENT}"

if [[ -e "$TARGET" ]]; then
  echo "ERROR: engagement folder already exists: $TARGET" >&2
  echo "       Delete or rename it first if you want to re-bootstrap." >&2
  exit 1
fi

echo "==> Bootstrapping engagement: ${CLIENT}"
echo "    Target: ${TARGET}"
[[ -n "$CODE" ]]     && echo "    Code:     ${CODE}"
[[ -n "$OVERLAYS" ]] && echo "    Overlays: ${OVERLAYS}"
echo

# 1. Create the directory skeleton.
mkdir -p "${TARGET}"/{01-frame,02-capture,03-compose/adrs,04-calibrate,05-commit/adrs,06-continue/drift-reports,06-continue/change-requests,06-continue/audit-findings}

# 2. Copy the scaffold READMEs.
SCAFFOLD="${REPO_ROOT}/engagements/_new-engagement"
cp "${SCAFFOLD}/README.md"               "${TARGET}/README.md"
cp "${SCAFFOLD}/01-frame/README.md"      "${TARGET}/01-frame/README.md"
cp "${SCAFFOLD}/02-capture/README.md"    "${TARGET}/02-capture/README.md"
cp "${SCAFFOLD}/03-compose/README.md"    "${TARGET}/03-compose/README.md"
cp "${SCAFFOLD}/04-calibrate/README.md"  "${TARGET}/04-calibrate/README.md"
cp "${SCAFFOLD}/05-commit/README.md"     "${TARGET}/05-commit/README.md"
cp "${SCAFFOLD}/06-continue/README.md"   "${TARGET}/06-continue/README.md"

# 3. Copy the templates into the right phase folders.
TPL="${REPO_ROOT}/templates"

cp "${TPL}/engagement-charter/engagement-charter.md"  "${TARGET}/01-frame/engagement-charter.md"

cp "${TPL}/cadre-register/cadre-register.md"          "${TARGET}/02-capture/cadre-register.md"
cp "${TPL}/cadre-register/cadre-register.csv"         "${TARGET}/02-capture/cadre-register.csv"
cp "${TPL}/cadre-register/README.md"                  "${TARGET}/02-capture/_template-notes.md"

cp "${TPL}/hld/hld-template.md"                       "${TARGET}/03-compose/hld.md"
cp "${TPL}/lld/lld-template.md"                       "${TARGET}/03-compose/lld.md"
cp "${TPL}/adr/adr-template.md"                       "${TARGET}/03-compose/adrs/adr-template.md"
cp "${TPL}/adr/README.md"                             "${TARGET}/03-compose/adrs/_README.md"

cp "${TPL}/scorecard/quality-scorecard.md"            "${TARGET}/04-calibrate/quality-scorecard.md"
cp "${TPL}/scorecard/fitness-calculator.csv"          "${TARGET}/04-calibrate/fitness-calculator.csv"

cp "${TPL}/operational-spec/operational-spec-template.md" "${TARGET}/05-commit/operational-spec.md"

cp "${TPL}/drift-report/drift-report-template.md"     "${TARGET}/06-continue/drift-reports/_template.md"

# 4. Token replacement in the top-level README.
README="${TARGET}/README.md"
# Use a portable sed -i pattern (works on both GNU and BSD sed).
sed_inplace() {
  local pattern="$1"
  local file="$2"
  if sed --version >/dev/null 2>&1; then
    sed -i -e "$pattern" "$file"
  else
    sed -i '' -e "$pattern" "$file"
  fi
}

sed_inplace "s/<CLIENT-SHORTNAME>/${CLIENT}/g" "$README"
[[ -n "$CODE" ]]     && sed_inplace "s/_MOS-NNNN_/${CODE}/g" "$README"
[[ -n "$OVERLAYS" ]] && sed_inplace "s|_e.g., ID-FSI v1.1, GLOBAL-CARD v1.1_|${OVERLAYS}|g" "$README"

# 4b. Path rewrites in copied template files so links resolve from the engagement folder.
# Templates live at templates/<area>/<file>.md (2 levels up to repo root). Engagement files live
# at engagements/<name>/<phase>/<file>.md (3 levels up). For nested subfolders, 4 levels up.

# 01-frame/engagement-charter.md
sed_inplace 's|(\.\./\.\./docs/|(\.\./\.\./\.\./docs/|g'         "${TARGET}/01-frame/engagement-charter.md"
sed_inplace 's|(\.\./\.\./overlays/|(\.\./\.\./\.\./overlays/|g' "${TARGET}/01-frame/engagement-charter.md"

# 02-capture/_template-notes.md (was templates/cadre-register/README.md)
sed_inplace 's|(\.\./\.\./docs/|(\.\./\.\./\.\./docs/|g' "${TARGET}/02-capture/_template-notes.md"

# 03-compose/hld.md
sed_inplace 's|(\.\./engagement-charter/engagement-charter\.md|(\.\./01-frame/engagement-charter.md|g' "${TARGET}/03-compose/hld.md"
sed_inplace 's|(\.\./lld/lld-template\.md|(lld.md|g'              "${TARGET}/03-compose/hld.md"
sed_inplace 's|(\.\./\.\./patterns/|(\.\./\.\./\.\./patterns/|g'  "${TARGET}/03-compose/hld.md"

# 03-compose/lld.md
sed_inplace 's|(\.\./hld/hld-template\.md|(hld.md|g' "${TARGET}/03-compose/lld.md"

# 03-compose/adrs/_README.md (nested one level deeper)
sed_inplace 's|(adr-0001-example\.md)|(../../../../templates/adr/adr-0001-example.md)|g' "${TARGET}/03-compose/adrs/_README.md"
sed_inplace 's|(\.\./\.\./docs/|(\.\./\.\./\.\./\.\./docs/|g'    "${TARGET}/03-compose/adrs/_README.md"

# 04-calibrate/quality-scorecard.md
sed_inplace 's|(\.\./\.\./docs/|(\.\./\.\./\.\./docs/|g' "${TARGET}/04-calibrate/quality-scorecard.md"
sed_inplace 's|(\.\./engagement-charter/engagement-charter\.md|(\.\./01-frame/engagement-charter.md|g' "${TARGET}/04-calibrate/quality-scorecard.md"

# 05-commit/operational-spec.md
sed_inplace 's|(\.\./\.\./docs/|(\.\./\.\./\.\./docs/|g'     "${TARGET}/05-commit/operational-spec.md"
sed_inplace 's|(\.\./drift-report/drift-report-template\.md|(\.\./06-continue/drift-reports/_template.md|g' "${TARGET}/05-commit/operational-spec.md"

# 5. Add a .gitkeep to empty leaf directories so git tracks them.
touch "${TARGET}/05-commit/adrs/.gitkeep"
touch "${TARGET}/06-continue/change-requests/.gitkeep"
touch "${TARGET}/06-continue/audit-findings/.gitkeep"

echo "==> Done."
echo
echo "Engagement scaffold created at: ${TARGET}"
echo
echo "Next steps:"
echo "  1. cd engagements/${CLIENT}"
echo "  2. Open 01-frame/engagement-charter.md and fill it out."
echo "  3. Negotiate pillar weights with the sponsor; record them in the charter (§8)."
echo "  4. Commit your charter draft early; iterate in branches if useful."
echo
echo "When ready to advance phases, work through:"
echo "  01-frame  →  02-capture  →  03-compose  →  04-calibrate  →  05-commit  →  06-continue"
