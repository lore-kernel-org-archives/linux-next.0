From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] mm: fix build warnings in <linux/compaction.h>
Date: Thu, 9 Jun 2016 10:06:01 -0700
Message-ID: <5759A1F9.2070302@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:44405 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752008AbcFIRGG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Jun 2016 13:06:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux MM <linux-mm@kvack.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>

From: Randy Dunlap <rdunlap@infradead.org>

Fix build warnings when struct node is not defined:

In file included from ../include/linux/balloon_compaction.h:48:0,
                 from ../mm/balloon_compaction.c:11:
../include/linux/compaction.h:237:51: warning: 'struct node' declared inside parameter list [enabled by default]
 static inline int compaction_register_node(struct node *node)
../include/linux/compaction.h:237:51: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
../include/linux/compaction.h:242:54: warning: 'struct node' declared inside parameter list [enabled by default]
 static inline void compaction_unregister_node(struct node *node)

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 include/linux/compaction.h |    1 +
 1 file changed, 1 insertion(+)

Found in linux-next but also applies to mainline.

--- linux-next-20160609.orig/include/linux/compaction.h
+++ linux-next-20160609/include/linux/compaction.h
@@ -233,6 +233,7 @@ extern int compaction_register_node(stru
 extern void compaction_unregister_node(struct node *node);
 
 #else
+struct node;
 
 static inline int compaction_register_node(struct node *node)
 {
