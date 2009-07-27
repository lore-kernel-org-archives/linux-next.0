From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] drbd: fix build when CONFIG_MODULES=n
Date: Mon, 27 Jul 2009 07:55:36 -0700
Message-ID: <20090727075536.533d1801.randy.dunlap@oracle.com>
References: <20090727180552.eb32515b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752687AbZG0O4t@vger.kernel.org>
In-Reply-To: <20090727180552.eb32515b.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, drbd-dev@lists.linbit.com
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Mon, 27 Jul 2009 18:05:52 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20090724:
> 
> New trees:
> 	drbd
> 
> The drbd tree gained two build failures for which I reverted a commit from
> the rr tree and applied a patch.
> ----------------------------------------------------------------------------


(already fixed?)

---
From: Randy Dunlap <randy.dunlap@oracle.com>

Fix drbd build when CONFIG_MODULES=n:
drivers/block/drbd/drbd_main.c:3738: error: dereferencing pointer to incomplete type

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: drbd-dev@lists.linbit.com
---
 drivers/block/drbd/drbd_main.c |    4 ++++
 1 file changed, 4 insertions(+)

--- linux-next-20090727.orig/drivers/block/drbd/drbd_main.c
+++ linux-next-20090727/drivers/block/drbd/drbd_main.c
@@ -3733,12 +3733,16 @@ const char *drbd_buildtag(void)
 
 	static char buildtag[38] = "\0uilt-in";
 
+#ifdef CONFIG_MODULES
 	if (buildtag[0] == 0) {
 		if (THIS_MODULE != NULL)
 			sprintf(buildtag, "srcversion: %-24s", THIS_MODULE->srcversion);
 		else
 			buildtag[0] = 'b';
 	}
+#else
+	buildtag[0] = 'b';
+#endif
 
 	return buildtag;
 }
