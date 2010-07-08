From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] tracing: writeback.h needs device.h
Date: Thu, 8 Jul 2010 13:55:51 -0700
Message-ID: <20100708135551.ef5778e2.randy.dunlap@oracle.com>
References: <20100708151022.d2517577.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:54247 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753765Ab0GHU4n (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Jul 2010 16:56:43 -0400
In-Reply-To: <20100708151022.d2517577.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@redhat.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

include/trace/events/writeback.h uses dev_name(), so it needs to
include linux/device.h.

include/trace/events/writeback.h:12: error: implicit declaration of function 'dev_name'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 include/trace/events/writeback.h |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20100708.orig/include/trace/events/writeback.h
+++ linux-next-20100708/include/trace/events/writeback.h
@@ -5,6 +5,7 @@
 #define _TRACE_WRITEBACK_H
 
 #include <linux/backing-dev.h>
+#include <linux/device.h>
 #include <linux/writeback.h>
 
 struct wb_writeback_work;
