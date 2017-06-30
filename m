From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: [PATCH v2 6/6] test_sysctl: test against int proc_dointvec() array support
Date: Fri, 30 Jun 2017 15:44:31 -0700
Message-ID: <20170630224431.17374-7-mcgrof@kernel.org>
References: <20170629123527.2196820e70818aeab51338e5@linux-foundation.org>
 <20170630224431.17374-1-mcgrof@kernel.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753275AbdF3Woh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Jun 2017 18:44:37 -0400
In-Reply-To: <20170630224431.17374-1-mcgrof@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: keescook@chromium.org, shuahkh@osg.samsung.com, shuah@kernel.org, sfr@canb.auug.org.au, orson.zhai@linaro.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>

Add a few initial respective tests for an array:

  o Echoing values separated by spaces works
  o Echoing only first elements will set first elements
  o Confirm PAGE_SIZE limit still applies even if an array is used

Cc: Kees Cook <keescook@chromium.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Shuah Khan <shuah@kernel.org>
Signed-off-by: Luis R. Rodriguez <mcgrof@kernel.org>
---
 lib/test_sysctl.c                        | 13 +++++
 tools/testing/selftests/sysctl/sysctl.sh | 89 ++++++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/lib/test_sysctl.c b/lib/test_sysctl.c
index 53db3513ab08..3dd801c1c85b 100644
--- a/lib/test_sysctl.c
+++ b/lib/test_sysctl.c
@@ -42,6 +42,7 @@ static int i_one_hundred = 100;
 struct test_sysctl_data {
 	int int_0001;
 	int int_0002;
+	int int_0003[4];
 
 	unsigned int uint_0001;
 
@@ -52,6 +53,11 @@ static struct test_sysctl_data test_data = {
 	.int_0001 = 60,
 	.int_0002 = 1,
 
+	.int_0003[0] = 0,
+	.int_0003[1] = 1,
+	.int_0003[2] = 2,
+	.int_0003[3] = 3,
+
 	.uint_0001 = 314,
 
 	.string_0001 = "(none)",
@@ -76,6 +82,13 @@ static struct ctl_table test_table[] = {
 		.proc_handler	= proc_dointvec,
 	},
 	{
+		.procname	= "int_0003",
+		.data		= &test_data.int_0003,
+		.maxlen		= sizeof(test_data.int_0003),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec,
+	},
+	{
 		.procname	= "uint_0001",
 		.data		= &test_data.uint_0001,
 		.maxlen		= sizeof(unsigned int),
diff --git a/tools/testing/selftests/sysctl/sysctl.sh b/tools/testing/selftests/sysctl/sysctl.sh
index abeef675a884..ec232c3cfcaa 100755
--- a/tools/testing/selftests/sysctl/sysctl.sh
+++ b/tools/testing/selftests/sysctl/sysctl.sh
@@ -33,6 +33,7 @@ ALL_TESTS="0001:1:1"
 ALL_TESTS="$ALL_TESTS 0002:1:1"
 ALL_TESTS="$ALL_TESTS 0003:1:1"
 ALL_TESTS="$ALL_TESTS 0004:1:1"
+ALL_TESTS="$ALL_TESTS 0005:3:1"
 
 test_modprobe()
 {
@@ -108,6 +109,10 @@ test_reqs()
 		echo "$0: You need getconf installed"
 		exit 1
 	fi
+	if ! which diff 2> /dev/null > /dev/null; then
+		echo "$0: You need diff installed"
+		exit 1
+	fi
 }
 
 function load_req_mod()
@@ -167,6 +172,12 @@ verify()
 	return 0
 }
 
+verify_diff_w()
+{
+	echo "$TEST_STR" | diff -q -w -u - $1
+	return $?
+}
+
 test_rc()
 {
 	if [[ $rc != 0 ]]; then
@@ -352,6 +363,74 @@ run_limit_digit_int()
 	test_rc
 }
 
+# You used an int array
+run_limit_digit_int_array()
+{
+	echo -n "Testing array works as expected ... "
+	TEST_STR="4 3 2 1"
+	echo -n $TEST_STR > $TARGET
+
+	if ! verify_diff_w "${TARGET}"; then
+		echo "FAIL" >&2
+		rc=1
+	else
+		echo "ok"
+	fi
+	test_rc
+
+	echo -n "Testing skipping trailing array elements works ... "
+	# Do not reset_vals, carry on the values from the last test.
+	# If we only echo in two digits the last two are left intact
+	TEST_STR="100 101"
+	echo -n $TEST_STR > $TARGET
+	# After we echo in, to help diff we need to set on TEST_STR what
+	# we expect the result to be.
+	TEST_STR="100 101 2 1"
+
+	if ! verify_diff_w "${TARGET}"; then
+		echo "FAIL" >&2
+		rc=1
+	else
+		echo "ok"
+	fi
+	test_rc
+
+	echo -n "Testing PAGE_SIZE limit on array works ... "
+	# Do not reset_vals, carry on the values from the last test.
+	# Even if you use an int array, you are still restricted to
+	# MAX_DIGITS, this is a known limitation. Test limit works.
+	LIMIT=$((MAX_DIGITS -1))
+	TEST_STR="9"
+	(perl -e 'print " " x '$LIMIT';'; echo "${TEST_STR}") | \
+		dd of="${TARGET}" 2>/dev/null
+
+	TEST_STR="9 101 2 1"
+	if ! verify_diff_w "${TARGET}"; then
+		echo "FAIL" >&2
+		rc=1
+	else
+		echo "ok"
+	fi
+	test_rc
+
+	echo -n "Testing exceeding PAGE_SIZE limit fails as expected ... "
+	# Do not reset_vals, carry on the values from the last test.
+	# Now go over limit.
+	LIMIT=$((MAX_DIGITS))
+	TEST_STR="7"
+	(perl -e 'print " " x '$LIMIT';'; echo "${TEST_STR}") | \
+		dd of="${TARGET}" 2>/dev/null
+
+	TEST_STR="7 101 2 1"
+	if verify_diff_w "${TARGET}"; then
+		echo "FAIL" >&2
+		rc=1
+	else
+		echo "ok"
+	fi
+	test_rc
+}
+
 # You are using an unsigned int
 run_limit_digit_uint()
 {
@@ -512,6 +591,15 @@ sysctl_test_0004()
 	run_limit_digit_uint
 }
 
+sysctl_test_0005()
+{
+	TARGET="${SYSCTL}/int_0003"
+	reset_vals
+	ORIG=$(cat "${TARGET}")
+
+	run_limit_digit_int_array
+}
+
 list_tests()
 {
 	echo "Test ID list:"
@@ -524,6 +612,7 @@ list_tests()
 	echo "0002 x $(get_test_count 0002) - tests proc_dostring()"
 	echo "0003 x $(get_test_count 0003) - tests proc_dointvec()"
 	echo "0004 x $(get_test_count 0004) - tests proc_douintvec()"
+	echo "0005 x $(get_test_count 0005) - tests proc_douintvec() array"
 }
 
 test_reqs
-- 
2.11.0
