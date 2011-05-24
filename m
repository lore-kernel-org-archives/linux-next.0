From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] kmsg_dump.h: fix build when CONFIG_PRINTK is disabled
Date: Tue, 24 May 2011 11:47:05 -0700
Message-ID: <20110524114705.16e254f1.randy.dunlap@oracle.com>
References: <20110524140212.a4f19769.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:17090 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756197Ab1EXSru (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 24 May 2011 14:47:50 -0400
In-Reply-To: <20110524140212.a4f19769.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix <linux/kmsg_dump.h> when CONFIG_PRINTK is not enabled:

include/linux/kmsg_dump.h:56: error: 'EINVAL' undeclared (first use in this function)
include/linux/kmsg_dump.h:61: error: 'EINVAL' undeclared (first use in this function)

Looks like previous commit:
commit 595dd3d8bf953254d8d2f30f99c54fe09c470040
Author: Randy Dunlap <randy.dunlap@oracle.com>
Date:   Tue Dec 1 10:52:02 2009 -0800

    kmsg_dump: fix build for CONFIG_PRINTK=n

uses EINVAL without having the needed header file(s),
but I'm sure that I build tested that patch also.  oh well.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 include/linux/kmsg_dump.h |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20110524.orig/include/linux/kmsg_dump.h
+++ linux-next-20110524/include/linux/kmsg_dump.h
@@ -12,6 +12,7 @@
 #ifndef _LINUX_KMSG_DUMP_H
 #define _LINUX_KMSG_DUMP_H
 
+#include <linux/errno.h>
 #include <linux/list.h>
 
 enum kmsg_dump_reason {
