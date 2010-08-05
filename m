From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tty tree with the kgdb tree
Date: Thu, 5 Aug 2010 13:17:00 +1000
Message-ID: <20100805131700.5c03444c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42125 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756958Ab0HEDRC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Aug 2010 23:17:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>, Jesse Barnes <jbarnes@virtuousgeek.org>, Andy Shevchenko <ext-andriy.shevchenko@nokia.com>

Hi Greg,

Today's linux-next merge of the tty tree got a conflict in
drivers/char/vt.c between commit be6f9f80724e1684987c486c33c4eb882ba50680
("vt,console,kdb: automatically set kdb LINES variable") from the kgdb
tree and commit 46ca223803ae544fb5460bc81d961244866fcdc4 ("vt: clean up
the code - use kernel library") from the tty tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/char/vt.c
index 4a9eb30,0ecde1b..0000000
--- a/drivers/char/vt.c
+++ b/drivers/char/vt.c
@@@ -104,7 -104,7 +104,8 @@@
  #include <linux/io.h>
  #include <asm/system.h>
  #include <linux/uaccess.h>
 +#include <linux/kdb.h>
+ #include <linux/ctype.h>
  
  #define MAX_NR_CON_DRIVER 16
  
