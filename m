From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the moduleh tree with Linus' tree
Date: Tue, 2 Aug 2011 14:52:37 +1000
Message-ID: <20110802145237.e8b90cff7f6954f6a12d8b3b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>
List-Id: linux-next.vger.kernel.org

Hi Paul,

Today's linux-next merge of the moduleh tree got a conflict in
drivers/video/omap2/dss/rfbi.c between commit 24e6289c029b ("OMAP: DSS2:
remove extra includes from include/video/omapdss.h") from Linus' tree and
commit 06e632e042aa ("video: Add export.h for THIS_MODULE/EXPORT_SYMBOL
to drivers/video") from the moduleh tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/video/omap2/dss/rfbi.c
index 39f4c59,5dbd229..0000000
--- a/drivers/video/omap2/dss/rfbi.c
+++ b/drivers/video/omap2/dss/rfbi.c
@@@ -33,8 -33,7 +33,9 @@@
  #include <linux/hrtimer.h>
  #include <linux/seq_file.h>
  #include <linux/semaphore.h>
 +#include <linux/platform_device.h>
 +#include <linux/pm_runtime.h>
+ #include <linux/export.h>
  
  #include <video/omapdss.h>
  #include "dss.h"
