#!/usr/bin/env bash
# Test suite for bin/git-uptodate

set -euo pipefail

GIT_UPTODATE="$(cd "$(dirname "$0")/../../bin" && pwd)/git-uptodate"

GREEN=$(tput setaf 2 2>/dev/null || echo '')
RED=$(tput setaf 1 2>/dev/null || echo '')
NC=$(tput sgr0 2>/dev/null || echo '')

pass() {
    echo -e "${GREEN}✓${NC} $1"
}

fail() {
    echo -e "${RED}✗${NC} $1"
    exit 1
}

TEST_TMPDIR=$(mktemp -d "${TMPDIR:-/tmp}/git-uptodate-test.XXXXXX")
trap 'rm -rf "${TEST_TMPDIR}"' EXIT

git -C "${TEST_TMPDIR}" init --bare remote.git >/dev/null 2>&1
git -C "${TEST_TMPDIR}" clone remote.git repo >/dev/null 2>&1
git -C "${TEST_TMPDIR}/repo" config user.email test@example.com
git -C "${TEST_TMPDIR}/repo" config user.name Test

touch "${TEST_TMPDIR}/repo/main.txt"
git -C "${TEST_TMPDIR}/repo" add main.txt
git -C "${TEST_TMPDIR}/repo" commit -m "Initial commit" >/dev/null
git -C "${TEST_TMPDIR}/repo" push -u origin HEAD:main >/dev/null 2>&1

git -C "${TEST_TMPDIR}/repo" checkout -b feat/missing-upstream >/dev/null 2>&1
touch "${TEST_TMPDIR}/repo/feature.txt"
git -C "${TEST_TMPDIR}/repo" add feature.txt
git -C "${TEST_TMPDIR}/repo" commit -m "Feature commit" >/dev/null
git -C "${TEST_TMPDIR}/repo" push -u origin feat/missing-upstream >/dev/null 2>&1
git -C "${TEST_TMPDIR}/repo" push origin :feat/missing-upstream >/dev/null 2>&1

output=$("${GIT_UPTODATE}" "${TEST_TMPDIR}/repo" 2>&1)
if [[ "${output}" == *"fatal: ambiguous argument"* ]] ; then
    fail "Missing upstream does not call rev-list with an invalid ref: got '${output}'"
fi
if [[ "${output}" == *"feat/missing-upstream"* ]] && [[ "${output}" == *"[missing upstream]"* ]] ; then
    pass "Missing upstream is reported without rev-list errors"
else
    fail "Missing upstream output: got '${output}'"
fi

echo -e "\n${GREEN}All tests passed!${NC}"
