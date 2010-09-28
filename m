From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] fs.h: fix functions for FILE_LOCKING disabled
Date: Tue, 28 Sep 2010 09:54:56 -0700
Message-ID: <20100928095456.4b390540.randy.dunlap@oracle.com>
References: <20100928141823.8c61000e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:56086 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754534Ab0I1QzN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 28 Sep 2010 12:55:13 -0400
In-Reply-To: <20100928141823.8c61000e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix function signature warning when CONFIG_FILE_LOCKING is disabled.

include/linux/fs.h:1275: warning: function declaration isn't a prototype
include/linux/fs.h:1279: warning: function declaration isn't a prototype

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 include/linux/fs.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20100927.orig/include/linux/fs.h
+++ linux-next-20100927/include/linux/fs.h
@@ -1271,11 +1271,11 @@ static inline int lock_may_write(struct 
 	return 1;
 }
 
-static inline void lock_flocks()
+static inline void lock_flocks(void)
 {
 }
 
-static inline void unlock_flocks()
+static inline void unlock_flocks(void)
 {
 }
 
