From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH next] Stagging: pohmelfs/net.c: include vmalloc.h
Date: Fri, 13 Feb 2009 17:35:32 +0300
Message-ID: <20090213143532.GA7266@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757040AbZBMOfy@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: zbr@ioremap.net, gregkh@suse.de, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

on Sparc64:
drivers/staging/pohmelfs/net.c:33: error: implicit declaration of function 'vmalloc'
drivers/staging/pohmelfs/net.c:42: error: implicit declaration of function 'vfree'

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 drivers/staging/pohmelfs/net.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/pohmelfs/net.c b/drivers/staging/pohmelfs/net.c
index d161237..c9b8540 100644
--- a/drivers/staging/pohmelfs/net.c
+++ b/drivers/staging/pohmelfs/net.c
@@ -22,6 +22,7 @@
 #include <linux/poll.h>
 #include <linux/swap.h>
 #include <linux/syscalls.h>
+#include <linux/vmalloc.h>

 #include "netfs.h"
