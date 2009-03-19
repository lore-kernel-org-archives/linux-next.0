From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build failure
Date: Thu, 19 Mar 2009 15:46:17 +1100
Message-ID: <20090319154617.12fed283.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34576 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751807AbZCSEq1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Mar 2009 00:46:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>, Neil Horman <nhorman@tuxdriver.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi Dave,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

In file included from net/core/skbuff.c:69:
include/trace/skb.h:4: error: expected ')' before '(' token
include/trace/skb.h:4: error: expected ')' before '(' token
include/trace/skb.h:4: warning: function declaration isn't a prototype
include/trace/skb.h: In function 'register_trace_kfree_skb':
include/trace/skb.h:4: error: 'probe' undeclared (first use in this function)
include/trace/skb.h:4: error: (Each undeclared identifier is reported only once
include/trace/skb.h:4: error: for each function it appears in.)
include/trace/skb.h: At top level:
include/trace/skb.h:4: error: expected ')' before '(' token
include/trace/skb.h:4: warning: function declaration isn't a prototype
include/trace/skb.h: In function 'unregister_trace_kfree_skb':
include/trace/skb.h:4: error: 'probe' undeclared (first use in this function)
net/core/skbuff.c: In function 'kfree_skb':
net/core/skbuff.c:446: error: implicit declaration of function 'trace_kfree_skb'

Caused by commit 2939b0469d04ba9ac791aca9a81625d7eb50662b ("tracing:
replace TP<var> with TP_<var>") from the tracing tree interacting with
commit 4893d39e865b2897bf9fcd329697d37032d853a1 ("Network Drop Monitor:
Add trace declaration for skb frees") from the net tree.

I added the merge fixup below and can carry it as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/


diff --git a/include/trace/skb.h b/include/trace/skb.h
index 3aa8646..d9679c2 100644
--- a/include/trace/skb.h
+++ b/include/trace/skb.h
@@ -2,7 +2,7 @@
 #define _TRACE_SKB_H_
 
 DECLARE_TRACE(kfree_skb,
-	TPPROTO(struct sk_buff *skb, void *location),
-	TPARGS(skb, location));
+	TP_PROTO(struct sk_buff *skb, void *location),
+	TP_ARGS(skb, location));
 
 #endif
-- 
1.6.2.1
