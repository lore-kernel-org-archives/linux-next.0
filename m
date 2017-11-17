From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] mm: fix nodemask printing
Date: Fri, 17 Nov 2017 11:15:45 +0100
Message-ID: <20171117101545.119689-1-arnd@arndb.de>
References: <CAK8P3a39FmdV+8dpGZ2ZDM_NWWmUwn9wGW53omLFibfnCfaHOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:64054 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751418AbdKQKQJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Nov 2017 05:16:09 -0500
In-Reply-To: <CAK8P3a39FmdV+8dpGZ2ZDM_NWWmUwn9wGW53omLFibfnCfaHOQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zhangshaokun <zhangshaokun@hisilicon.com>, Arnd Bergmann <arnd@arndb.de>

The cleanup caused build warnings for constant mask pointers:

mm/mempolicy.c: In function ‘mpol_to_str’:
./include/linux/nodemask.h:108:11: warning: the comparison will always evaluate as ‘true’ for the address of ‘nodes’ will never be NULL [-Waddress]

An earlier workaround I suggested was incorporated in the version that
got merged, but that only solved the problem for gcc-7 and higher, while
gcc-4.6 through gcc-6.x still warn.

This changes the printing again to use inline functions that make it
clear to the compiler that the line that does the NULL check has no
idea whether the argument is a constant NULL.

Fixes: 0205f75571e3 ("mm: simplify nodemask printing")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I've done only minimal build testing on this, but did check it with
all compiler versions this time.
---
 include/linux/nodemask.h | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index 15cab3967d6d..1fbde8a880d9 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -104,9 +104,16 @@ extern nodemask_t _unused_nodemask_arg_;
  *
  * Can be used to provide arguments for '%*pb[l]' when printing a nodemask.
  */
-#define nodemask_pr_args(maskp)				\
-	((maskp) != NULL) ? MAX_NUMNODES : 0,		\
-	((maskp) != NULL) ? (maskp)->bits : NULL
+#define nodemask_pr_args(maskp)	__nodemask_pr_numnodes(maskp), \
+				__nodemask_pr_bits(maskp)
+static inline unsigned int __nodemask_pr_numnodes(const nodemask_t *m)
+{
+	return m ? MAX_NUMNODES : 0;
+}
+static inline const unsigned long *__nodemask_pr_bits(const nodemask_t *m)
+{
+	return m ? m->bits : NULL;
+}
 
 /*
  * The inline keyword gives the compiler room to decide to inline, or
-- 
2.9.0
