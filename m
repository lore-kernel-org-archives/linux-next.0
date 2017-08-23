From: John Johansen <john.johansen@canonical.com>
Subject: [PATCH] apparmor: fix build failure on sparc caused by undeclared,
 signals
Date: Wed, 23 Aug 2017 12:21:43 -0700
Message-ID: <40445189-181f-fc19-3c44-8fa2ab23d2f9@canonical.com>
References: <20170823211213.0b014b1e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170823211213.0b014b1e@canb.auug.org.au>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, James Morris <jmorris@namei.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


  In file included from security/apparmor/ipc.c:23:0:
  security/apparmor/include/sig_names.h:26:3: error: 'SIGSTKFLT' undeclared here (not in a function)
    [SIGSTKFLT] = 16, /* -, 16, - */
     ^
  security/apparmor/include/sig_names.h:26:3: error: array index in initializer not of integer type
  security/apparmor/include/sig_names.h:26:3: note: (near initialization for 'sig_map')
  security/apparmor/include/sig_names.h:51:3: error: 'SIGUNUSED' undeclared here (not in a function)
    [SIGUNUSED] = 34, /* -, 31, - */
     ^
  security/apparmor/include/sig_names.h:51:3: error: array index in initializer not of integer type
  security/apparmor/include/sig_names.h:51:3: note: (near initialization for 'sig_map')

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: c6bf1adaecaa ("apparmor: add the ability to mediate signals")
Signed-off-by: John Johansen <john.johansen@canonical.com>
---
 security/apparmor/include/sig_names.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/security/apparmor/include/sig_names.h b/security/apparmor/include/sig_names.h
index 0d4395f231ca..92e62fe95292 100644
--- a/security/apparmor/include/sig_names.h
+++ b/security/apparmor/include/sig_names.h
@@ -23,7 +23,9 @@ static const int sig_map[MAXMAPPED_SIG] = {
 	[SIGPIPE] = 13,
 	[SIGALRM] = 14,
 	[SIGTERM] = 15,
+#ifdef SIGSTKFLT
 	[SIGSTKFLT] = 16,	/* -, 16, - */
+#endif
 	[SIGCHLD] = 17,		/* 20, 17, 18.  SIGCHLD -, -, 18 */
 	[SIGCONT] = 18,		/* 19, 18, 25 */
 	[SIGSTOP] = 19,		/* 17, 19, 23 */
@@ -47,7 +49,8 @@ static const int sig_map[MAXMAPPED_SIG] = {
 #if defined(SIGLOST) && SIGPWR != SIGLOST		/* sparc */
 	[SIGLOST] = 33,		/* unused on Linux */
 #endif
-#if defined(SIGLOST) && defined(SIGSYS) && SIGLOST != SIGSYS
+#if defined(SIGUNUSED) && \
+    defined(SIGLOST) && defined(SIGSYS) && SIGLOST != SIGSYS
 	[SIGUNUSED] = 34,	/* -, 31, - */
 #endif
 };
-- 
2.11.0
