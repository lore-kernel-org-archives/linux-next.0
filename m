From: Matteo Croce <mcroce@redhat.com>
Subject: [PATCH] tipc: remove two unused variables
Date: Thu, 30 May 2019 11:19:52 +0200
Message-ID: <20190530091952.4108-1-mcroce@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Remove two variables which are unused after merging 6a33853c5773 and
generate the following warnings:

      CC [M]  net/tipc/sysctl.o
    net/tipc/sysctl.c:42:12: warning: ‘one’ defined but not used [-Wunused-variable]
       42 | static int one = 1;
          |            ^~~
    net/tipc/sysctl.c:41:12: warning: ‘zero’ defined but not used [-Wunused-variable]
       41 | static int zero;
          |            ^~~~

Fixes: 6a33853c5773 ("proc/sysctl: add shared variables for range check")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Matteo Croce <mcroce@redhat.com>
---
 net/tipc/sysctl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/net/tipc/sysctl.c b/net/tipc/sysctl.c
index 9df82a573aa7..180574ff3a3f 100644
--- a/net/tipc/sysctl.c
+++ b/net/tipc/sysctl.c
@@ -38,8 +38,6 @@
 
 #include <linux/sysctl.h>
 
-static int zero;
-static int one = 1;
 static struct ctl_table_header *tipc_ctl_hdr;
 
 static struct ctl_table tipc_table[] = {
-- 
2.21.0
