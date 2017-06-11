From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Subject: [PATCH v1 0/2] Fix kselftest_harness regression
Date: Sun, 11 Jun 2017 14:32:56 +0200
Message-ID: <20170611123258.19624-1-mic@digikod.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Andy Lutomirski <luto@amacapital.net>, Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, Will Drewry <wad@chromium.org>, linux-kselftest@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

In the linux-next tree, commit f3380b7b8a72 ("selftests: kselftest_harness: fix
compile warnings") changes the test behavior when a test goes wrong.  Instead,
the error handler is called when a test succeed.

Mickaël Salaün (2):
  Revert "selftests: kselftest_harness: fix compile warnings"
  selftests: kselftest_harness: Fix compile warning

 tools/testing/selftests/kselftest_harness.h   | 3 +--
 tools/testing/selftests/seccomp/seccomp_bpf.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

-- 
2.11.0
