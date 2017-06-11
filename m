From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Subject: [PATCH v1 1/2] Revert "selftests: kselftest_harness: fix compile warnings"
Date: Sun, 11 Jun 2017 14:32:57 +0200
Message-ID: <20170611123258.19624-2-mic@digikod.net>
References: <20170611123258.19624-1-mic@digikod.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170611123258.19624-1-mic@digikod.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Andy Lutomirski <luto@amacapital.net>, Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, Will Drewry <wad@chromium.org>, linux-kselftest@vger.kernel.org, linux-next@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>
List-Id: linux-next.vger.kernel.org

This reverts commit f3380b7b8a72f435daceb49f7f7513f3ea2ce5ea.

The OPTIONAL_HANDLER macro, called by all ASSERT_* and EXPECT_* macros,
must support an optional error handler. This is done with an optional
block after the "for" loop.

This enable to pass 52/52 seccomp-bpf tests instead of 42/52.

Signed-off-by: Mickaël Salaün <mic@digikod.net>
Cc: Andy Lutomirski <luto@amacapital.net>
Cc: Kees Cook <keescook@chromium.org>
Cc: Shuah Khan <shuahkh@osg.samsung.com>
Cc: Will Drewry <wad@chromium.org>
---
 tools/testing/selftests/kselftest_harness.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 432245faeab3..c56f72e07cd7 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -555,8 +555,7 @@
  * return while still providing an optional block to the API consumer.
  */
 #define OPTIONAL_HANDLER(_assert) \
-	for (; _metadata->trigger;  _metadata->trigger = __bail(_assert)) \
-		;
+	for (; _metadata->trigger;  _metadata->trigger = __bail(_assert))
 
 #define __EXPECT(_expected, _seen, _t, _assert) do { \
 	/* Avoid multiple evaluation of the cases */ \
-- 
2.11.0
