From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: [PATCH v2 3/6] test_sysctl: test against PAGE_SIZE for int
Date: Fri, 30 Jun 2017 15:44:28 -0700
Message-ID: <20170630224431.17374-4-mcgrof@kernel.org>
References: <20170629123527.2196820e70818aeab51338e5@linux-foundation.org>
 <20170630224431.17374-1-mcgrof@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170630224431.17374-1-mcgrof@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org
Cc: keescook@chromium.org, shuahkh@osg.samsung.com, shuah@kernel.org, sfr@canb.auug.org.au, orson.zhai@linaro.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>
List-Id: linux-next.vger.kernel.org

Add the following tests to ensure we do not regress:

  o Test using a buffer full of space (PAGE_SIZE-1) followed by a
    single digit works

  o Test using a buffer full of spaces (PAGE_SIZE or over) will fail

As tests increase instead of unloading the module and reloading it
we can just do a shell reset_vals() with a reset to values we know
are set at init on the driver.

Cc: Kees Cook <keescook@chromium.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Shuah Khan <shuah@kernel.org>
Signed-off-by: Luis R. Rodriguez <mcgrof@kernel.org>
---
 tools/testing/selftests/sysctl/sysctl.sh | 66 ++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tools/testing/selftests/sysctl/sysctl.sh b/tools/testing/selftests/sysctl/sysctl.sh
index cbe1345d7c1d..6ec807576f7c 100755
--- a/tools/testing/selftests/sysctl/sysctl.sh
+++ b/tools/testing/selftests/sysctl/sysctl.sh
@@ -75,6 +75,13 @@ function check_production_sysctl_writes_strict()
 			echo "1" > ${WRITES_STRICT}
 		fi
 	fi
+
+	if [ -z $PAGE_SIZE ]; then
+		PAGE_SIZE=$(getconf PAGESIZE)
+	fi
+	if [ -z $MAX_DIGITS ]; then
+		MAX_DIGITS=$(($PAGE_SIZE/8))
+	fi
 }
 
 test_reqs()
@@ -89,6 +96,10 @@ test_reqs()
 		echo "$0: You need perl installed"
 		exit 1
 	fi
+	if ! which getconf 2> /dev/null > /dev/null; then
+		echo "$0: You need getconf installed"
+		exit 1
+	fi
 }
 
 function load_req_mod()
@@ -103,6 +114,23 @@ function load_req_mod()
 	fi
 }
 
+reset_vals()
+{
+	VAL=""
+	TRIGGER=$(basename ${TARGET})
+	case "$TRIGGER" in
+		int_0001)
+			VAL="60"
+			;;
+		string_0001)
+			VAL="(none)"
+			;;
+		*)
+			;;
+	esac
+	echo -n $VAL > $TARGET
+}
+
 set_orig()
 {
 	if [ ! -z $TARGET ]; then
@@ -229,7 +257,42 @@ run_numerictests()
 	else
 		echo "ok"
 	fi
+	test_rc
+}
+
+# Your test must accept digits 3 and 4 to use this
+run_limit_digit()
+{
+	echo -n "Checking ignoring spaces up to PAGE_SIZE works on write ..."
+	reset_vals
 
+	LIMIT=$((MAX_DIGITS -1))
+	TEST_STR="3"
+	(perl -e 'print " " x '$LIMIT';'; echo "${TEST_STR}") | \
+		dd of="${TARGET}" 2>/dev/null
+
+	if ! verify "${TARGET}"; then
+		echo "FAIL" >&2
+		rc=1
+	else
+		echo "ok"
+	fi
+	test_rc
+
+	echo -n "Checking passing PAGE_SIZE of spaces fails on write ..."
+	reset_vals
+
+	LIMIT=$((MAX_DIGITS))
+	TEST_STR="4"
+	(perl -e 'print " " x '$LIMIT';'; echo "${TEST_STR}") | \
+		dd of="${TARGET}" 2>/dev/null
+
+	if verify "${TARGET}"; then
+		echo "FAIL" >&2
+		rc=1
+	else
+		echo "ok"
+	fi
 	test_rc
 }
 
@@ -305,15 +368,18 @@ run_stringtests()
 sysctl_test_0001()
 {
 	TARGET="${SYSCTL}/int_0001"
+	reset_vals
 	ORIG=$(cat "${TARGET}")
 	TEST_STR=$(( $ORIG + 1 ))
 
 	run_numerictests
+	run_limit_digit
 }
 
 sysctl_test_0002()
 {
 	TARGET="${SYSCTL}/string_0001"
+	reset_vals
 	ORIG=$(cat "${TARGET}")
 	TEST_STR="Testing sysctl"
 	# Only string sysctls support seeking/appending.
-- 
2.11.0
