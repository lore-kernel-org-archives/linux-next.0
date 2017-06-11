From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Subject: [PATCH v1 2/2] selftests: kselftest_harness: Fix compile warning
Date: Sun, 11 Jun 2017 14:32:58 +0200
Message-ID: <20170611123258.19624-3-mic@digikod.net>
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

Do not confuse the compiler with a semicolon preceding a block. Replace
the semicolon with an empty block to avoid a warning:

  gcc -Wl,-no-as-needed -Wall -lpthread seccomp_bpf.c -o /.../linux/tools/testing/selftests/seccomp/seccomp_bpf
  In file included from seccomp_bpf.c:40:0:
  seccomp_bpf.c: In function ‘change_syscall’:
  ../kselftest_harness.h:558:2: warning: this ‘for’ clause does not guard... [-Wmisleading-indentation]
    for (; _metadata->trigger;  _metadata->trigger = __bail(_assert))
    ^
  ../kselftest_harness.h:574:14: note: in expansion of macro ‘OPTIONAL_HANDLER’
   } while (0); OPTIONAL_HANDLER(_assert)
                ^~~~~~~~~~~~~~~~
  ../kselftest_harness.h:440:2: note: in expansion of macro ‘__EXPECT’
    __EXPECT(expected, seen, ==, 0)
    ^~~~~~~~
  seccomp_bpf.c:1313:2: note: in expansion of macro ‘EXPECT_EQ’
    EXPECT_EQ(0, ret);
    ^~~~~~~~~
  seccomp_bpf.c:1317:2: note: ...this statement, but the latter is misleadingly indented as if it is guarded by the ‘for’
    {
    ^

Signed-off-by: Mickaël Salaün <mic@digikod.net>
Cc: Andy Lutomirski <luto@amacapital.net>
Cc: Kees Cook <keescook@chromium.org>
Cc: Shuah Khan <shuahkh@osg.samsung.com>
Cc: Will Drewry <wad@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 7ba94efb24fd..18dad07ae16b 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1310,7 +1310,7 @@ void change_syscall(struct __test_metadata *_metadata,
 	iov.iov_len = sizeof(regs);
 	ret = ptrace(PTRACE_GETREGSET, tracee, NT_PRSTATUS, &iov);
 #endif
-	EXPECT_EQ(0, ret);
+	EXPECT_EQ(0, ret) {}
 
 #if defined(__x86_64__) || defined(__i386__) || defined(__powerpc__) || \
     defined(__s390__) || defined(__hppa__)
-- 
2.11.0
