From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: Tonnes of new sparse warnings next-20080820
Date: Wed, 20 Aug 2008 13:12:53 -0700
Message-ID: <1219263173.27981.7.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.173]:52062 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753258AbYHTUMx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Aug 2008 16:12:53 -0400
Received: by wf-out-1314.google.com with SMTP id 27so749883wfd.4
        for <linux-next@vger.kernel.org>; Wed, 20 Aug 2008 13:12:52 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eduard Munteanu <eduard.munteanu@linux360.ro>
Cc: Ingo Molnar <mingo@elte.hu>, Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>, Al Viro <viro@ZenIV.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, linux-next <linux-next@vger.kernel.org>

All of the form:

include/linux/kmemtrace.h:33:2: warning: cast from restricted gfp_t
The cast to unsigned long will need __force to avoid this warning as
gfp_t is a bitwise type.

include/linux/kmemtrace.h:33:2: warning: Initializer entry defined twice
include/linux/kmemtrace.h:33:2:   also defined here
This occurs at every occurance of trace_mark(), haven't dug into it yet
to fix it.

Dumb-patch for the first warning below:

From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: [PATCH] kmemtrace: gfp_t is a __bitwise_ type, add __force to cast

Fixes sparse warnings of the form:
include/linux/kmemtrace.h:33:2: warning: cast from restricted gfp_t

Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
---
 include/linux/kmemtrace.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/kmemtrace.h b/include/linux/kmemtrace.h
index 5bea8ea..ab542aa 100644
--- a/include/linux/kmemtrace.h
+++ b/include/linux/kmemtrace.h
@@ -34,7 +34,7 @@ static inline void kmemtrace_mark_alloc_node(enum kmemtrace_type_id type_id,
 		   "bytes_req %lu bytes_alloc %lu gfp_flags %lu node %d",
 		   type_id, call_site, (unsigned long) ptr,
 		   (unsigned long) bytes_req, (unsigned long) bytes_alloc,
-		   (unsigned long) gfp_flags, node);
+		   (__force unsigned long) gfp_flags, node);
 }
 
 static inline void kmemtrace_mark_free(enum kmemtrace_type_id type_id,
-- 
1.6.0.284.ga408
